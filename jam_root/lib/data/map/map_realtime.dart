import 'package:flutter/foundation.dart';
import 'package:geocoding/geocoding.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/data/data.dart';
import 'package:rxdart/rxdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:jam/application/application.dart';
import 'package:jam/config/config.dart';
import 'package:jam/domain/domain.dart';

class MapRealtime
    with Storer, SupabaseUserGetter
    implements MapRealtimeInterface {
  final _contoller = BehaviorSubject<UsersJamsLocations>();
  RealtimeChannel? _socket;

  @override
  final MapRepositoryInterface repo;

  MapRealtime({required this.repo});

  @override
  Stream<UsersJamsLocations> get$({
    String? channelIdentifier,
  }) async* {
    final (users: users, jams: jams) = await repo.getUserAndJamsLocations();

    _socket = supabase
        .channel('locations-$channelIdentifier')
        .onPostgresChanges(
          event: PostgresChangeEvent.all,
          callback: _handleUserLocationEvents,
          table: 'user_locations',
          filter: PostgresChangeFilter(
            type: PostgresChangeFilterType.inFilter,
            column: 'id',
            value: users.map((e) => e.id).toList(),
          ),
        )
        .onPostgresChanges(
          event: PostgresChangeEvent.all,
          callback: _handleJamLocationEvents,
          table: 'jams',
          filter: PostgresChangeFilter(
            type: PostgresChangeFilterType.inFilter,
            column: 'id',
            value: jams.map((e) => e.id).toList(),
          ),
        )

        ///
        /// JAM MAP EVENTS
        ///
        .onBroadcast(
          event: RealTime.JAM_CREATED_MAP_EVENT,
          callback: (data) {
            final newJam = JamLocation.fromJson(data);
            final userVibes = get<UserProfileModel>()!.vibes;
            final hasCommonVibe =
                userVibes.intersectById(newJam.vibes).isNotEmpty;

            if (!hasCommonVibe) return;

            _contoller.value = (
              users: users,
              jams: jams
                ..add(
                  newJam.copyWith(
                    marker: JamMarker.getJamMarker(),
                  ),
                ),
            );
          },
        )
        .onBroadcast(
          event: RealTime.JAM_DELETED_MAP_EVENT,
          callback: (data) {
            if (!_contoller.value.jams.any((j) => j.id == data['jam_id'])) {
              return;
            }

            _contoller.value = (
              users: users,
              jams: jams.where((j) => j.id != data['jam_id']).toList(),
            );
          },
        )
        .onBroadcast(
          event: RealTime.JAM_UPDATED_MAP_EVENT,
          callback: (data) {
            if (!_contoller.value.jams.any((j) => j.id == data['jam_id'])) {
              return;
            }
            final updatedJam = JamLocation.fromJson(data);
            _contoller.value = (
              users: users,
              jams: jams
                ..where((j) => j.id != data['jam_id'])
                ..add(
                  updatedJam.copyWith(
                    marker: updatedJam.creatorId == getUserIdOrThrow()
                        ? JamMarker.getUserJamMarker()
                        : JamMarker.getJamMarker(),
                  ),
                ),
            );
          },
        )

        ///
        /// USER MAP EVENTS
        ///
        // .onBroadcast(
        //   event: RealTime.USER_CHANGED_MAP_VISIBILITY_MAP_EVENT,
        //   callback: (data) {
        //     final isUserInList = !_contoller.value.users.any(
        //       (u) => u.id == data['user_id'],
        //     );

        //     final privacy = PrivacyBoundaries.fromIndex(
        //       data['privacy_boundaries'],
        //     );

        //     final userId = getUserIdOrThrow();

        //     switch (privacy) {
        //       case PrivacyBoundaries.noOne:
        //         _contoller.value = (
        //           users: users.where((u) => u.id != data['user_id']).toList(),
        //           jams: jams,
        //         );
        //         break;
        //       case PrivacyBoundaries.friendsOnly:
        //         final friendIds = List<String>.from(data['friend_ids']);
        //         final isFriend = friendIds.contains(userId);

        //         if (isFriend && isUserInList || !isFriend && !isUserInList) {
        //           return;
        //         }

        //         if (!isFriend && isUserInList) {
        //           _contoller.value = (
        //             users: users.where((u) => u.id != data['user_id']).toList(),
        //             jams: jams,
        //           );
        //           return;
        //         }

        //         final updatedUsers = _contoller.value.users
        //             .where((u) => u.id != data['user_id'])
        //             .toList();

        //         _contoller.value = (
        //           users: [...updatedUsers, UserLocation.fromJson(data)],
        //           jams: jams,
        //         );
        //       case PrivacyBoundaries.rangeOfUsers:
        //         final exceptionUserList =
        //             List<String>.from(data['exception_user_list']);
        //         final isException = exceptionUserList.contains(userId);

        //         if (isException && isUserInList ||
        //             !isException && !isUserInList) {
        //           return;
        //         }

        //         if (isException && isUserInList) {
        //           _contoller.value = (
        //             users: users.where((u) => u.id != data['user_id']).toList(),
        //             jams: jams,
        //           );
        //           return;
        //         }

        //         final updatedUsers = _contoller.value.users
        //             .where((u) => u.id != data['user_id'])
        //             .toList();

        //         _contoller.value = (
        //           users: [...updatedUsers, UserLocation.fromJson(data)],
        //           jams: jams,
        //         );
        //         break;
        //       default:
        //     }
        //   },
        // )
        .onBroadcast(
          event: RealTime.USER_UPDATED_VIBES_MAP_EVENT,
          callback: (data) {
            final userLocation = UserLocation.fromJson(data);

            final hasCommonVibe = get<UserProfileModel>()!
                .vibes
                .intersectById(userLocation.vibes)
                .isNotEmpty;

            final userIsInList = _contoller.value.users.any(
              (u) => u.id == userLocation.id,
            );

            if (!hasCommonVibe && !userIsInList) return;

            final updatedUsers = _contoller.value.users
                .where((u) => u.id != userLocation.id)
                .toList();

            _contoller.value = (
              users: hasCommonVibe
                  ? [...updatedUsers, userLocation]
                  : updatedUsers,
              jams: jams,
            );
          },
        )
        .subscribe(
      (e, _) {
        debugPrint(e.name);
      },
    );

    _contoller.value = (
      users: users,
      jams: jams,
    );

    yield* _contoller.stream;
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
    final oldData = _contoller.value;

    final updatedState = (
      jams: oldData.jams,
      users: oldData.users.where((el) => el.id != e.newRecord['id']).toList()
        ..add(model),
    );

    _contoller.value = updatedState;
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
    final oldData = _contoller.value;

    final updatedState = (
      jams: oldData.jams.where((el) => el.id != e.newRecord['id']).toList(),
      users: oldData.users,
    );

    _contoller.value = updatedState;
  }

  void _handleUpdateJamEvent(PostgresChangePayload e) {
    final model = JamLocation.fromJson(
      e.newRecord
        ..['latitude'] = e.newRecord['lat']
        ..['longitude'] = e.newRecord['lon'],
    );

    final oldData = _contoller.value;

    final updatedState = (
      jams: oldData.jams.where((el) => el.id != e.newRecord['id']).toList()
        ..add(model),
      users: oldData.users,
    );

    _contoller.value = updatedState;
  }

  void _handleInsertJamEvent(PostgresChangePayload e) {
    ///
    ///no op as tracked only specific jam ids
    ///to get new jam has to press update button
    ///
  }
  void _handleInsertUserEvent(PostgresChangePayload e) {
    ///
    ///no op as tracked only specific user ids
    ///
    ///
  }

  @override
  void dispose() {
    throw UnimplementedError();
  }

  @override
  Future<void> fireEvent(MapEvent event) async {
    if (_socket != null) {
      await _socket!.sendBroadcastMessage(
        event: event.eventName,
        payload: event.payload ?? {},
      );
      return;
    }

    ///
    /// triggers when map was not opened
    ///
    final placemarks = await placemarkFromCoordinates(
      event.latitude,
      event.longitude,
    );

    final city = placemarks.firstOrNull?.locality;
    if (city == null) return;

    _pushAndDie = supabase.channel('locations-$city').subscribe(
      (e, _) async {
        if (e == RealtimeSubscribeStatus.subscribed) {
          await _pushAndDie!.sendBroadcastMessage(
            event: event.eventName,
            payload: event.payload ?? {},
          );

          _pushAndDie!.unsubscribe();
        }
      },
      const Duration(seconds: 5),
    );
  }
}

RealtimeChannel? _pushAndDie;

final mapRealtimeProvider = Provider<MapRealtimeInterface>(
  (ref) => MapRealtime(repo: ref.read(mapRepositoryProvider)),
);

final locationsStreamProvider = StreamProvider<UsersJamsLocations>(
  (ref) => ref.read(mapRealtimeProvider).get$(),
);
