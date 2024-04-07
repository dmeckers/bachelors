// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DefaultMessageModelAdapter extends TypeAdapter<_$MessageModelImpl> {
  @override
  final int typeId = 8;

  @override
  _$MessageModelImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$MessageModelImpl(
      id: fields[0] as int?,
      chatId: fields[1] as int?,
      mediaContentUrl: fields[2] as String?,
      sentAt: fields[3] as DateTime,
      messageType: fields[4] as MessageType,
      senderId: fields[5] as String?,
      repliedTo: fields[6] as int?,
      editedAt: fields[7] as DateTime?,
      forwardedFrom: fields[8] as ForwardedFromModel?,
      messageText: fields[9] as String?,
      senderName: fields[10] as String?,
      pinnedState: fields[11] as MessagePinState,
      fromMe: fields[13] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, _$MessageModelImpl obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.chatId)
      ..writeByte(2)
      ..write(obj.mediaContentUrl)
      ..writeByte(3)
      ..write(obj.sentAt)
      ..writeByte(4)
      ..write(obj.messageType)
      ..writeByte(5)
      ..write(obj.senderId)
      ..writeByte(6)
      ..write(obj.repliedTo)
      ..writeByte(7)
      ..write(obj.editedAt)
      ..writeByte(8)
      ..write(obj.forwardedFrom)
      ..writeByte(9)
      ..write(obj.messageText)
      ..writeByte(10)
      ..write(obj.senderName)
      ..writeByte(11)
      ..write(obj.pinnedState)
      ..writeByte(13)
      ..write(obj.fromMe);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DefaultMessageModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageModelImpl _$$MessageModelImplFromJson(Map<String, dynamic> json) =>
    _$MessageModelImpl(
      id: json['id'] as int?,
      chatId: json['chat_id'] as int?,
      mediaContentUrl: json['media_content_url'] as String?,
      sentAt: DateTime.parse(json['sent_at'] as String),
      messageType:
          $enumDecodeNullable(_$MessageTypeEnumMap, json['message_type']) ??
              MessageType.text,
      senderId: json['sender_id'] as String?,
      repliedTo: json['replied_to'] as int?,
      editedAt: json['edited_at'] == null
          ? null
          : DateTime.parse(json['edited_at'] as String),
      forwardedFrom: json['forwarded_from'] == null
          ? null
          : ForwardedFromModel.fromJson(
              json['forwarded_from'] as Map<String, dynamic>),
      messageText: json['message_text'] as String?,
      senderName: json['sender_name'] as String?,
      pinnedState:
          $enumDecodeNullable(_$MessagePinStateEnumMap, json['pinned_state']) ??
              MessagePinState.no_one,
      messageStatus: $enumDecodeNullable(
              _$MessageDeliveryStatusEnumMap, json['message_status']) ??
          MessageDeliveryStatus.sending,
      fromMe: json['from_me'] as bool,
    );

Map<String, dynamic> _$$MessageModelImplToJson(_$MessageModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['chat_id'] = instance.chatId;
  val['media_content_url'] = instance.mediaContentUrl;
  val['sent_at'] = instance.sentAt.toIso8601String();
  val['message_type'] = _$MessageTypeEnumMap[instance.messageType]!;
  val['replied_to'] = instance.repliedTo;
  val['edited_at'] = instance.editedAt?.toIso8601String();
  val['forwarded_from'] = instance.forwardedFrom;
  val['message_text'] = instance.messageText;
  val['pinned_state'] = _$MessagePinStateEnumMap[instance.pinnedState]!;
  val['message_status'] =
      _$MessageDeliveryStatusEnumMap[instance.messageStatus];
  val['from_me'] = instance.fromMe;
  return val;
}

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

const _$MessagePinStateEnumMap = {
  MessagePinState.no_one: 'no_one',
  MessagePinState.everyone: 'everyone',
  MessagePinState.sender: 'sender',
};

const _$MessageDeliveryStatusEnumMap = {
  MessageDeliveryStatus.unread: 'unread',
  MessageDeliveryStatus.read: 'read',
  MessageDeliveryStatus.sending: 'sending',
  MessageDeliveryStatus.error: 'error',
};
