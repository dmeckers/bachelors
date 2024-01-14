// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_settings.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommunityChatSettingsModelImpl _$$CommunityChatSettingsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CommunityChatSettingsModelImpl(
      id: json['id'] as int,
      relatedChat:
          ChatModel.fromJson(json['relatedChat'] as Map<String, dynamic>),
      pinnedMessages: (json['pinnedMessages'] as List<dynamic>?)
              ?.map((e) => MessageModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$CommunityChatSettingsModelImplToJson(
        _$CommunityChatSettingsModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'relatedChat': instance.relatedChat,
      'pinnedMessages': instance.pinnedMessages,
      'runtimeType': instance.$type,
    };

_$PersonalChatSettingsModelImpl _$$PersonalChatSettingsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PersonalChatSettingsModelImpl(
      id: json['id'] as int,
      relatedChat:
          ChatModel.fromJson(json['relatedChat'] as Map<String, dynamic>),
      pinnedMessages: (json['pinnedMessages'] as List<dynamic>?)
              ?.map((e) => MessageModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$PersonalChatSettingsModelImplToJson(
        _$PersonalChatSettingsModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'relatedChat': instance.relatedChat,
      'pinnedMessages': instance.pinnedMessages,
      'runtimeType': instance.$type,
    };

_$GroupChatSettingsModelImpl _$$GroupChatSettingsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$GroupChatSettingsModelImpl(
      id: json['id'] as int,
      relatedChat:
          ChatModel.fromJson(json['relatedChat'] as Map<String, dynamic>),
      pinnedMessages: (json['pinnedMessages'] as List<dynamic>?)
              ?.map((e) => MessageModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$GroupChatSettingsModelImplToJson(
        _$GroupChatSettingsModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'relatedChat': instance.relatedChat,
      'pinnedMessages': instance.pinnedMessages,
      'runtimeType': instance.$type,
    };

_$JamChatSettingsModelImpl _$$JamChatSettingsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$JamChatSettingsModelImpl(
      id: json['id'] as int,
      relatedChat:
          ChatModel.fromJson(json['relatedChat'] as Map<String, dynamic>),
      pinnedMessages: (json['pinnedMessages'] as List<dynamic>?)
              ?.map((e) => MessageModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$JamChatSettingsModelImplToJson(
        _$JamChatSettingsModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'relatedChat': instance.relatedChat,
      'pinnedMessages': instance.pinnedMessages,
      'runtimeType': instance.$type,
    };
