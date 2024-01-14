// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jam_card_view.enum.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class JamCardViewAdapter extends TypeAdapter<JamCardView> {
  @override
  final int typeId = 30;

  @override
  JamCardView read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return JamCardView.small;
      case 2:
        return JamCardView.big;
      default:
        return JamCardView.small;
    }
  }

  @override
  void write(BinaryWriter writer, JamCardView obj) {
    switch (obj) {
      case JamCardView.small:
        writer.writeByte(0);
        break;
      case JamCardView.big:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JamCardViewAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
