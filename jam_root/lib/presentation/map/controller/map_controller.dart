import 'package:flutter_google_maps_webservices/places.dart' as places;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam_utils/jam_utils.dart';
import 'package:location/location.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:jam/data/data.dart';

part 'map_controller.g.dart';

final locatorServiceProvider = Provider<Location>((ref) => Location());

final currentLocationStreamProvider = StreamProvider(
  (ref) =>
      ref.read(locatorServiceProvider).onLocationChanged.asBroadcastStream(),
);

@riverpod
Future<FriendShipStatusModel> checkRelationShipStatus(
  CheckRelationShipStatusRef ref, {
  required String userId,
}) async =>
    await ref
        .read(socialRepositoryProvider)
        .getRelationshipStatus(userId: userId);

@riverpod
Future<bool> sendFriendInvite(
  SendFriendInviteRef ref, {
  required String userId,
}) async =>
    await ref.read(socialRepositoryProvider).sendFriendInvite(userId: userId);

@riverpod
Future<bool> joinJamFromMap(
  JoinJamFromMapRef ref, {
  required int jamId,
}) async =>
    await ref.read(jamRepositoryProvider).joinJam(jamId: jamId);

typedef MapWidgetsStates = ({
  LatLng? selectedPlace,
  LatLng? userLocation,
  List<places.Prediction> searchPlacesResults,
});

final placesSearchResultsProvider =
    StateProvider<List<places.Prediction>>((ref) => []);
final selectedPlaceLocationProvider = StateProvider<LatLng?>((ref) => null);
final googleMapsControllerProvider =
    Provider<GoogleMapController?>((ref) => null);

final userCurrentLocationProvider = StateProvider<LatLng?>((ref) {
  final coords = (localDatabase.get('LOCATION') as String?)?.extractCords();

  if (coords == null) {
    return null;
  }

  return LatLng(coords.lat, coords.lon);
});

final mapWidgetStatesProvider = StateProvider<MapWidgetsStates>(
  (ref) => (
    selectedPlace: ref.watch(selectedPlaceLocationProvider.notifier).state,
    userLocation: ref.watch(userCurrentLocationProvider.notifier).state,
    searchPlacesResults: ref.watch(placesSearchResultsProvider.notifier).state,
  ),
);
