// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_element_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$JamFormElementDataImpl _$$JamFormElementDataImplFromJson(
        Map<String, dynamic> json) =>
    _$JamFormElementDataImpl(
      id: json['id'] as int,
      type: $enumDecode(_$JamFormElementTypeEnumMap, json['type']),
      isRequired: json['is_required'] as bool,
      order: json['order'] as int,
      label: json['label'] as String?,
      group: json['group'] as String?,
      hint: json['hint'] as String?,
      value: json['value'],
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$JamFormElementDataImplToJson(
        _$JamFormElementDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$JamFormElementTypeEnumMap[instance.type]!,
      'is_required': instance.isRequired,
      'order': instance.order,
      'label': instance.label,
      'group': instance.group,
      'hint': instance.hint,
      'value': instance.value,
      'description': instance.description,
    };

const _$JamFormElementTypeEnumMap = {
  JamFormElementType.dateInput: 'dateInput',
  JamFormElementType.radioInput: 'radioInput',
  JamFormElementType.checkboxInput: 'checkboxInput',
  JamFormElementType.textInput: 'textInput',
};
