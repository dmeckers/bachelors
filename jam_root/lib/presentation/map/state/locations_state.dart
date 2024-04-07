import 'package:geocoding/geocoding.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:rxdart/rxdart.dart';

class LocationsState {
  LocationsState(this._ref);

  final ProviderRef _ref;

  final _state = BehaviorSubject<MapData>();

  Stream<MapData> locations$() async* {
    final location = await _ref.read(locatorServiceProvider).getLocation();

    _state.value = MapData(currentPosition: location, locations: []);

    final placeMarks = await placemarkFromCoordinates(
      location.latitude!,
      location.longitude!,
    );
    final city = placeMarks.firstOrNull?.locality;

    _ref
        .read(locatorServiceProvider)
        .onLocationChanged
        .debounceTime(const Duration(seconds: 5))
        .listen(
      (location) {
        _state.value = _state.value.copyWith(
          currentPosition: location,
        );
      },
    );

    _ref.read(mapRealtimeProvider).get$(channelIdentifier: city).listen(
      (data) {
        _state.value = _state.value.copyWith(
          locations: [...data.jams, ...data.users],
        );
      },
    );

    yield* _state.stream;
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

final locationStateProvider = Provider<LocationsState>(
  (ref) => LocationsState(ref),
);

final locations$ = StreamProvider<MapData>(
  (ref) => ref.read(locationStateProvider).locations$(),
);
