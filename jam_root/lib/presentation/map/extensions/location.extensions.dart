import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

extension LocationLatLngAdapter on LocationData {
  LatLng toLatLng() => LatLng(latitude ?? 0, longitude ?? 0);
}
