import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

//TODO refactor to make less requests
import 'package:jam/config/config.dart';
import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';

class PowerSyncJamService {
  Future<(Users users, Vibes vibes)> getJamParticipantsAndVibes({
    required int jamId,
  }) async {
    try {
      final vibes = (await PowerSync.db.getAll(
        PowerSyncJamQueries.GET_JAM_VIBES,
        [jamId],
      ))
          .map(PowerSyncRowParser.parseVibes)
          .toList();

      return (await getJamParticipants(jamId: jamId), vibes);
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future<JamModel> getJam({required int jamId}) async {
    try {
      final jamRow = await PowerSync.db.get(
        PowerSyncJamQueries.GET_JAM_BY_ID,
        [jamId],
      );
      final jam = PowerSyncRowParser.parseJam(jamRow);
      final (participants, vibes) = await getJamParticipantsAndVibes(
        jamId: jamId,
      );
      return jam.copyWith(relatedVibes: vibes, participants: participants);
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future<Jams> getActiveOwnerJams({required String userId}) async {
    try {
      final jamIdRows = await PowerSync.db.getAll(
        PowerSyncJamQueries.GET_ACTIVE_OWNER_JAM_IDS,
        [userId, DateTime.now().toString()],
      );

      final jamIds = jamIdRows.map((e) => int.parse(e['id'])).toList();

      return Future.wait(jamIds.map((id) async => await getJam(jamId: id)));
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future<Jams> getParticipatedOutdatedJamsByUserId({
    required String userId,
  }) async {
    try {
      final jamIdRows = await PowerSync.db.getAll(
        PowerSyncJamQueries.GET_OUTDATED_JAM_IDS_BY_USER_ID,
        [userId, userId],
      );

      final jamIds = jamIdRows.map((e) => int.parse(e['id'])).toList();

      return Future.wait(jamIds.map((id) async => await getJam(jamId: id)));
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future<Jams> getActiveParticipatedJamsByUserId({
    required String userId,
  }) async {
    try {
      final jamIdRows = await PowerSync.db.getAll(
        PowerSyncJamQueries.GET_ACTIVE_PARTICPATED_JAMS_IDS_BY_USER_ID,
        [userId, DateTime.now().toString()],
      );

      final jamIds = jamIdRows.map((e) => int.parse(e['id'])).toList();

      return Future.wait(jamIds.map((id) async => await getJam(jamId: id)));
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future<Users> getJamParticipants({required int jamId}) async {
    try {
      final jamParticipantRows = await PowerSync.db.getAll(
        PowerSyncJamQueries.GET_JAM_PARTICIPATNS,
        [jamId],
      );

      return jamParticipantRows
          .map(PowerSyncRowParser.parseJamParticipant)
          .toList();
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future<IdsWithNames> getJamNamesByIds({
    required Integers jamIds,
  }) async {
    try {
      final rows = await PowerSync.db.getAll(
        PowerSyncJamQueries.GET_JAM_NAMES_BY_IDS,
        [jamIds],
      );

      return rows
          .map((e) => (int.parse(e['id']), e['name'] as String))
          .toList();
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}

final powersyncJamServiceProvider = Provider<PowerSyncJamService>(
  (ref) => PowerSyncJamService(),
);
