import 'package:flutter_google_maps_webservices/places.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_utils/jam_utils.dart';
import 'package:rxdart/subjects.dart';

mixin MapWidgetStateLocationActions {
  BehaviorSubject<MapWidgetState> get state;

  MapData get mapData$;

  final spotJamMarker = JamMarker.getSpotJamMarker();

  void pushJam({
    required JamLocation jamLocation,
    bool popTempMarker = false,
  }) {
    if (!state.hasValue) return;

    final updatedData = mapData$.copyWith(
      locations: [...mapData$.locations, jamLocation],
    );

    state.value = state.value.copyWith(mapData: updatedData);

    if (popTempMarker) removeTempMarker();
  }

  void removeTempMarker() {
    if (state.hasValue) {
      state.value = state.value.copyWith(
        mapData: mapData$.withoutFocusedLocationPoint(),
      );
    }
  }

  void addTempMarker({
    required double lat,
    required double lon,
  }) {
    if (!state.hasValue) return;

    final spotLocation = SpotJamLocation.generate(
      id: 'temp',
      latitude: lat,
      longitude: lon,
      marker: spotJamMarker,
    );

    state.value = state.value.copyWith(
      mapData: mapData$.copyWith(
        focusedLocationPoint: spotLocation,
      ),
    );
  }

  void removeJam(String id) {
    if (!state.hasValue) return;

    state.value = state.value.copyWith(
      mapData: mapData$.copyWith(
        locations: [...mapData$.locations.where((loc) => loc.id != id)],
      ),
    );
  }

  void removeTempMarkerIfPresent() {
    if (mapData$.focusedLocationPoint!.isNotNull) removeTempMarker();
  }
}

mixin MapWidgetStateActions {
  BehaviorSubject<MapWidgetState> get state;

  MapData get mapData$;

  void setPlacesSearchResults(List<Prediction> placesSearchResults) {
    state.value =
        state.value.copyWith(placesSearchResults: placesSearchResults);
  }

  void setSelectedPlaceLocation(LatLng? selectedPlaceLocation) {
    state.value =
        state.value.copyWith(selectedPlaceLocation: selectedPlaceLocation);
  }

  void setGoogleMapsController(GoogleMapController? googleMapsController) {
    state.value =
        state.value.copyWith(googleMapsController: googleMapsController);
  }

  void setShowBottomSheet(bool showBottomSheet) {
    state.value = state.value.copyWith(showBottomSheet: showBottomSheet);
  }

  void setUserCurrentLocation(LatLng? userCurrentLocation) {
    if (userCurrentLocation.isNotNull) {
      state.value = state.value.copyWith(
        mapData: mapData$.copyWith(currentPosition: userCurrentLocation!),
      );
    }
  }
}
