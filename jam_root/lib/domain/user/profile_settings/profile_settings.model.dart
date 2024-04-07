import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:jam/domain/domain.dart';

part 'profile_settings.model.freezed.dart';
part 'profile_settings.model.g.dart';

@freezed
class UserProfileSettingsModel with _$UserProfileSettingsModel {
  const factory UserProfileSettingsModel({
    required int id,
    @Default(null) UserProfilePrivacySettingsModel? privacySettings,
  }) = _UserProfileSettingsModel;

  factory UserProfileSettingsModel.fromJson(Map<String, dynamic> json) =>
      _$UserProfileSettingsModelFromJson(json);
}
