import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/application/application.dart';
import 'package:jam/config/config.dart';
import 'package:jam/domain/domain.dart';
import 'package:rxdart/rxdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseMapEventsService
    implements EventServiceInterface<Locations, Event> {
  final BehaviorSubject<Locations> _contoller = BehaviorSubject<Locations>();

  @override
  Future<void> fireEvent(Event event) {
    throw UnimplementedError();
  }

  @override
  Stream<Locations> getEvents$({
    String? channelIdentifier,
    dynamic data,
  }) {
    final params = data as Json?;
    _checkArguments(params);
    final users = params!['users'] as Jsons;
    final jams = params['jams'] as Jsons;

    supabase
        .channel('locations-$channelIdentifier')
        .onPostgresChanges(
          event: PostgresChangeEvent.all,
          callback: _handleUserLocationEvents,
          table: 'user_locations',
          filter: PostgresChangeFilter(
            type: PostgresChangeFilterType.inFilter,
            column: 'id',
            value: users.map((e) => e['id']).toList(),
          ),
        )
        .onPostgresChanges(
          event: PostgresChangeEvent.all,
          callback: _handleJamLocationEvents,
          table: 'jams',
          filter: PostgresChangeFilter(
            type: PostgresChangeFilterType.inFilter,
            column: 'id',
            value: jams.map((e) => e['id']).toList(),
          ),
        )
        .subscribe(
      (e, _) {
        debugPrint(e.name);
      },
    );

    _contoller.value = [
      ...users.map((e) => UserLocation.fromJson(e)),
      ...jams.map((e) => JamLocation.fromJson(e)),
    ];

    return _contoller.stream.asBroadcastStream();
  }

  _handleUserLocationEvents(PostgresChangePayload payload) {
    final cb = switch (payload.eventType) {
      PostgresChangeEvent.delete => _handleDeleteEvent,
      PostgresChangeEvent.insert => _handleInsertUserEvent,
      PostgresChangeEvent.update => _handleUpdateUserEvent,
      _ => throw UnimplementedError(),
    };

    cb(payload);
  }

  void _handleUpdateUserEvent(PostgresChangePayload e) {
    final model = UserLocation.fromJson(
      e.newRecord
        ..['latitude'] = e.newRecord['lat']
        ..['longitude'] = e.newRecord['lon'],
    );

    _contoller.add(
      _contoller.value.where((el) => el.id != e.newRecord['id']).toList()
        ..add(model),
    );
  }

  void _handleInsertUserEvent(PostgresChangePayload e) {
    ///
    ///no op as tracked only specific user ids
    ///to get new user has to restart page (TODO::pull to refresh)
    ///
  }

  _handleJamLocationEvents(PostgresChangePayload payload) {
    final cb = switch (payload.eventType) {
      PostgresChangeEvent.delete => _handleDeleteEvent,
      PostgresChangeEvent.insert => _handleInsertJamEvent,
      PostgresChangeEvent.update => _handleUpdateJamEvent,
      _ => throw UnimplementedError(),
    };

    cb(payload);
  }

  void _handleDeleteEvent(PostgresChangePayload e) {
    _contoller.add(
      _contoller.value
          .where((element) => element.id != e.oldRecord['id'])
          .toList(),
    );
  }

  void _handleInsertJamEvent(PostgresChangePayload e) {
    ///
    ///no op as tracked only specific jam ids
    ///to get new jam has to press update button
    ///
  }

  void _handleUpdateJamEvent(PostgresChangePayload e) {
    final model = JamLocation.fromJson(
      e.newRecord
        ..['latitude'] = e.newRecord['lat']
        ..['longitude'] = e.newRecord['lon'],
    );

    _contoller.add(
      _contoller.value.where((el) => el.id != e.newRecord['id']).toList()
        ..add(model),
    );
  }

  _checkArguments(Json? params) {
    if ((params?.containsKey('users') ?? false) &&
        (params?.containsKey('jams') ?? false)) return;

    throw ArgumentError('params must contain both users and jams');
  }
}

final supabaseMapEventServiceProvider =
    Provider<EventServiceInterface<Locations, Event>>(
  (ref) => SupabaseMapEventsService(),
);
