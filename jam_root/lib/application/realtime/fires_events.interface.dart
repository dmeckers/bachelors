import 'package:jam/domain/domain.dart';

abstract class FiresEvents<T extends Event> {
  Future<void> fireEvent(T event);
}
