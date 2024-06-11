import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class GeoPacker {
  static String encodePoint({required double lat, required double lon}) =>
      'POINT($lat $lon)';
  static LatLng decodePoint() => const LatLng(0, 0);

  static String toLatLngStringFromData({required LocationData data}) =>
      '${data.latitude}, ${data.longitude}';

  static String toLatLngString({required LatLng latLng}) =>
      '${latLng.latitude}, ${latLng.longitude}';

  static LatLng latLngFromString(String latLngString) {
    final latLng = latLngString.split(', ');
    return LatLng(double.parse(latLng[0]), double.parse(latLng[1]));
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
}
