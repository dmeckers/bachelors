// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_location.model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserLocationImplAdapter extends TypeAdapter<_$UserLocationImpl> {
  @override
  final int typeId = 66;

  @override
  _$UserLocationImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$UserLocationImpl(
      userId: fields[0] as String,
      name: fields[1] as String,
      vibes: (fields[2] as List).cast<VibeModel>(),
      latitude: fields[3] as double,
      longitude: fields[4] as double,
      isFriend: fields[5] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, _$UserLocationImpl obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.userId)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.latitude)
      ..writeByte(4)
      ..write(obj.longitude)
      ..writeByte(5)
      ..write(obj.isFriend)
      ..writeByte(2)
      ..write(obj.vibes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserLocationImplAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserLocationImpl _$$UserLocationImplFromJson(Map<String, dynamic> json) =>
    _$UserLocationImpl(
      userId: json['user_id'] as String,
      name: _UserLocationJson.readName(json, 'name') as String,
      vibes: (json['vibes'] as List<dynamic>)
          .map((e) => VibeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      marker: json['marker'] == null
          ? null
          : BitmapDescriptor.fromJson(json['marker'] as Object),
      isFriend: json['is_friend'] as bool,
    );

Map<String, dynamic> _$$UserLocationImplToJson(_$UserLocationImpl instance) {
  final val = <String, dynamic>{
    'user_id': instance.userId,
    'name': instance.name,
    'vibes': instance.vibes.map((e) => e.toJson()).toList(),
    'latitude': instance.latitude,
    'longitude': instance.longitude,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('marker', instance.marker?.toJson());
  val['is_friend'] = instance.isFriend;
  return val;
}
