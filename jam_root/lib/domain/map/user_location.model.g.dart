// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_location.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserLocationImpl _$$UserLocationImplFromJson(Map<String, dynamic> json) =>
    _$UserLocationImpl(
      userId: json['user_id'] as String,
      name: json['name'] as String,
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
