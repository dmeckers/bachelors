// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jam_join_type.enum.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class JamJoinTypeEnumAdapter extends TypeAdapter<JamJoinTypeEnum> {
  @override
  final int typeId = 31;

  @override
  JamJoinTypeEnum read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return JamJoinTypeEnum.freeToJoin;
      case 1:
        return JamJoinTypeEnum.invitesOnly;
      case 2:
        return JamJoinTypeEnum.freeToJoinAfterForm;
      case 3:
        return JamJoinTypeEnum.freetoJoinAfterFormAndApprove;
      case 4:
        return JamJoinTypeEnum.requestToJoin;
      default:
        return JamJoinTypeEnum.freeToJoin;
    }
  }

  @override
  void write(BinaryWriter writer, JamJoinTypeEnum obj) {
    switch (obj) {
      case JamJoinTypeEnum.freeToJoin:
        writer.writeByte(0);
        break;
      case JamJoinTypeEnum.invitesOnly:
        writer.writeByte(1);
        break;
      case JamJoinTypeEnum.freeToJoinAfterForm:
        writer.writeByte(2);
        break;
      case JamJoinTypeEnum.freetoJoinAfterFormAndApprove:
        writer.writeByte(3);
        break;
      case JamJoinTypeEnum.requestToJoin:
        writer.writeByte(4);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JamJoinTypeEnumAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
