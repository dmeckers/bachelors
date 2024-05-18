import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:jam/application/application.dart';
import 'package:jam/config/config.dart';
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

    ///
    /// Bucket links to user's photos
    ///
    @HiveField(3)
    @Default([])
    @JsonKey(
      includeIfNull: false,
      fromJson: JsonProfileTransformer.listStub,
      includeFromJson: false,
      includeToJson: false,
    )
    List<String>? photoUrls,

    ///
    /// Checks both isonline and lastActiveAt
    /// @see lastActiveAt
    ///
    @JsonKey(includeToJson: false) @Default(false) bool isOnline,
    @Default(ContactStatus.normal) ContactStatus status,
    @HiveField(4) String? profileStatus,
    // @JsonKey(includeFromJson: false, includeToJson: false) required UserProfileSettingsModel profileSettings,

    ///
    /// Friends of user
    ///
    @HiveField(5)
    @JsonKey(includeFromJson: true, includeToJson: false, includeIfNull: false)
    @Default([])
    List<UserProfileModel> friends,

    ///
    /// User's jams
    ///
    @HiveField(6)
    @JsonKey(includeFromJson: false, includeToJson: false)
    @Default([])
    List<JamModel> jams,

    /// Future feature
    /// @HiveField(7)
    /// @JsonKey(includeFromJson: false, includeToJson: false)
    /// @Default([])
    /// List<CommunityModel> communities,

    ///
    /// Internal collection (may in future return from database)
    ///
    @HiveField(8)
    @JsonKey(includeFromJson: false, includeToJson: false)
    @Default([])
    List<ChatModel> chats,

    ///
    /// User's vibes
    ///
    @HiveField(9)
    @JsonKey(includeToJson: false)
    @Default([])
    List<VibeModel> vibes,

    ///
    /// link from database to bucket main avatar
    ///
    @HiveField(10) String? avatar,
    @HiveField(11) @JsonKey(includeToJson: false) DateTime? lastSignInAt,

    ///
    /// chat id linked to interlocutor
    ///
    @HiveField(12)
    @JsonKey(
      includeToJson: false,
      // readValue: _ProfileJsonTransformer.readChatId,
    )
    int? rootChatId,

    ///
    /// Public key (inactive for now)
    ///
    @HiveField(13) @JsonKey(includeToJson: false) String? publicKey,

    ///
    /// Last active at
    ///
    @HiveField(14) required DateTime lastActiveAt,

    ///
    /// Utility field for events
    /// @see jam_root/lib/data/realtime/communication/chats_realtime_service.dart
    /// @see jam_root/lib/presentation/communication/widgets/chats/input_bar/send_button/controller.dart
    ///
    @JsonKey(
      readValue: _ProfileJsonTransformer.readIsChatHidden,
      includeIfNull: false,
      includeToJson: false,
    )
    bool? isChatHidden,

    ///
    /// Utility token for push notifications
    ///
    @JsonKey(
      includeIfNull: false,
      includeToJson: false,
    )
    String? fcmToken,
  }) = _UserProfileModel;

  const UserProfileModel._();

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      _$UserProfileModelFromJson(json);

  get avatarUrlWithPlaceholder =>
      avatar ?? ImagePathConstants.DEFAULT_AVATAR_IMAGE_BUCKET_URL;

  get isOnlineAndActive =>
      isOnline &&
      lastActiveAt.isAfter(
        DateTime.now().subtract(
          const Duration(minutes: 15),
        ),
      );
}

class _ProfileJsonTransformer {
  // static Object? readChatId(json, value) => json['root_chat_id'];
  static Object? readIsChatHidden(json, value) => json['to_hide'];
}
