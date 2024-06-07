import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_utils/jam_utils.dart';
import 'package:location/location.dart';
import 'package:rxdart/rxdart.dart';
import 'package:location/location.dart' as lc;

class LocationsController {
  LocationsController(this._ref);

  final ProviderRef _ref;

  final _state = BehaviorSubject<MapData>();

  Stream<MapData> locations$() async* {
    final coords = (localDatabase.get('LOCATION') as String?)?.extractCords();

    if (coords == null) {
      final location = await lc.Location().getLocation();
      localDatabase.put(
        'LOCATION',
        'Lat: ${location.latitude}, Lng: ${location.longitude}',
      );

      _state.value = MapData(
        currentPosition: LatLng(location.latitude!, location.longitude!),
        locations: [],
      );
    } else {
      _state.value = MapData(
        currentPosition: LatLng(coords.lat, coords.lon),
        locations: [],
      );
    }
    yield* _state.stream;

    // yield coords == null
    //     ? await Location().getLocation()
    //     : MapData(
    //         currentPosition: LatLng(coords.lat, coords.lon), locations: []);

    // final location = await _ref.read(locatorServiceProvider).getLocation();

    // _state.value = MapData(currentPosition: location, locations: []);

    // final placeMarks = await placemarkFromCoordinates(
    //   location.latitude!,
    //   location.longitude!,
    // );
    // final city = placeMarks.firstOrNull?.locality;

    // _ref
    //     .read(locatorServiceProvider)
    //     .onLocationChanged
    //     .debounceTime(const Duration(seconds: 5))
    //     .listen(
    //   (location) {
    //     _state.value = _state.value.copyWith(
    //       currentPosition: location,
    //     );
    //   },
    // );

    // _ref.read(mapRealtimeProvider).get$(channelIdentifier: city).listen(
    //   (data) {
    //     _state.value = _state.value.copyWith(
    //       locations: [...data.jams, ...data.users],
    //     );
    //   },
    // );
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
      locations: [
        ..._state.value.locations,
        SpotJamLocation.generate(
          id: 'temp',
          latitude: lat,
          longitude: lon,
          marker: JamMarker.getSpotJamMarker(),
        ),
      ],
    );
  }

  void removeTempMarker() {
    if (!_state.hasValue) return;

    _state.value = _state.value.copyWith(
      locations: _state.value.locations
          .where((location) => location.id != 'temp')
          .toList(),
    );
  }
}

final locationStateProvider = Provider<LocationsController>(
  (ref) => LocationsController(ref),
);

final locations$ = StreamProvider<MapData>(
  (ref) => ref.read(locationStateProvider).locations$(),
);
