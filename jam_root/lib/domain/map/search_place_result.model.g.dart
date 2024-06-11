// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_place_result.model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SearchPlaceResultImplAdapter
    extends TypeAdapter<_$SearchPlaceResultImpl> {
  @override
  final int typeId = 70;

  @override
  _$SearchPlaceResultImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$SearchPlaceResultImpl(
      id: fields[0] as String,
      name: fields[1] as String,
      latitude: fields[2] as double,
      longitude: fields[3] as double,
      vibes: (fields[4] as List).cast<VibeModel>(),
      creatorId: fields[5] as String,
      type: fields[6] as LocationType,
    );
  }

  @override
  void write(BinaryWriter writer, _$SearchPlaceResultImpl obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.latitude)
      ..writeByte(3)
      ..write(obj.longitude)
      ..writeByte(5)
      ..write(obj.creatorId)
      ..writeByte(6)
      ..write(obj.type)
      ..writeByte(4)
      ..write(obj.vibes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SearchPlaceResultImplAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
