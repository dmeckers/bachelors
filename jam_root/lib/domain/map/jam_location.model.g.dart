// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jam_location.model.dart';

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
