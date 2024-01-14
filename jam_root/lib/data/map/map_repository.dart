import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/application/application.dart';
import 'package:jam/config/config.dart';
import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';

final class MapRepository extends MapRepositoryInterface
    with SupabaseUserGetter {
  MapRepository({required this.eventService});

  static const GET_USERS_WITH_SAME_VIBES_LOCATIONS_RPC =
      'get_users_with_same_vibes_locations';
  static const GET_JAM_LOCATIONS_RPC = 'get_jams_locations';

  @override
  final EventServiceInterface<Locations, Event> eventService;

  @override
  Stream<Locations> getMapData$({
    required double userLatitude,
    required double userLongitude,
  }) async* {
    final userId = getUserIdOrThrow();

    final jamLocations = await fetchJamLocations(
      userLocation: "POINT($userLatitude $userLongitude)",
    );

    final userLocations = await fetchUserLocations(
      userLocation: "POINT($userLatitude $userLongitude)",
    );

    yield* eventService.getEvents$(
      channelIdentifier: userId,
      data: {
        'jams': jamLocations.map((e) => e.toJson()).toList(),
        'users': userLocations.map((e) => e.toJson()).toList()
      },
    );
  }

  Future<UserLocations> fetchUserLocations({
    required String userLocation,
  }) async {
    final userId = getUserIdOrThrow();

    final response = await supabase.rpc(
      GET_USERS_WITH_SAME_VIBES_LOCATIONS_RPC,
      params: {'userid': userId, 'userlocation': userLocation},
    ) as Dynamics;

    final parsedData = response.isEmpty
        ? UserLocations.empty()
        : response.map((e) => UserLocation.fromJson(e)).toList();

    return parsedData
        .map(
          (e) => e.copyWith(
            marker: e.isFriend
                ? JamMarker.getUserMarker()
                : JamMarker.getFriendsMarker(),
          ),
        )
        .toList();
  }

  Future<JamLocations> fetchJamLocations({
    required String userLocation,
  }) async {
    final userId = getUserIdOrThrow();
    final response = await supabase.rpc(
      GET_JAM_LOCATIONS_RPC,
      params: {'userid': userId, 'userlocation': userLocation},
    ) as Dynamics;

    final parsedData = response.isEmpty
        ? JamLocations.empty()
        : response.map((e) => JamLocation.fromJson(e)).toList();

    return parsedData
        .map(
          (e) => e.copyWith(
            marker: e.creatorId == userId
                ? JamMarker.getUserJamMarker()
                : JamMarker.getJamMarker(),
          ),
        )
        .toList();
  }

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
}

final mapRepositoryProvider = Provider<MapRepositoryInterface>(
  (ref) => MapRepository(
    eventService: ref.read(supabaseMapEventServiceProvider),
  ),
);
