// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jam_qr_mode.enum.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class JamQrModeEnumAdapter extends TypeAdapter<JamQrModeEnum> {
  @override
  final int typeId = 32;

  @override
  JamQrModeEnum read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return JamQrModeEnum.none;
      case 1:
        return JamQrModeEnum.creatorChecksIn;
      case 2:
        return JamQrModeEnum.participantsCheckInThemself;
      default:
        return JamQrModeEnum.none;
    }
  }

  @override
  void write(BinaryWriter writer, JamQrModeEnum obj) {
    switch (obj) {
      case JamQrModeEnum.none:
        writer.writeByte(0);
        break;
      case JamQrModeEnum.creatorChecksIn:
        writer.writeByte(1);
        break;
      case JamQrModeEnum.participantsCheckInThemself:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JamQrModeEnumAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
