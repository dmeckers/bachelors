import 'package:geolocator/geolocator.dart';
import 'package:jam/domain/domain.dart';

class MapData {
  final Position currentPosition;
  final List<LocationAbstactModel> locations;
  // final List<UserLocation> otherPeople;
  // final List<JamLocation> jams;

  MapData({
    required this.currentPosition,
    required this.locations,
    // required this.otherPeople,
    // required this.jams,
  });
}
