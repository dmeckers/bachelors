// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_input_mode.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChatInputModeAdapter extends TypeAdapter<ChatInputMode> {
  @override
  final int typeId = 13;

  @override
  ChatInputMode read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ChatInputMode.forward;
      case 1:
        return ChatInputMode.reply;
      case 2:
        return ChatInputMode.edit;
      case 3:
        return ChatInputMode.standart;
      default:
        return ChatInputMode.forward;
    }
  }

  @override
  void write(BinaryWriter writer, ChatInputMode obj) {
    switch (obj) {
      case ChatInputMode.forward:
        writer.writeByte(0);
        break;
      case ChatInputMode.reply:
        writer.writeByte(1);
        break;
      case ChatInputMode.edit:
        writer.writeByte(2);
        break;
      case ChatInputMode.standart:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChatInputModeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
