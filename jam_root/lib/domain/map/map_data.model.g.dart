// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_data.model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LatLngAdapterAdapter extends TypeAdapter<LatLngAdapter> {
  @override
  final int typeId = 68;

  @override
  LatLngAdapter read(BinaryReader reader) {
    return LatLngAdapter();
  }

  @override
  void write(BinaryWriter writer, LatLngAdapter obj) {
    writer.writeByte(0);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LatLngAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MapDataImplAdapter extends TypeAdapter<_$MapDataImpl> {
  @override
  final int typeId = 65;

  @override
  _$MapDataImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$MapDataImpl(
      currentPosition: fields[0] as LatLng,
      locations: (fields[1] as List).cast<LocationAbstactModel>(),
      focusedLocationPoint: fields[2] as LocationAbstactModel?,
    );
  }

  @override
  void write(BinaryWriter writer, _$MapDataImpl obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.currentPosition)
      ..writeByte(2)
      ..write(obj.focusedLocationPoint)
      ..writeByte(1)
      ..write(obj.locations);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MapDataImplAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
