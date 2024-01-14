import 'package:jam/domain/domain.dart';

abstract class EventServiceInterface<T, E extends Event> {
  Future<void> fireEvent(E event);

  Stream<T> getEvents$({
    String? channelIdentifier,
    dynamic data,
  });
}
