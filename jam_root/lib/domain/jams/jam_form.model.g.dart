// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jam_form.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$JamJoinRequestModelImpl _$$JamJoinRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$JamJoinRequestModelImpl(
      elements: (json['elements'] as List<dynamic>)
          .map((e) => JamFormElementData.fromJson(e as Map<String, dynamic>))
          .toList(),
      title: json['title'] as String,
      filledByUserId: json['filled_by_user_id'] as String?,
    );

Map<String, dynamic> _$$JamJoinRequestModelImplToJson(
    _$JamJoinRequestModelImpl instance) {
  final val = <String, dynamic>{
    'elements': instance.elements,
    'title': instance.title,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('filled_by_user_id', instance.filledByUserId);
  return val;
}
