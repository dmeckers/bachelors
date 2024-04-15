// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:jam/config/config.dart';
import 'package:jam/data/data.dart';
import 'package:jam/domain/offline_support/offline_data_schema.dart';
import 'package:powersync/powersync.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

/// Postgres Response codes that we cannot recover from by retrying.
final List<RegExp> fatalResponseCodes = [
  // Class 22 — Data Exception
  // Examples include data type mismatch.
  RegExp(r'^22...$'),
  // Class 23 — Integrity Constraint Violation.
  // Examples include NOT NULL, FOREIGN KEY and UNIQUE violations.
  RegExp(r'^23...$'),
  // INSUFFICIENT PRIVILEGE - typically a row-level security violation
  RegExp(r'^42501$'),
];

/// Global reference to the database
late final PowerSyncDatabase _database;

/// Use Supabase for authentication and data upload.
class SupabaseConnector extends PowerSyncBackendConnector {
  // ignore: unused_field, prefer_final_fields
  PowerSyncDatabase _db;

  Future<void>? _refreshFuture;

  SupabaseConnector(this._db);

  /// Get a Supabase token to authenticate against the PowerSync instance.
  @override
  Future<PowerSyncCredentials?> fetchCredentials() async {
    // Wait for pending session refresh if any
    await _refreshFuture;

    // Use Supabase token for PowerSync
    final session = Supabase.instance.client.auth.currentSession;
    if (session == null) {
      // Not logged in
      return null;
    }

    // Use the access token to authenticate against PowerSync
    final token = session.accessToken;

    // userId and expiresAt are for debugging purposes only
    final userId = session.user.id;
    final expiresAt = session.expiresAt == null
        ? null
        : DateTime.fromMillisecondsSinceEpoch(session.expiresAt! * 1000);
    return PowerSyncCredentials(
      endpoint: dotenv.get(EnvironmentConstants.POWERSYNC_INSTANCE_URL),
      token: token,
      userId: userId,
      expiresAt: expiresAt,
    );
  }

  @override
  void invalidateCredentials() {
    // Trigger a session refresh if auth fails on PowerSync.
    // Generally, sessions should be refreshed automatically by Supabase.
    // However, in some cases it can be a while before the session refresh is
    // retried. We attempt to trigger the refresh as soon as we get an auth
    // failure on PowerSync.
    //
    // This could happen if the device was offline for a while and the session
    // expired, and nothing else attempt to use the session it in the meantime.
    //
    // Timeout the refresh call to avoid waiting for long retries,
    // and ignore any errors. Errors will surface as expired tokens.
    _refreshFuture = Supabase.instance.client.auth
        .refreshSession()
        .timeout(const Duration(seconds: 5))
        .then((response) => null, onError: (error) => null);
  }

  // Upload pending changes to Supabase.
  @override
  Future<void> uploadData(PowerSyncDatabase database) async {
    // This function is called whenever there is data to upload, whether the
    // device is online or offline.
    // If this call throws an error, it is retried periodically.
    final transaction = await database.getNextCrudTransaction();
    if (transaction == null) {
      return;
    }

    final rest = Supabase.instance.client.rest;
    // CrudEntry? lastOp;
    try {
      // Note: If transactional consistency is important, use database functions
      // or edge functions to process the entire transaction in a single call.
      for (var op in transaction.crud) {
        // lastOp = op;
        final table = rest.from(op.table);
        if (op.op == UpdateType.put) {
          final handler = PowerSyncDispatcherResolver.resolveInsert(op);
          await handler(rest, op);
        } else if (op.op == UpdateType.patch) {
          final handler = PowerSyncDispatcherResolver.resolveUpdate(op);
          await handler(rest, op);
        } else if (op.op == UpdateType.delete) {
          await table.delete().eq('id', op.id);
        }
      }

      // All operations successful.
      await transaction.complete();
    } on PostgrestException catch (e) {
      if (e.code != null &&
          fatalResponseCodes.any((re) => re.hasMatch(e.code!))) {
        /// Instead of blocking the queue with these errors,
        /// discard the (rest of the) transaction.
        ///
        /// Note that these errors typically indicate a bug in the application.
        /// If protecting against data loss is important, save the failing records
        /// elsewhere instead of discarding, and/or notify the user.
        await transaction.complete();
      } else {
        debugPrint(e.message);
        // Error may be retryable - e.g. network error or temporary server error.
        // Throwing an error here causes this call to be retried after a delay.
        rethrow;
      }
    }
  }
}

class PowerSync {
  static PowerSyncDatabase get db => _database;
  static bool isLoggedIn() {
    return Supabase.instance.client.auth.currentSession?.accessToken != null;
  }

  /// id of the user currently logged in
  String? getUserId() {
    return Supabase.instance.client.auth.currentSession?.user.id;
  }

  static Future<String> getDatabasePath() async {
    final dir = await getApplicationSupportDirectory();
    return join(dir.path, 'jam-powersync.db');
  }

  static Future<void> initialize() async {
    // Open the local database
    _database = PowerSyncDatabase(
      schema: schema,
      path: await getDatabasePath(),
      logger: attachedLogger,
    );

    await _database.initialize();
    await initializeJamAttachementQueue();

    SupabaseConnector? currentConnector;

    if (isLoggedIn()) {
      // If the user is already logged in, connect immediately.
      // Otherwise, connect once logged in.
      currentConnector = SupabaseConnector(_database);
      _database.connect(connector: currentConnector);
    }
    //TODO not sure about this one
    // ProviderContainer().listen(connectivityStatusProvider,
    //     (previous, next) async {
    //   if (next == ConnectionStatus.isDisconnected) {
    //     currentConnector = null;
    //     await _database.disconnect();
    //   }

    //   if (next == ConnectionStatus.isConnected) {
    //     currentConnector = SupabaseConnector(_database);
    //     _database.connect(connector: currentConnector!);
    //   }
    // });

    Supabase.instance.client.auth.onAuthStateChange.listen((data) async {
      final AuthChangeEvent event = data.event;
      if (event == AuthChangeEvent.signedIn) {
        // Connect to PowerSync when the user is signed in
        currentConnector = SupabaseConnector(_database);
        await _database.connect(connector: currentConnector!);
        // await prefetchData();
      } else if (event == AuthChangeEvent.signedOut) {
        // Implicit sign out - disconnect, but don't delete data
        currentConnector = null;
        _database.disconnectAndClear();
      } else if (event == AuthChangeEvent.tokenRefreshed) {
        // Supabase token refreshed - trigger token refresh for PowerSync.
        currentConnector?.prefetchCredentials();
      }
    });
  }

  // static Future<void> prefetchData() async {
  //   await _database.get(
  //     PowerSyncProfileQueries.GET_USER_PROFILE,
  //     [supabase.auth.currentUser!.id],
  //   );
  //   await _database.get(
  //     PowerSyncMessagingQueries.QUERY_GET_CHATS(
  //       userId: supabase.auth.currentUser!.id,
  //     ),
  //   );
  // }
}
