// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vibe.model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VibeModelImplAdapter extends TypeAdapter<_$VibeModelImpl> {
  @override
  final int typeId = 15;

  @override
  _$VibeModelImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$VibeModelImpl(
      id: fields[0] as int,
      name: fields[1] as String,
      description: fields[2] as String?,
      iconUrl: fields[3] as String?,
      childVibes: (fields[4] as List?)?.cast<VibeModel>(),
      parentVibes: (fields[5] as List?)?.cast<VibeModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, _$VibeModelImpl obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.iconUrl)
      ..writeByte(4)
      ..write(obj.childVibes)
      ..writeByte(5)
      ..write(obj.parentVibes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VibeModelImplAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VibeModelImpl _$$VibeModelImplFromJson(Map<String, dynamic> json) =>
    _$VibeModelImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String?,
      iconUrl: json['icon_url'] as String?,
      childVibes: (json['child_vibes'] as List<dynamic>?)
              ?.map((e) => VibeModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      parentVibes: (json['parent_vibes'] as List<dynamic>?)
              ?.map((e) => VibeModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$VibeModelImplToJson(_$VibeModelImpl instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'name': instance.name,
    'description': instance.description,
    'icon_url': instance.iconUrl,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('child_vibes', instance.childVibes);
  writeNotNull('parent_vibes', instance.parentVibes);
  return val;
}
