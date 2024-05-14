// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'join_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$JamJoinRequestModelImpl _$$JamJoinRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$JamJoinRequestModelImpl(
      id: json['id'] as int,
      jamId: json['jam_id'] as int,
      seenAt: json['seen_at'] == null
          ? null
          : DateTime.parse(json['seen_at'] as String),
      userId: json['user_id'] as String,
      status: $enumDecode(_$ProcessStepTypeEnumEnumMap, json['status']),
      filledForm: json['filled_form'] == null
          ? null
          : BaseJamFormModel.fromJson(
              json['filled_form'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$JamJoinRequestModelImplToJson(
        _$JamJoinRequestModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'jam_id': instance.jamId,
      'seen_at': instance.seenAt?.toIso8601String(),
      'user_id': instance.userId,
      'status': _$ProcessStepTypeEnumEnumMap[instance.status]!,
      'filled_form': instance.filledForm,
    };

const _$ProcessStepTypeEnumEnumMap = {
  ProcessStepTypeEnum.pending: 'pending',
  ProcessStepTypeEnum.accepted: 'accepted',
  ProcessStepTypeEnum.declined: 'declined',
  ProcessStepTypeEnum.freezed: 'freezed',
  ProcessStepTypeEnum.hidden: 'hidden',
};
