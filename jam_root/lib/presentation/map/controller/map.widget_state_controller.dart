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

class MapWidgetStateController
    with Storer, MapWidgetStateLocationActions, MapWidgetStateActions {
  MapWidgetStateController(this._ref);

  final ProviderRef _ref;

  @override
  final state = BehaviorSubject<MapWidgetState>();

  MapWidgetState get data =>
      state.hasValue ? state.value : throw 'State hasn\'t been initialized yet';

  @override
  MapData get mapData$ => state.hasValue
      ? state.value.mapData
      : throw 'State hasn\'t been initialized yet';

  late final StreamSubscription _mapDataSubscription;

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

    _mapDataSubscription = Rx.combineLatest2(
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
        if (!state.isPaused && !state.isClosed) state.value = mapItems$;
      },
    );

    yield* state.stream;
  }

  Future<LatLngRecord?> _initWithOwnLocation() async {
    var location = Storer.hiveGetLocation();

    if (location.isNull) {
      final locationService = _ref.read(locationServiceProvider);
      final locationData = await locationService.getLocation();
      location = LatLng(locationData.latitude!, locationData.longitude!);
      await Storer.hiveCacheLocation(data: locationData);
    }

    state.value = MapWidgetState(
      mapData: MapData(
        currentPosition: location!,
        locations: [],
      ),
    );

    return (lat: location.latitude, lon: location.longitude);
  }

  Future<String?> _getRealtimChannelIdentifier(
    LatLngRecord? coords,
  ) async {
    final location = mapData$.currentPosition;

    final placeMarks = await placemarkFromCoordinates(
      location.latitude,
      location.longitude,
    );

    return placeMarks.firstOrNull?.locality;
  }

  Future<void> _updateAndCacheLocation(LatLng data) async {
    if (!state.hasValue) return;

    await hiveRefresh<MapData>(mapData$);

    state.value = state.value.copyWith(
      mapData: mapData$.copyWith(currentPosition: data),
    );
  }

  void dispose() {
    state.value.googleMapsController?.dispose();
    state.close();
    _mapDataSubscription.cancel();
  }
}

final locationServiceProvider = Provider<lc.Location>((ref) => lc.Location());

final mapWidgetStateControllerProvider = Provider<MapWidgetStateController>(
  (ref) => MapWidgetStateController(ref),
);

final locations$ = StreamProvider<MapWidgetState>(
  (ref) => ref.read(mapWidgetStateControllerProvider).locations$(),
);

final placesProvider = Provider<GoogleMapsPlaces>(
  (ref) => GoogleMapsPlaces(
    apiKey: dotenv.env[EnvironmentConstants.GOOGLE_MAPS_PLACES_API_KEY],
  ),
);

extension Locationxtensions on lc.Location {
  Future<String> getLocationInPoint() async {
    final location = await getLocation();
    return 'POINT(${location.latitude} ${location.longitude})';
  }
}
