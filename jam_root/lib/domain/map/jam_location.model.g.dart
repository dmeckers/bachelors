// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jam_location.model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class JamLocationImplAdapter extends TypeAdapter<_$JamLocationImpl> {
  @override
  final int typeId = 67;

  @override
  _$JamLocationImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$JamLocationImpl(
      jamId: fields[0] as int,
      name: fields[1] as String,
      description: fields[2] as String,
      locationName: fields[3] as String,
      date: fields[4] as dynamic,
      latitude: fields[5] as double,
      longitude: fields[6] as double,
      vibes: (fields[7] as List).cast<VibeModel>(),
      creatorId: fields[8] as String,
      joinType: fields[9] as JamJoinTypeEnum,
      creatorFcmToken: fields[10] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, _$JamLocationImpl obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.jamId)
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
      ..writeByte(9)
      ..write(obj.joinType)
      ..writeByte(10)
      ..write(obj.creatorFcmToken)
      ..writeByte(7)
      ..write(obj.vibes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JamLocationImplAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$JamLocationImpl _$$JamLocationImplFromJson(Map<String, dynamic> json) =>
    _$JamLocationImpl(
      jamId: json['jam_id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      locationName: json['location_name'] as String,
      date: json['date'],
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      vibes: (json['vibes'] as List<dynamic>)
          .map((e) => VibeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      creatorId: json['creator_id'] as String,
      joinType: $enumDecode(_$JamJoinTypeEnumEnumMap, json['join_type']),
      creatorFcmToken: json['creator_fcm_token'] as String?,
      marker: json['marker'] == null
          ? null
          : BitmapDescriptor.fromJson(json['marker'] as Object),
    );

Map<String, dynamic> _$$JamLocationImplToJson(_$JamLocationImpl instance) {
  final val = <String, dynamic>{
    'jam_id': instance.jamId,
    'name': instance.name,
    'description': instance.description,
    'location_name': instance.locationName,
    'date': instance.date,
    'latitude': instance.latitude,
    'longitude': instance.longitude,
    'vibes': instance.vibes.map((e) => e.toJson()).toList(),
    'creator_id': instance.creatorId,
    'join_type': _$JamJoinTypeEnumEnumMap[instance.joinType]!,
    'creator_fcm_token': instance.creatorFcmToken,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('marker', instance.marker?.toJson());
  return val;
}

const _$JamJoinTypeEnumEnumMap = {
  JamJoinTypeEnum.freeToJoin: 'freeToJoin',
  JamJoinTypeEnum.invitesOnly: 'invitesOnly',
  JamJoinTypeEnum.freeToJoinAfterForm: 'freeToJoinAfterForm',
  JamJoinTypeEnum.freetoJoinAfterFormAndApprove:
      'freetoJoinAfterFormAndApprove',
  JamJoinTypeEnum.requestToJoin: 'requestToJoin',
};
