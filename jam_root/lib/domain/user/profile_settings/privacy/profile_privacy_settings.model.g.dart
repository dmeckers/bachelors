// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_privacy_settings.model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserProfilePrivacySettingsModelAdapter
    extends TypeAdapter<_$UserProfilePrivacySettingsModelImpl> {
  @override
  final int typeId = 25;

  @override
  _$UserProfilePrivacySettingsModelImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$UserProfilePrivacySettingsModelImpl(
      id: fields[0] as String,
      twoStepAuthEnabled: fields[1] as bool,
      displayLastSeenVisibility: fields[2] as PrivacyBoundaries,
      mapVisibility: fields[3] as PrivacyBoundaries,
      canBeFoundByPhone: fields[4] as PrivacyBoundaries,
      canBeInvitedToCommunities: fields[5] as PrivacyBoundaries,
      canBeInvitedToJams: fields[7] as PrivacyBoundaries,
      aboutMeVisiblity: fields[8] as PrivacyBoundaries,
      phoneVisiblity: fields[9] as PrivacyBoundaries,
      visibleOnMapToUserList: (fields[10] as List).cast<UserProfileModel>(),
      invitableToCommunitesUserList:
          (fields[11] as List).cast<UserProfileModel>(),
      invitableToJamsUserList: (fields[12] as List).cast<UserProfileModel>(),
      aboutMeVisibilityJamsUserList:
          (fields[13] as List).cast<UserProfileModel>(),
      phoneVisibilityJamsUserList:
          (fields[14] as List).cast<UserProfileModel>(),
      displayLastSeenVisibilityWhitelist:
          (fields[15] as List).cast<UserProfileModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, _$UserProfilePrivacySettingsModelImpl obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.twoStepAuthEnabled)
      ..writeByte(2)
      ..write(obj.displayLastSeenVisibility)
      ..writeByte(3)
      ..write(obj.mapVisibility)
      ..writeByte(4)
      ..write(obj.canBeFoundByPhone)
      ..writeByte(5)
      ..write(obj.canBeInvitedToCommunities)
      ..writeByte(7)
      ..write(obj.canBeInvitedToJams)
      ..writeByte(8)
      ..write(obj.aboutMeVisiblity)
      ..writeByte(9)
      ..write(obj.phoneVisiblity)
      ..writeByte(10)
      ..write(obj.visibleOnMapToUserList)
      ..writeByte(11)
      ..write(obj.invitableToCommunitesUserList)
      ..writeByte(12)
      ..write(obj.invitableToJamsUserList)
      ..writeByte(13)
      ..write(obj.aboutMeVisibilityJamsUserList)
      ..writeByte(14)
      ..write(obj.phoneVisibilityJamsUserList)
      ..writeByte(15)
      ..write(obj.displayLastSeenVisibilityWhitelist);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserProfilePrivacySettingsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserProfilePrivacySettingsModelImpl
    _$$UserProfilePrivacySettingsModelImplFromJson(Map<String, dynamic> json) =>
        _$UserProfilePrivacySettingsModelImpl(
          id: json['id'] as String,
          displayLastSeenVisibility: $enumDecodeNullable(
                  _$PrivacyBoundariesEnumMap,
                  json['display_last_seen_visibility']) ??
              PrivacyBoundaries.everyone,
          mapVisibility: $enumDecodeNullable(
                  _$PrivacyBoundariesEnumMap, json['map_visibility']) ??
              PrivacyBoundaries.everyone,
          canBeFoundByPhone: $enumDecodeNullable(
                  _$PrivacyBoundariesEnumMap, json['can_be_found_by_phone']) ??
              PrivacyBoundaries.everyone,
          canBeInvitedToCommunities: $enumDecodeNullable(
                  _$PrivacyBoundariesEnumMap,
                  json['can_be_invited_to_communities']) ??
              PrivacyBoundaries.everyone,
          canBeInvitedToJams: $enumDecodeNullable(
                  _$PrivacyBoundariesEnumMap, json['can_be_invited_to_jams']) ??
              PrivacyBoundaries.everyone,
          aboutMeVisiblity: $enumDecodeNullable(
                  _$PrivacyBoundariesEnumMap, json['about_me_visiblity']) ??
              PrivacyBoundaries.everyone,
          phoneVisiblity: $enumDecodeNullable(
                  _$PrivacyBoundariesEnumMap, json['phone_visiblity']) ??
              PrivacyBoundaries.everyone,
          visibleOnMapToUserList:
              (json['visible_on_map_to_user_list'] as List<dynamic>?)
                      ?.map((e) =>
                          UserProfileModel.fromJson(e as Map<String, dynamic>))
                      .toList() ??
                  const [],
        );

Map<String, dynamic> _$$UserProfilePrivacySettingsModelImplToJson(
        _$UserProfilePrivacySettingsModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'display_last_seen_visibility':
          _$PrivacyBoundariesEnumMap[instance.displayLastSeenVisibility]!,
      'map_visibility': _$PrivacyBoundariesEnumMap[instance.mapVisibility]!,
      'can_be_found_by_phone':
          _$PrivacyBoundariesEnumMap[instance.canBeFoundByPhone]!,
      'can_be_invited_to_communities':
          _$PrivacyBoundariesEnumMap[instance.canBeInvitedToCommunities]!,
      'can_be_invited_to_jams':
          _$PrivacyBoundariesEnumMap[instance.canBeInvitedToJams]!,
      'about_me_visiblity':
          _$PrivacyBoundariesEnumMap[instance.aboutMeVisiblity]!,
      'phone_visiblity': _$PrivacyBoundariesEnumMap[instance.phoneVisiblity]!,
      'visible_on_map_to_user_list': instance.visibleOnMapToUserList,
    };

const _$PrivacyBoundariesEnumMap = {
  PrivacyBoundaries.everyone: 'everyone',
  PrivacyBoundaries.friendsOnly: 'friendsOnly',
  PrivacyBoundaries.noOne: 'noOne',
  PrivacyBoundaries.rangeOfUsers: 'rangeOfUsers',
};
