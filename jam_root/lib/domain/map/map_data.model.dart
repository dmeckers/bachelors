import 'package:location/location.dart';

import 'package:jam/domain/domain.dart';

class MapData {
  final LocationData currentPosition;
  final List<LocationAbstactModel> locations;

  MapData({
    required this.currentPosition,
    required this.locations,
  });

  MapData copyWith({
    LocationData? currentPosition,
    List<LocationAbstactModel>? locations,
  }) {
    return MapData(
      currentPosition: currentPosition ?? this.currentPosition,
      locations: locations ?? this.locations,
    );
  }
}
