// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friend_invites.model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FriendInviteModelAdapter extends TypeAdapter<_$FriendInviteModelImpl> {
  @override
  final int typeId = 3;

  @override
  _$FriendInviteModelImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$FriendInviteModelImpl(
      id: fields[0] as int,
      userId: fields[1] as String,
      username: fields[2] as String,
      avatar: fields[3] as String?,
      status: fields[4] as String,
      sentAt: fields[5] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, _$FriendInviteModelImpl obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.userId)
      ..writeByte(2)
      ..write(obj.username)
      ..writeByte(3)
      ..write(obj.avatar)
      ..writeByte(4)
      ..write(obj.status)
      ..writeByte(5)
      ..write(obj.sentAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FriendInviteModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FriendInviteModelImpl _$$FriendInviteModelImplFromJson(
        Map<String, dynamic> json) =>
    _$FriendInviteModelImpl(
      id: json['id'] as int,
      userId: json['user_id'] as String,
      username: json['username'] as String,
      avatar: json['avatar'] as String?,
      status: json['status'] as String,
      sentAt: DateTime.parse(json['sent_at'] as String),
    );

Map<String, dynamic> _$$FriendInviteModelImplToJson(
        _$FriendInviteModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'username': instance.username,
      'avatar': instance.avatar,
      'status': instance.status,
      'sent_at': instance.sentAt.toIso8601String(),
    };
