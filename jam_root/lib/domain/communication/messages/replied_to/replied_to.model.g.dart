// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'replied_to.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RepliedToModelImpl _$$RepliedToModelImplFromJson(Map<String, dynamic> json) =>
    _$RepliedToModelImpl(
      messageId: json['message_id'] as int,
      senderId: json['sender_id'] as String,
      messageType: $enumDecode(_$MessageTypeEnumMap, json['message_type']),
      messageText: json['message_text'] as String,
    );

Map<String, dynamic> _$$RepliedToModelImplToJson(
        _$RepliedToModelImpl instance) =>
    <String, dynamic>{
      'message_id': instance.messageId,
      'sender_id': instance.senderId,
      'message_type': _$MessageTypeEnumMap[instance.messageType]!,
      'message_text': instance.messageText,
    };

const _$MessageTypeEnumMap = {
  MessageType.text: 'text',
  MessageType.image: 'image',
  MessageType.video_message: 'video_message',
  MessageType.audio_message: 'audio_message',
  MessageType.file: 'file',
  MessageType.location: 'location',
  MessageType.contact: 'contact',
  MessageType.sticker: 'sticker',
  MessageType.gif: 'gif',
  MessageType.event: 'event',
};
