import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:jam/application/application.dart';
import 'package:jam/domain/user/profile/json_profile_transformer.dart';
import 'package:jam/domain/domain.dart';

part 'profile.model.g.dart';
part 'profile.model.freezed.dart';

enum ContactStatus { blocked, muted, normal, archived, deleted, spam, unknown }

@freezed
class UserProfileModel with _$UserProfileModel implements Identifiable {
  @HiveType(typeId: 2, adapterName: 'ProfileModelAdapter')
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory UserProfileModel({
    @HiveField(0) required String id,
    @HiveField(1) String? username,
    @HiveField(2) String? fullName,
    @HiveField(3)
    @Default([])
    @JsonKey(
      includeIfNull: false,
      fromJson: JsonProfileTransformer.listStub,
      includeFromJson: false,
      includeToJson: false,
    )
    List<String>? photoUrls,
    @JsonKey(includeToJson: false) @Default(false) bool isOnline,
    @Default(ContactStatus.normal) ContactStatus status,
    @HiveField(4) String? profileStatus,
    // @JsonKey(includeFromJson: false, includeToJson: false) required UserProfileSettingsModel profileSettings,
    @HiveField(5)
    @JsonKey(includeFromJson: true, includeToJson: false, includeIfNull: false)
    @Default([])
    List<UserProfileModel> friends,
    @HiveField(6)
    @JsonKey(includeFromJson: false, includeToJson: false)
    @Default([])
    List<JamModel> jams,
    @HiveField(7)
    @JsonKey(includeFromJson: false, includeToJson: false)
    // @Default([])
    // List<CommunityModel> communities,
    @HiveField(8)
    @JsonKey(includeFromJson: false, includeToJson: false)
    @Default([])
    List<ChatModel> chats,
    @HiveField(9)
    @JsonKey(includeToJson: false)
    @Default([])
    List<VibeModel> vibes,
    @HiveField(10) String? avatar,
    @HiveField(11) @JsonKey(includeToJson: false) DateTime? lastSignInAt,
    @HiveField(12)
    @JsonKey(
      includeToJson: false,
      readValue: _ProfileJsonTransformer.readChatId,
    )
    int? rootChatId,
    @HiveField(13) @JsonKey(includeToJson: false) String? publicKey,
  }) = _UserProfileModel;

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      _$UserProfileModelFromJson(json);
}

class _ProfileJsonTransformer {
  static Object? readChatId(json, value) => json['chat_id'];
}
