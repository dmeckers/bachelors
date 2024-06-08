import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import 'package:jam/config/config.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam_utils/jam_utils.dart';

part 'jam.model.freezed.dart';
part 'jam.model.g.dart';

abstract class Jsonable<T> {
  Map<String, dynamic> toJson();
  T fromJson(Map<String, dynamic> json);
  String getJsonClassId();
}

@freezed
class JamModel with _$JamModel implements Jsonable<JamModel> {
  @JsonSerializable(fieldRename: FieldRename.snake)
  @HiveType(typeId: 28, adapterName: 'JamModelAdapter')
  const factory JamModel({
    @JsonKey(includeIfNull: false) @HiveField(0) int? id,
    /**
     * Creator of the jam
     */
    @HiveField(1)
    @JsonKey(includeToJson: false, includeIfNull: false)
    UserProfileModel? creator,
    /**
     * Jam creator id
     */
    @HiveField(2) @JsonKey(includeToJson: false) String? creatorId,

    /**
     * Description of the jam
     */
    @Default('No description this time') @HiveField(3) String? description,

    /**
     * Join requests for the jam
     */
    @HiveField(4)
    @Default([])
    @JsonKey(includeToJson: false)
    List<JamJoinRequestModel> joinRequests,
    /**
     * Jam participants
     */
    @HiveField(5) @JsonKey(includeToJson: false) double? lat,
    /**
     * longitude of the jam
     */
    @HiveField(6) @JsonKey(includeToJson: false) double? lon,
    /**
     * Date of the jam
     */
    @HiveField(7) required DateTime date,
    /**
     * Image of the jam
     */
    @HiveField(8)
    @JsonKey(includeFromJson: false, includeToJson: false)
    File? image,
    /**
     * probably will not be used in alpha version
     */
    @HiveField(9)
    @JsonKey(includeFromJson: false, includeToJson: false)
    int? chatId,
    /**
     * Maximum number of participants
     */
    @HiveField(10) @Assert('maxParticipants > -2') required int maxParticipants,
    /**
     * Number of invites per member
     */
    @HiveField(11)
    @Assert('invitesPerMember >-2')
    required int invitesPerMember,
    /**
     * Extra information about the jam
     */
    @HiveField(12) @Default('') String? extraInformation,
    /**
     * Related community
     */
    @HiveField(13)
    @JsonKey(includeFromJson: false, includeToJson: false)
    @Default(null)
    CommunityModel? relatedCommunity,
    /**
     * Icon of the jam
     */
    @HiveField(14) @JsonKey(includeIfNull: false) @Default('') String iconUrl,
    /**
     * Jam admins
     */
    @JsonKey(
      includeToJson: false,
      includeIfNull: false,
      includeFromJson: false,
    )
    @HiveField(15)
    @Default([])
    List<UserProfileModel> admins,
    /**
     * Jam participants
     */
    @HiveField(16)
    @JsonKey(
      includeToJson: false,
      includeIfNull: false,
    )
    @Default([])
    List<UserProfileModel> participants,
    /**
     * Jam background
     */
    @HiveField(17) @JsonKey(includeIfNull: false) String? backgroundUrl,
    /**
     * Related vibes
     */
    @HiveField(18)
    @Default([])
    @JsonKey(toJson: JsonVibeTransformer.vibesToIds, includeIfNull: false)
    // @Assert('relatedVibes.length > 0')
    List<VibeModel> relatedVibes,
    /**
     * Jam background
     */
    @HiveField(19)
    @JsonKey(
      includeToJson: false,
      includeFromJson: false,
    )
    @Default(false)
    bool dropBackground,
    /**
     * Jam join type
     */
    @HiveField(20)
    @JsonKey(includeIfNull: false)
    @Default(JamJoinTypeEnum.freeToJoin)
    JamJoinTypeEnum joinType,
    /**
     * Jam form model
     */
    @HiveField(21) BaseJamFormModel? formModel,
    /**
     * Location name of the jam
     */
    @HiveField(22) @Default('Check map') String? locationName,
    /**
     * Name of the jam
     */
    @HiveField(23) required String name,
    @HiveField(24)
    @JsonKey(
      toJson: JsonJamTransformer.locationToJson,
      fromJson: JsonJamTransformer.locationFromJson,
      readValue: JsonJamTransformer.readItself,
      includeIfNull: false,
    )
    required String location,
    @HiveField(25)
    @JsonKey(includeIfNull: false)
    @Default(JamQrModeEnum.none)
    JamQrModeEnum qrMode,
  }) = _JamModel;

  const JamModel._();

  bool get isPast => date.isBefore(DateTime.now());

  factory JamModel.fromJson(Map<String, dynamic> json) =>
      _$JamModelFromJson(json);

  @override
  JamModel fromJson(Map<String, dynamic> json) => JamModel.fromJson(json);

  // static identifier for go router codec converter
  static const jsonClassId = 'JamModel';

  bool get isOutdated => date.isBefore(DateTime.now());

  @override
  String getJsonClassId() => jsonClassId;

  JamLocation toLocationModel() {
    return JamLocation(
      jamId: id!,
      name: name,
      description: description ?? 'No description this time',
      locationName: locationName ?? 'Unknown',
      date: date,
      latitude: lat!,
      longitude: lon!,
      vibes: relatedVibes,
      creatorId: creatorId!,
      joinType: joinType,
    );
  }
}

//presentation layer specific todo move to presentation layer
extension JamModelExtension on JamModel {
  JamModel get filledWithDefaults {
    return copyWith(
      name: name.isNullOrEmpty ? 'Anonymous Jam' : name,
      description:
          description.isNullOrEmpty ? 'No description this time' : description,
      locationName: locationName.isNullOrEmpty ? 'Not specified' : locationName,
    );
  }

  String get backgroundUrlWithPlaceholder {
    final user = supabase.auth.currentUser;

    return user == null || backgroundUrl.isEmptyOrNull
        ? ImagePathConstants.DEFAULT_JAM_IMAGE_BUCKET_URL
        : supaBucket
            .getPublicUrl('jams/${user.id}/jams_backgrounds/$backgroundUrl');
  }
}
