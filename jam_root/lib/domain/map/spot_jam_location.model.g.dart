// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spot_jam_location.model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SpotJamLocationImplAdapter extends TypeAdapter<_$SpotJamLocationImpl> {
  @override
  final int typeId = 69;

  @override
  _$SpotJamLocationImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$SpotJamLocationImpl(
      id: fields[0] as String,
      name: fields[1] as String,
      description: fields[2] as String,
      locationName: fields[3] as String,
      date: fields[4] as DateTime,
      latitude: fields[5] as double,
      longitude: fields[6] as double,
      vibes: (fields[7] as List).cast<VibeModel>(),
      creatorId: fields[8] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _$SpotJamLocationImpl obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.locationName)
      ..writeByte(4)
      ..write(obj.date)
      ..writeByte(5)
      ..write(obj.latitude)
      ..writeByte(6)
      ..write(obj.longitude)
      ..writeByte(8)
      ..write(obj.creatorId)
      ..writeByte(7)
      ..write(obj.vibes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SpotJamLocationImplAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
