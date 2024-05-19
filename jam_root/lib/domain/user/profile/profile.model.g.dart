// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProfileModelAdapter extends TypeAdapter<_$UserProfileModelImpl> {
  @override
  final int typeId = 2;

  @override
  _$UserProfileModelImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$UserProfileModelImpl(
      id: fields[0] as String,
      username: fields[1] as String?,
      fullName: fields[2] as String?,
      photoUrls: (fields[3] as List?)?.cast<String>(),
      profileStatus: fields[4] as String?,
      friends: (fields[5] as List).cast<UserProfileModel>(),
      jams: (fields[6] as List).cast<JamModel>(),
      chats: (fields[8] as List).cast<ChatModel>(),
      vibes: (fields[9] as List).cast<VibeModel>(),
      avatar: fields[10] as String?,
      lastSignInAt: fields[11] as DateTime?,
      rootChatId: fields[12] as int?,
      publicKey: fields[13] as String?,
      lastActiveAt: fields[14] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, _$UserProfileModelImpl obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.username)
      ..writeByte(2)
      ..write(obj.fullName)
      ..writeByte(4)
      ..write(obj.profileStatus)
      ..writeByte(10)
      ..write(obj.avatar)
      ..writeByte(11)
      ..write(obj.lastSignInAt)
      ..writeByte(12)
      ..write(obj.rootChatId)
      ..writeByte(13)
      ..write(obj.publicKey)
      ..writeByte(14)
      ..write(obj.lastActiveAt)
      ..writeByte(3)
      ..write(obj.photoUrls)
      ..writeByte(5)
      ..write(obj.friends)
      ..writeByte(6)
      ..write(obj.jams)
      ..writeByte(8)
      ..write(obj.chats)
      ..writeByte(9)
      ..write(obj.vibes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProfileModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserProfileModelImpl _$$UserProfileModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserProfileModelImpl(
      id: json['id'] as String,
      username: json['username'] as String?,
      fullName: json['full_name'] as String?,
      isOnline: json['is_online'] as bool? ?? false,
      status: $enumDecodeNullable(_$ContactStatusEnumMap, json['status']) ??
          ContactStatus.normal,
      profileStatus: json['profile_status'] as String?,
      friends: (json['friends'] as List<dynamic>?)
              ?.map((e) => UserProfileModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      jams: (json['jams'] as List<dynamic>?)
              ?.map((e) => JamModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      vibes: (json['vibes'] as List<dynamic>?)
              ?.map((e) => VibeModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      avatar: json['avatar'] as String?,
      lastSignInAt: json['last_sign_in_at'] == null
          ? null
          : DateTime.parse(json['last_sign_in_at'] as String),
      rootChatId: json['root_chat_id'] as int?,
      publicKey: json['public_key'] as String?,
      lastActiveAt: DateTime.parse(json['last_active_at'] as String),
      isChatHidden:
          _ProfileJsonTransformer.readIsChatHidden(json, 'is_chat_hidden')
              as bool?,
      fcmToken: json['fcm_token'] as String?,
    );

Map<String, dynamic> _$$UserProfileModelImplToJson(
        _$UserProfileModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'full_name': instance.fullName,
      'status': _$ContactStatusEnumMap[instance.status]!,
      'profile_status': instance.profileStatus,
      'avatar': instance.avatar,
      'last_active_at': instance.lastActiveAt.toIso8601String(),
    };

const _$ContactStatusEnumMap = {
  ContactStatus.blocked: 'blocked',
  ContactStatus.muted: 'muted',
  ContactStatus.normal: 'normal',
  ContactStatus.archived: 'archived',
  ContactStatus.deleted: 'deleted',
  ContactStatus.spam: 'spam',
  ContactStatus.unknown: 'unknown',
};
