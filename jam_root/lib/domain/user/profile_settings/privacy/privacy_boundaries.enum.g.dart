// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'privacy_boundaries.enum.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PrivacyBoundariesAdapter extends TypeAdapter<PrivacyBoundaries> {
  @override
  final int typeId = 26;

  @override
  PrivacyBoundaries read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return PrivacyBoundaries.everyone;
      case 1:
        return PrivacyBoundaries.friendsOnly;
      case 2:
        return PrivacyBoundaries.noOne;
      case 3:
        return PrivacyBoundaries.rangeOfUsers;
      default:
        return PrivacyBoundaries.everyone;
    }
  }

  @override
  void write(BinaryWriter writer, PrivacyBoundaries obj) {
    switch (obj) {
      case PrivacyBoundaries.everyone:
        writer.writeByte(0);
        break;
      case PrivacyBoundaries.friendsOnly:
        writer.writeByte(1);
        break;
      case PrivacyBoundaries.noOne:
        writer.writeByte(2);
        break;
      case PrivacyBoundaries.rangeOfUsers:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PrivacyBoundariesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
