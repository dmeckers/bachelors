// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'last_chat_message.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LastMessageModelImpl _$$LastMessageModelImplFromJson(
        Map<String, dynamic> json) =>
    _$LastMessageModelImpl(
      id: json['id'] as int,
      chatId: json['chat_id'] as int,
      sentAt: DateTime.parse(json['sent_at'] as String),
      messageType: $enumDecode(_$MessageTypeEnumMap, json['message_type']),
      senderId: json['sender_id'] as String,
      messageText: json['message_text'] as String?,
      messageStatus: $enumDecodeNullable(
              _$MessageDeliveryStatusEnumMap, json['message_status']) ??
          MessageDeliveryStatus.sending,
      mediaContentUrl: json['media_content_url'] as String?,
    );

Map<String, dynamic> _$$LastMessageModelImplToJson(
        _$LastMessageModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'chat_id': instance.chatId,
      'sent_at': instance.sentAt.toIso8601String(),
      'message_type': _$MessageTypeEnumMap[instance.messageType]!,
      'sender_id': instance.senderId,
      'message_text': instance.messageText,
      'message_status': _$MessageDeliveryStatusEnumMap[instance.messageStatus],
      'media_content_url': instance.mediaContentUrl,
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

const _$MessageDeliveryStatusEnumMap = {
  MessageDeliveryStatus.unread: 'unread',
  MessageDeliveryStatus.read: 'read',
  MessageDeliveryStatus.sending: 'sending',
  MessageDeliveryStatus.error: 'error',
};
