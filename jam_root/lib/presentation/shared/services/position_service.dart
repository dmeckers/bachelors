import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PositionService {
  static Future<Position> deterimnePosition() async {
    try {
      await checkPermissions();
      return await Geolocator.getCurrentPosition();
    } catch (e) {
      return Future.error(e);
    }
  }

  static Stream<Position> getPositionStream() async* {
    try {
      await checkPermissions();
      yield* Geolocator.getPositionStream(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
          distanceFilter: 10,
        ),
      );
    } catch (e) {
      yield* Stream.error(e);
    }
  }

  static LatLngBounds getBounds(LatLng position, double distance) {
    final LatLngBounds bounds = LatLngBounds(
      southwest:
          LatLng(position.latitude - distance, position.longitude - distance),
      northeast:
          LatLng(position.latitude + distance, position.longitude + distance),
    );
    return bounds;
  }

  static checkPermissions() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      throw Exception('Location services are disabled.');
    }

    final permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      final permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
  }
}

final positionProvider = FutureProvider<Position>(
  (ref) => PositionService.deterimnePosition(),
);

final positionStreamProvider = StreamProvider<Position>(
  (ref) => PositionService.getPositionStream(),
);
