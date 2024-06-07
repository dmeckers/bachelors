import 'package:flutter_google_maps_webservices/places.dart' as places;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
// import 'package:location/location.dart' as lc;

part 'map_page_states_controller.g.dart';

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

class MapStateViewModelNotifier extends StateNotifier<MapStateViewModel> {
  MapStateViewModelNotifier(super.state);

  void setPlacesSearchResults(List<places.Prediction> placesSearchResults) {
    state = state.copyWith(placesSearchResults: placesSearchResults);
  }

  void setSelectedPlaceLocation(LatLng? selectedPlaceLocation) {
    state = state.copyWith(selectedPlaceLocation: selectedPlaceLocation);
  }

  void setGoogleMapsController(GoogleMapController? googleMapsController) {
    state = state.copyWith(googleMapsController: googleMapsController);
  }

  void setShowBottomSheet(bool showBottomSheet) {
    state = state.copyWith(showBottomSheet: showBottomSheet);
  }

  void setShowPutJamBottomSheet(bool showPutJamBottomSheet) {
    state = state.copyWith(showPutJamBottomSheet: showPutJamBottomSheet);
  }

  void setUserCurrentLocation(LatLng? userCurrentLocation) {
    state = state.copyWith(userCurrentLocation: userCurrentLocation);
  }
}

final mapStateViewModelProvider = StateNotifierProvider.autoDispose<
    MapStateViewModelNotifier, MapStateViewModel>(
  (ref) => MapStateViewModelNotifier(MapStateViewModel.initial()),
);
