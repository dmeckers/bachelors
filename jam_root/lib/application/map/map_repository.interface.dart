import 'package:jam/application/application.dart';
import 'package:jam/domain/domain.dart';

abstract class MapRepositoryInterface {
  Stream<List<LocationAbstactModel>> getMapData$({
    required double userLatitude,
    required double userLongitude,
  });

  Future<void> updateUserLocation({
    required double latitude,
    required double longitude,
  });

  abstract final EventServiceInterface<List<LocationAbstactModel>, Event>
      eventService;
}
