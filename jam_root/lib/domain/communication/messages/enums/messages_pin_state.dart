import 'package:hive_flutter/hive_flutter.dart';

part 'messages_pin_state.g.dart';

@HiveType(typeId: 99)
enum MessagePinState {
  @HiveField(0)
  no_one,
  @HiveField(1)
  everyone,
  @HiveField(2)
  sender;

  static MessagePinState parse(String state) {
    return state == 'no_one'
        ? MessagePinState.no_one
        : state == 'everyone'
            ? MessagePinState.everyone
            : MessagePinState.sender;
  }
}
