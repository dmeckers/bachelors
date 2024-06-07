import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:jam/domain/domain.dart';

class MapData {
  final LatLng currentPosition;
  final List<LocationAbstactModel> locations;
  final LocationAbstactModel? focusedLocationPoint;

  MapData({
    required this.currentPosition,
    required this.locations,
    this.focusedLocationPoint,
  });

  MapData copyWith({
    LatLng? currentPosition,
    List<LocationAbstactModel>? locations,
    LocationAbstactModel? focusedLocationPoint,
  }) =>
      MapData(
        currentPosition: currentPosition ?? this.currentPosition,
        locations: locations ?? this.locations,
        focusedLocationPoint: focusedLocationPoint ?? this.focusedLocationPoint,
      );

  MapData withoutFocusedLocationPoint() => MapData(
        currentPosition: currentPosition,
        locations: locations,
        focusedLocationPoint: null,
      );
}
