import 'package:jam/domain/domain.dart';

abstract class EventServiceInterface<T, E extends Event, D> {
  Future<void> fireEvent(E event);

  Stream<T> getEvents$({
    String? channelIdentifier,
    D? data,
  });
}
