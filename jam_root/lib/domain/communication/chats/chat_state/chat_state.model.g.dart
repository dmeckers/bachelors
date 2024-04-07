// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_state.model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChatStateAdapter extends TypeAdapter<_$ChatStateImpl> {
  @override
  final int typeId = 11;

  @override
  _$ChatStateImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$ChatStateImpl(
      messageDraft: fields[0] as String?,
      inputMode: fields[1] as ChatInputMode?,
      model: fields[2] as MessageModel?,
      page: fields[3] == null ? 0 : fields[3] as int,
      totalPages: fields[4] == null ? 0 : fields[4] as int,
    );
  }

  @override
  void write(BinaryWriter writer, _$ChatStateImpl obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.messageDraft)
      ..writeByte(1)
      ..write(obj.inputMode)
      ..writeByte(2)
      ..write(obj.model)
      ..writeByte(3)
      ..write(obj.page)
      ..writeByte(4)
      ..write(obj.totalPages);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChatStateAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
