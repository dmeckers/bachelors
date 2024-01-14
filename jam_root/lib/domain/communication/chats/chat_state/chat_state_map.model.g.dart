// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_state_map.model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChatStateMapAdapter extends TypeAdapter<ChatStateMap> {
  @override
  final int typeId = 10;

  @override
  ChatStateMap read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ChatStateMap(
      state: (fields[0] as Map).cast<int, ChatState>(),
    );
  }

  @override
  void write(BinaryWriter writer, ChatStateMap obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.state);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChatStateMapAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
