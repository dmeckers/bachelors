import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:jam/domain/domain.dart';

part 'profile_privacy_settings.model.freezed.dart';
part 'profile_privacy_settings.model.g.dart';

@freezed
class UserProfilePrivacySettingsModel with _$UserProfilePrivacySettingsModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  @HiveType(typeId: 25, adapterName: 'UserProfilePrivacySettingsModelAdapter')
  const factory UserProfilePrivacySettingsModel({
    @HiveField(0) required String id,
    @HiveField(1)
    @Default(false)
    @JsonKey(includeFromJson: false)
    bool twoStepAuthEnabled,
    @HiveField(2)
    @Default(PrivacyBoundaries.everyone)
    PrivacyBoundaries displayLastSeenVisibility,
    @HiveField(3)
    @Default(PrivacyBoundaries.everyone)
    PrivacyBoundaries mapVisibility,
    @HiveField(4)
    @Default(PrivacyBoundaries.everyone)
    PrivacyBoundaries canBeFoundByPhone,
    @HiveField(5)
    @Default(PrivacyBoundaries.everyone)
    @HiveField(6)
    PrivacyBoundaries canBeInvitedToCommunities,
    @HiveField(7)
    @Default(PrivacyBoundaries.everyone)
    PrivacyBoundaries canBeInvitedToJams,
    @HiveField(8)
    @Default(PrivacyBoundaries.everyone)
    PrivacyBoundaries aboutMeVisiblity,
    @HiveField(9)
    @Default(PrivacyBoundaries.everyone)
    PrivacyBoundaries phoneVisiblity,
    @HiveField(10)
    @Default([])
    @JsonKey(includeIfNull: false)
    List<UserProfileModel> visibleOnMapToUserList,
    @HiveField(11)
    @Default([])
    @JsonKey(includeFromJson: false, includeToJson: false)
    List<UserProfileModel> invitableToCommunitesUserList,
    @HiveField(12)
    @Default([])
    @JsonKey(includeFromJson: false, includeToJson: false)
    List<UserProfileModel> invitableToJamsUserList,
    @HiveField(13)
    @Default([])
    @JsonKey(includeFromJson: false, includeToJson: false)
    List<UserProfileModel> aboutMeVisibilityJamsUserList,
    @HiveField(14)
    @Default([])
    @JsonKey(includeFromJson: false, includeToJson: false)
    List<UserProfileModel> phoneVisibilityJamsUserList,
    @HiveField(15)
    @Default([])
    @JsonKey(includeFromJson: false, includeToJson: false)
    List<UserProfileModel> displayLastSeenVisibilityWhitelist,
  }) = _UserProfilePrivacySettingsModel;

  factory UserProfilePrivacySettingsModel.fromJson(Map<String, dynamic> json) =>
      _$UserProfilePrivacySettingsModelFromJson(json);
}
