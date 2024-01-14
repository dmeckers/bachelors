import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jam/domain/domain.dart';

enum LocationType { user, jam }

abstract class LocationAbstactModel {
  abstract final double latitude;
  abstract final double longitude;
  abstract final String name;
  abstract final BitmapDescriptor? marker;
  abstract final dynamic id;
  abstract final LocationType type;
  abstract final List<VibeModel> vibes;
}
