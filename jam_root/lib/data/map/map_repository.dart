import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jam/application/application.dart';
import 'package:jam/config/config.dart';
import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';

final class MapRepository extends MapRepositoryInterface
    with SupabaseUserGetter {
  MapRepository(this._ref);

  static const GET_USERS_WITH_SAME_VIBES_LOCATIONS_RPC =
      'get_users_with_same_vibes_locations';

  final ProviderRef _ref;

  @override
  Future<void> updateUserLocation({
    required double latitude,
    required double longitude,
  }) async =>
      await supabase
          .from('user_locations')
          .update({'location': 'POINT($latitude $longitude)'}).eq(
        'id',
        getUserIdOrThrow(),
      );

  @override
  Future<UsersJamsLocations> getUserAndJamsLocations({
    double? userLatitude,
    double? userLongitude,
  }) async {
    final userId = getUserIdOrThrow();

    final usersLocation = await _ref.read(locatorServiceProvider).getLocation();

    final response = (await supabase.rpc('get_users_and_jams', params: {
      'userid': userId,
      'userlocation':
          'POINT(${usersLocation.latitude} ${usersLocation.longitude})'
    }) as Dynamics)
        .first as Json;

    return _mapToLocationModels(response, userId);
  }

  UsersJamsLocations _mapToLocationModels(Json response, String userId) {
    final users = List<UserLocation>.empty(growable: true);
    final jams = List<JamLocation>.empty(growable: true);

    if (response['users'] != null) {
      for (final userRaw in response['users']) {
        final user = UserLocation.fromJson(userRaw);

        users.add(
          user.copyWith(
            marker: user.isFriend
                ? JamMarker.getFriendsMarker()
                : JamMarker.getUserMarker(),
          ),
        );
      }
    }

    if (response['jams'] != null) {
      for (final jamRaw in response['jams']) {
        final jam = JamLocation.fromJson(jamRaw);

        jams.add(
          jam.copyWith(
            marker: jam.creatorId == userId
                ? JamMarker.getUserJamMarker()
                : JamMarker.getJamMarker(),
          ),
        );
      }
    }

    return (users: users, jams: jams);
  }
}

final mapRepositoryProvider = Provider<MapRepositoryInterface>(
  (ref) => MapRepository(ref),
);
