// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jam_form.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$JamFormModelImpl _$$JamFormModelImplFromJson(Map<String, dynamic> json) =>
    _$JamFormModelImpl(
      elements: (json['elements'] as List<dynamic>)
          .map((e) => JamFormElementData.fromJson(e as Map<String, dynamic>))
          .toList(),
      title: json['title'] as String,
    );

Map<String, dynamic> _$$JamFormModelImplToJson(_$JamFormModelImpl instance) =>
    <String, dynamic>{
      'elements': instance.elements,
      'title': instance.title,
    };
