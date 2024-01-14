// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'messages_pin_state.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MessagePinStateAdapter extends TypeAdapter<MessagePinState> {
  @override
  final int typeId = 99;

  @override
  MessagePinState read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return MessagePinState.no_one;
      case 1:
        return MessagePinState.everyone;
      case 2:
        return MessagePinState.sender;
      default:
        return MessagePinState.no_one;
    }
  }

  @override
  void write(BinaryWriter writer, MessagePinState obj) {
    switch (obj) {
      case MessagePinState.no_one:
        writer.writeByte(0);
        break;
      case MessagePinState.everyone:
        writer.writeByte(1);
        break;
      case MessagePinState.sender:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MessagePinStateAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
