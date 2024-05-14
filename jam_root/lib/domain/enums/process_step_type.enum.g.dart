// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'process_step_type.enum.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProcessStepTypeEnumAdapter extends TypeAdapter<ProcessStepTypeEnum> {
  @override
  final int typeId = 64;

  @override
  ProcessStepTypeEnum read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ProcessStepTypeEnum.pending;
      case 1:
        return ProcessStepTypeEnum.accepted;
      case 2:
        return ProcessStepTypeEnum.declined;
      case 3:
        return ProcessStepTypeEnum.freezed;
      case 4:
        return ProcessStepTypeEnum.hidden;
      default:
        return ProcessStepTypeEnum.pending;
    }
  }

  @override
  void write(BinaryWriter writer, ProcessStepTypeEnum obj) {
    switch (obj) {
      case ProcessStepTypeEnum.pending:
        writer.writeByte(0);
        break;
      case ProcessStepTypeEnum.accepted:
        writer.writeByte(1);
        break;
      case ProcessStepTypeEnum.declined:
        writer.writeByte(2);
        break;
      case ProcessStepTypeEnum.freezed:
        writer.writeByte(3);
        break;
      case ProcessStepTypeEnum.hidden:
        writer.writeByte(4);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProcessStepTypeEnumAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
