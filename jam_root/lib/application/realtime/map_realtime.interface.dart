import 'package:jam/application/application.dart';
import 'package:jam/domain/domain.dart';

abstract class MapRealtimeInterface
    implements RealtimeInterface<UsersJamsLocations>, FiresEvents<MapEvent> {
  abstract final MapRepositoryInterface repo;
}
