import 'package:jam/domain/domain.dart';

typedef UsersJamsLocations = ({
  List<UserLocation> users,
  List<JamLocation> jams
});

typedef LatLngRecord = ({
  double lat,
  double lon,
});

abstract class MapRepositoryInterface {
  Future<void> updateUserLocation({
    required double latitude,
    required double longitude,
  });

  Future<UsersJamsLocations> getUserAndJamsLocations({
    double? userLatitude,
    double? userLongitude,
  });
}
