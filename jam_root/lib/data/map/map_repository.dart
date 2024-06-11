import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jam/application/application.dart';
import 'package:jam/config/config.dart';
import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:location/location.dart';

final class MapRepository extends MapRepositoryInterface
    with SupabaseUserGetter {
  MapRepository();

  static const GET_USERS_WITH_SAME_VIBES_LOCATIONS_RPC =
      'get_users_with_same_vibes_locations';

  @override
  Future<void> updateUserLocation({
    required double latitude,
    required double longitude,
  }) async {
    final point = GeoPacker.encodePoint(lat: latitude, lon: longitude);

    return await supabase.from('user_locations').update({'location': point}).eq(
      'id',
      getUserIdOrThrow(),
    );
  }

  @override
  Future<UsersJamsLocations> getUserAndJamsLocations({
    double? userLatitude,
    double? userLongitude,
  }) async {
    try {
      final userId = getUserIdOrThrow();

      // final stopwatch = Stopwatch()..start();
      final lc = await Location.instance.getLocation();
      final a = 'POINT(${lc.latitude} ${lc.longitude})';

      final payload = {'userid': userId, 'userlocation': a};

      final response = await supabase.rpc(
        'get_users_and_jams',
        params: payload,
      );
      final data = (response as Dynamics).first as Json;
      // final elapsedMilliseconds = stopwatch.elapsedMilliseconds;
      // print('Query execution time: $elapsedMilliseconds ms');

      return _mapToLocationModels(data, userId);
    } catch (e) {
      debugPrint('asdfjkal;');
      rethrow;
    }
  }

  UsersJamsLocations _mapToLocationModels(Json response, String userId) {
    final friendsMarker = JamMarker.getFriendsMarker();
    final userMarker = JamMarker.getUserMarker();
    final jamMarker = JamMarker.getJamMarker();
    final userJamMarker = JamMarker.getUserJamMarker();
    final rawUsers = response['users'] as List<dynamic>?;
    final rawJams = response['jams'] as List<dynamic>?;

    getUserMarker(bool isFriend) => isFriend ? friendsMarker : userMarker;
    getJamMarker(bool isOwner) => isOwner ? userJamMarker : jamMarker;

    final users = rawUsers
        ?.map(
          (userRaw) => UserLocation.fromJson(userRaw).copyWith(
            marker: getUserMarker(userRaw['is_friend'] as bool),
          ),
        )
        .toList();

    final jams = rawJams
        ?.map(
          (jamRaw) => JamLocation.fromJson(jamRaw).copyWith(
            marker: getJamMarker(jamRaw['creator_id'] == userId),
          ),
        )
        .toList();

    return (users: users ?? const [], jams: jams ?? const []);
  }
}

final mapRepositoryProvider = Provider<MapRepositoryInterface>(
  (ref) => MapRepository(),
);
