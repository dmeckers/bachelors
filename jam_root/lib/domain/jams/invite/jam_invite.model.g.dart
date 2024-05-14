// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jam_invite.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$JamInviteModelImpl _$$JamInviteModelImplFromJson(Map<String, dynamic> json) =>
    _$JamInviteModelImpl(
      id: json['id'] as int,
      jamId: json['jam_id'] as int,
      invitedUserId: json['invited_user_id'] as String,
      sendedFromUserId: json['sended_from_user_id'] as String,
      status: json['status'] as String,
      insertedAt: DateTime.parse(json['inserted_at'] as String),
      sender: UserProfileModel.fromJson(json['sender'] as Map<String, dynamic>),
      jamName:
          _JamInviteJsonTransformer.readJamName(json, 'jam_name') as String,
    );

Map<String, dynamic> _$$JamInviteModelImplToJson(
        _$JamInviteModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'jam_id': instance.jamId,
      'invited_user_id': instance.invitedUserId,
      'sended_from_user_id': instance.sendedFromUserId,
      'status': instance.status,
      'inserted_at': instance.insertedAt.toIso8601String(),
      'sender': instance.sender,
      'jam_name': instance.jamName,
    };
