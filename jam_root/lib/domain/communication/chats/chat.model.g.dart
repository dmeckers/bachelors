// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat.model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChatModelAdapter extends TypeAdapter<_$ChatModelImpl> {
  @override
  final int typeId = 5;

  @override
  _$ChatModelImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$ChatModelImpl(
      id: fields[0] as int,
      relatedContact: fields[2] as UserProfileModel,
      messages: (fields[3] as List).cast<MessageModel>(),
      unreadMessagesCount: fields[6] as int,
      clearedAt: fields[7] as DateTime?,
      lastMessage: fields[8] as LastMessageModel?,
      iconUrl: fields[4] as String,
      settings: fields[5] as PersonalChatSettingsModel?,
      isPinned: fields[12] as bool,
      isArchived: fields[13] as bool,
      createdAt: fields[14] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, _$ChatModelImpl obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.relatedContact)
      ..writeByte(6)
      ..write(obj.unreadMessagesCount)
      ..writeByte(7)
      ..write(obj.clearedAt)
      ..writeByte(8)
      ..write(obj.lastMessage)
      ..writeByte(4)
      ..write(obj.iconUrl)
      ..writeByte(5)
      ..write(obj.settings)
      ..writeByte(12)
      ..write(obj.isPinned)
      ..writeByte(13)
      ..write(obj.isArchived)
      ..writeByte(14)
      ..write(obj.createdAt)
      ..writeByte(3)
      ..write(obj.messages);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChatModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatModelImpl _$$ChatModelImplFromJson(Map<String, dynamic> json) =>
    _$ChatModelImpl(
      id: json['id'] as int,
      relatedContact: UserProfileModel.fromJson(
          json['related_contact'] as Map<String, dynamic>),
      messages: (json['messages'] as List<dynamic>?)
              ?.map((e) => MessageModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      unreadMessagesCount: json['unread_messages_count'] as int? ?? 0,
      clearedAt: json['cleared_at'] == null
          ? null
          : DateTime.parse(json['cleared_at'] as String),
      lastMessage: json['last_message'] == null
          ? null
          : LastMessageModel.fromJson(
              json['last_message'] as Map<String, dynamic>),
      isPinned: json['is_pinned'] as bool? ?? false,
      isArchived: json['is_archived'] as bool? ?? false,
      toHide: json['to_hide'] as bool? ?? false,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$ChatModelImplToJson(_$ChatModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'related_contact': instance.relatedContact.toJson(),
      'messages': instance.messages.map((e) => e.toJson()).toList(),
      'is_pinned': instance.isPinned,
      'is_archived': instance.isArchived,
      'to_hide': instance.toHide,
      'created_at': instance.createdAt?.toIso8601String(),
    };
