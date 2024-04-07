// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'last_chat_message.model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LastMessageModelAdapter extends TypeAdapter<_$LastMessageModelImpl> {
  @override
  final int typeId = 63;

  @override
  _$LastMessageModelImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$LastMessageModelImpl(
      id: fields[0] as int,
      chatId: fields[1] as int,
      sentAt: fields[2] as DateTime,
      messageType: fields[3] as MessageType,
      senderId: fields[4] as String,
      messageText: fields[5] as String?,
      messageStatus: fields[6] as MessageDeliveryStatus?,
      mediaContentUrl: fields[7] as String?,
      fromMe: fields[8] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, _$LastMessageModelImpl obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.chatId)
      ..writeByte(2)
      ..write(obj.sentAt)
      ..writeByte(3)
      ..write(obj.messageType)
      ..writeByte(4)
      ..write(obj.senderId)
      ..writeByte(5)
      ..write(obj.messageText)
      ..writeByte(6)
      ..write(obj.messageStatus)
      ..writeByte(7)
      ..write(obj.mediaContentUrl)
      ..writeByte(8)
      ..write(obj.fromMe);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LastMessageModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
      fromMe: json['from_me'] as bool,
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
      'from_me': instance.fromMe,
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
