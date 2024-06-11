import 'dart:async';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_google_maps_webservices/places.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jam/application/application.dart';
import 'package:jam/config/config.dart';
import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_utils/jam_utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:location/location.dart' as lc;

part 'map.widget_state_controller.g.dart';

@riverpod
Future<FriendShipStatusModel> checkRelationShipStatus(
  CheckRelationShipStatusRef ref, {
  required String userId,
}) async =>
    await ref
        .read(socialRepositoryProvider)
        .getRelationshipStatus(userId: userId);

class MapWidgetStateController with Storer {
  MapWidgetStateController(this._ref);

  final ProviderRef _ref;

  final state = BehaviorSubject<MapWidgetState>();

  MapWidgetState? get data => state.hasValue ? state.value : null;

  MapData? get mapData$ => state.hasValue ? state.value.mapData : null;

  Stream<MapWidgetState> locations$() async* {
    final userCoords = await _initWithOwnLocation();
    final cachedMapData = hiveGet<MapData>();
    final mapData = state.value.mapData;
    final userLatLng = mapData.currentPosition;

    state.value = state.value.copyWith(
      mapData: cachedMapData?.copyWith(currentPosition: userLatLng) ??
          state.value.mapData,
    );

    yield state.value;

    final location$ = _ref
        .read(locationServiceProvider)
        .onLocationChanged
        .debounceTime(const Duration(seconds: 3))
        .map((data) => LatLng(data.latitude ?? 0, data.longitude ?? 0))
        .doOnData(_updateAndCacheLocation)
        .throttleTime(const Duration(seconds: 10))
        .startWith(userLatLng);

    final mapItems$ = _ref
        .read(mapRealtimeProvider)
        .get$(channelIdentifier: await _getRealtimChannelIdentifier(userCoords))
        .startWith((jams: [], users: []));

    Rx.combineLatest2(
      location$,
      mapItems$,
      (location, mapData) => state.value.copyWith(
        mapData: state.value.mapData.copyWith(
          currentPosition: location,
          locations: [
            ...[mapData.jams, mapData.users].expand((e) => e)
          ],
        ),
      ),
    ).listen(
      (mapItems$) {
        state.value = mapItems$;
      },
    );

    yield* state.stream;
  }

  Future<LatLngRecord?> _initWithOwnLocation() async {
    var location = hiveGet<MapData>();

    if (location.isNull) {
      final locationData = await lc.Location.instance.getLocation();
      location = MapData(
        currentPosition: locationData.toLatLng(),
        locations: [],
      );

      await hivePut<MapData>(location);
    }

    state.value = MapWidgetState(
      mapData: MapData(
        currentPosition: location!.currentPosition,
        locations: [],
      ),
    );

    return (
      lat: location.currentPosition.latitude,
      lon: location.currentPosition.latitude
    );
  }

  Future<String?> _getRealtimChannelIdentifier(
    LatLngRecord? coords,
  ) async {
    final location = mapData$?.currentPosition ??
        (await lc.Location.instance.getLocation()).toLatLng();

    final placeMarks = await placemarkFromCoordinates(
      location.latitude,
      location.longitude,
    );

    return placeMarks.firstOrNull?.locality;
  }

  Future<void> _updateAndCacheLocation(LatLng data) async {
    if (!state.hasValue) return;

    await hiveRefresh<MapData>(mapData$!);

    state.value = state.value.copyWith(
      mapData: mapData$!.copyWith(currentPosition: data),
    );
  }

  void dispose() {
    _ref.read(mapRealtimeProvider).dispose();
    state.value.googleMapsController?.dispose();
    // state.close();
    // _mapDataSubscription.cancel();
  }

  // #region MapWidgetStateActions
  void setPlacesSearchResults(List<Prediction> placesSearchResults) {
    if (!state.hasValue) return;
    state.value =
        state.value.copyWith(placesSearchResults: placesSearchResults);
  }

  void setSelectedPlaceLocation(LatLng? selectedPlaceLocation) {
    if (!state.hasValue) return;
    state.value =
        state.value.copyWith(selectedPlaceLocation: selectedPlaceLocation);
  }

  void setGoogleMapsController(GoogleMapController? googleMapsController) {
    if (!state.hasValue) return;
    state.value =
        state.value.copyWith(googleMapsController: googleMapsController);
  }

  void setShowBottomSheet(bool showBottomSheet) {
    if (!state.hasValue) return;
    state.value = state.value.copyWith(showBottomSheet: showBottomSheet);
  }

  void hideBottomSheetAndTempMarkers() {
    if (!state.hasValue) return;

    state.value = state.value.copyWith(
      showBottomSheet: false,
      mapData: mapData$!.withoutFocusedLocationPoint()
        ..withoutSearchedPlaceLocation(),
    );
  }

  void setUserCurrentLocation(LatLng? userCurrentLocation) {
    if (!state.hasValue) return;

    if (userCurrentLocation.isNotNull) {
      state.value = state.value.copyWith(
        mapData: mapData$!.copyWith(currentPosition: userCurrentLocation!),
      );
    }
  }

  final spotJamMarker = JamMarker.getSpotJamMarker();

  void pushJam({
    required JamLocation jamLocation,
    bool popTempMarker = false,
  }) {
    if (!state.hasValue) return;

    final updatedData = mapData$!.copyWith(
      locations: [...mapData$!.locations, jamLocation],
    );

    state.value = state.value.copyWith(mapData: updatedData);

    if (popTempMarker) removeTempMarker();
  }

  void removeTempMarker() {
    if (state.hasValue) {
      state.value = state.value.copyWith(
        mapData: mapData$!.withoutFocusedLocationPoint(),
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
      mapData: mapData$!.copyWith(
        focusedLocationPoint: spotLocation,
      ),
    );
  }

  void removeJam(String id) {
    if (!state.hasValue) return;

    state.value = state.value.copyWith(
      mapData: mapData$!.copyWith(
        locations: [...mapData$!.locations.where((loc) => loc.id != id)],
      ),
    );
  }

  void removeTempMarkerIfPresent() {
    if (mapData$?.focusedLocationPoint!.isNotNull ?? false) removeTempMarker();
  }

  void removePlaceSearchResultMarker() {
    if (!state.hasValue) return;

    state.value = state.value.copyWith(
      mapData: mapData$!.withoutSearchedPlaceLocation(),
    );
  }

  void addPlaceSearchResultMarker({
    required double lat,
    required double lon,
    required String placeName,
  }) {
    if (!state.hasValue) return;

    final searchResult = SearchPlaceResult.generate(
      latitude: lat,
      longitude: lon,
      locationName: placeName,
    );

    state.value = state.value.copyWith(
      mapData: mapData$!.copyWith(searchedPlaceLocation: searchResult),
    );
  }
// #endregion
}

final locationServiceProvider = Provider<lc.Location>((ref) => lc.Location());

final mapWidgetStateControllerProvider = Provider<MapWidgetStateController>(
  (ref) => MapWidgetStateController(ref),
);

final locations$ = StreamProvider.autoDispose<MapWidgetState>(
  (ref) => ref.read(mapWidgetStateControllerProvider).locations$(),
);

final placesProvider = Provider<GoogleMapsPlaces>(
  (ref) => GoogleMapsPlaces(
    apiKey: dotenv.env[EnvironmentConstants.GOOGLE_MAPS_PLACES_API_KEY],
  ),
);
