// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_settings.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserProfileSettingsModelImpl _$$UserProfileSettingsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserProfileSettingsModelImpl(
      id: json['id'] as int,
      privacySettings: json['privacySettings'] == null
          ? null
          : UserProfilePrivacySettingsModel.fromJson(
              json['privacySettings'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserProfileSettingsModelImplToJson(
        _$UserProfileSettingsModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'privacySettings': instance.privacySettings,
    };
