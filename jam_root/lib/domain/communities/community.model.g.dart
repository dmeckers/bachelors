// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommunityModelImpl _$$CommunityModelImplFromJson(Map<String, dynamic> json) =>
    _$CommunityModelImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      isPublic: json['isPublic'] as bool,
      owner: JUser.fromJson(json['owner'] as Map<String, dynamic>),
      members: (json['members'] as List<dynamic>?)
              ?.map((e) => JUser.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      admins: (json['admins'] as List<dynamic>?)
              ?.map((e) => JUser.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      blocked: (json['blocked'] as List<dynamic>?)
              ?.map((e) => JUser.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      chats: (json['chats'] as List<dynamic>?)
              ?.map((e) => ChatModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$CommunityModelImplToJson(
        _$CommunityModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'isPublic': instance.isPublic,
      'owner': instance.owner,
      'members': instance.members,
      'admins': instance.admins,
      'blocked': instance.blocked,
      'chats': instance.chats,
    };
