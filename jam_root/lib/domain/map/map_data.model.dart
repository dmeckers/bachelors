import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:jam/domain/domain.dart';

class MapData {
  final LatLng currentPosition;
  final List<LocationAbstactModel> locations;

  MapData({
    required this.currentPosition,
    required this.locations,
  });

  MapData copyWith({
    LatLng? currentPosition,
    List<LocationAbstactModel>? locations,
  }) {
    return MapData(
      currentPosition: currentPosition ?? this.currentPosition,
      locations: locations ?? this.locations,
    );
  }
}
