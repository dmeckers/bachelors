// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friendship_status.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FriendShipStatusModelImpl _$$FriendShipStatusModelImplFromJson(
        Map<String, dynamic> json) =>
    _$FriendShipStatusModelImpl(
      status: $enumDecode(_$RelationshipStatusEnumMap, json['status']),
      profile:
          UserProfileModel.fromJson(json['profile'] as Map<String, dynamic>),
      receivedFriendRequestId: json['received_friend_request_id'] as int?,
      sentFriendRequestId: json['sent_friend_request_id'] as int?,
    );

Map<String, dynamic> _$$FriendShipStatusModelImplToJson(
        _$FriendShipStatusModelImpl instance) =>
    <String, dynamic>{
      'status': _$RelationshipStatusEnumMap[instance.status]!,
      'profile': instance.profile,
      'received_friend_request_id': instance.receivedFriendRequestId,
      'sent_friend_request_id': instance.sentFriendRequestId,
    };

const _$RelationshipStatusEnumMap = {
  RelationshipStatus.friends: 'friends',
  RelationshipStatus.friendRequestSent: 'friendRequestSent',
  RelationshipStatus.friendRequestReceived: 'friendRequestReceived',
  RelationshipStatus.notFriends: 'notFriends',
};
