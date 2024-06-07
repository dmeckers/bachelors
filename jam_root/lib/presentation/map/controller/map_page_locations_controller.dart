import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/application/application.dart';
import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_utils/jam_utils.dart';
import 'package:rxdart/rxdart.dart';
import 'package:location/location.dart' as lc;

class MapPageLocationsController {
  MapPageLocationsController(this._ref);

  final ProviderRef _ref;

  final _state = BehaviorSubject<MapData>();

  Stream<MapData> locations$() async* {
    final coords = await _getLocation();

    yield _state.value;

    final city = await _getRealtimChannelIdentifier(coords);

    final location$ = _ref
        .read(locatorServiceProvider)
        .onLocationChanged
        .debounceTime(const Duration(seconds: 5))
        .map((data) => LatLng(data.latitude ?? 0, data.longitude ?? 0))
        .doOnData(
          (data) => _ref
              .read(mapStateViewModelProvider.notifier)
              .setUserCurrentLocation(data),
        )
        .startWith(_state.value.currentPosition);

    final mapEvents$ = _ref
        .read(mapRealtimeProvider)
        .get$(channelIdentifier: city)
        .startWith((jams: [], users: []));

    Rx.combineLatest2(
      location$,
      mapEvents$,
      (location, mapData) => _state.value.copyWith(
        currentPosition: location,
        locations: [
          ...mapData.jams,
          ...mapData.users,
        ],
      ),
    ).listen(
      (mapEvents$) => _state.value = mapEvents$,
    );

    yield* _state.stream;
  }

  Future<LatLngRecord?> _getLocation() async {
    final coords = (localDatabase.get('LOCATION') as String?)?.extractCords();
    _state.value = MapData(
      currentPosition: coords.isNotNull
          ? LatLng(coords!.lat, coords.lon)
          : await _lastTryToGetThooseCoords(),
      locations: [],
    );
    return coords;
  }

  void pushJam({required JamLocation jamLocation, bool popTempMarker = false}) {
    if (!_state.hasValue) return;

    _state.value = _state.value.copyWith(
      locations: [..._state.value.locations, jamLocation],
    );
    if (popTempMarker) removeTempMarker();
  }

  void removeJam(String id) {
    if (!_state.hasValue) return;

    _state.value = _state.value.copyWith(
      locations: _state.value.locations
          .where((location) => location.id != id)
          .toList(),
    );
  }

  void addTempMarker({required double lat, required double lon}) {
    if (!_state.hasValue) return;

    _state.value = _state.value.copyWith(
        focusedLocationPoint: SpotJamLocation.generate(
      id: 'temp',
      latitude: lat,
      longitude: lon,
      marker: JamMarker.getSpotJamMarker(),
    ));
  }

  void removeTempMarker() {
    if (!_state.hasValue) return;
    _state.value = _state.value.withoutFocusedLocationPoint();
  }

  Future<String?> _getRealtimChannelIdentifier(
    LatLngRecord? coords,
  ) async {
    final location = _state.value.currentPosition;

    final placeMarks = await placemarkFromCoordinates(
      location.latitude,
      location.longitude,
    );

    return placeMarks.firstOrNull?.locality;
  }

  Future<LatLng> _lastTryToGetThooseCoords() async {
    final location = await lc.Location().getLocation();
    localDatabase.put(
      'LOCATION',
      'Lat: ${location.latitude}, Lng: ${location.longitude}',
    );
    return LatLng(location.latitude!, location.longitude!);
  }

  void dispose() => _state.close();
}

final locatorServiceProvider = Provider<lc.Location>((ref) => lc.Location());

final mapPageLocationsStateProvider = Provider<MapPageLocationsController>(
  (ref) => MapPageLocationsController(ref),
);

final locations$ = StreamProvider<MapData>(
  (ref) => ref.read(mapPageLocationsStateProvider).locations$(),
);
