import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:jam/config/config.dart';

import 'package:jam/domain/domain.dart';

@HiveType(typeId: HiveConstants.LOCATION_TYPE_TYPE_ID)
enum LocationType {
  @HiveField(0)
  user,
  @HiveField(1)
  jam,
  @HiveField(2)
  spottedJam,
  @HiveField(3)
  placeSearchResult;
}

abstract class LocationAbstactModel {
  abstract final double latitude;
  abstract final double longitude;
  abstract final String name;
  abstract final BitmapDescriptor? marker;
  abstract final dynamic id;
  abstract final LocationType type;
  abstract final List<VibeModel> vibes;

  LocationAbstactModel copyWithResolvedMarker();
}
