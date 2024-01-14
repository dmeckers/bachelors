import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/config/config.dart';
import 'package:jam/domain/domain.dart';
import 'package:annotations/annotations.dart';
import 'package:jam_ui/jam_ui.dart';
import 'package:jam_utils/jam_utils.dart';

part 'jam.model.freezed.dart';
part 'jam.model.g.dart';
part 'jam.model.j-gen.dart';

abstract class Jsonable<T> {
  Map<String, dynamic> toJson();
  T fromJson(Map<String, dynamic> json);
  String getJsonClassId();
}

@ViewModelAnnotation(withStateNotifier: true)
@freezed
class JamModel with _$JamModel implements Jsonable<JamModel> {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory JamModel({
    @JsonKey(includeIfNull: false) int? id,
    @JsonKey(includeToJson: false, includeIfNull: false)
    UserProfileModel? creator,
    @JsonKey(includeToJson: false) String? creatorId,
    @Default('Anonymous Jam') String? name,
    @Default('No description this time') String? description,
    @Default('Check map') String? locationName,

    ///
    /// this is fucked up
    @JsonKey(
      toJson: JsonJamTransformer.locationToJson,
      fromJson: JsonJamTransformer.locationFromJson,
      readValue: JsonJamTransformer.readItself,
      includeIfNull: false,
    )
    required String location,
    @JsonKey(includeToJson: false) double? lat,
    @JsonKey(includeToJson: false) double? lon,
    required DateTime date,
    @JsonKey(includeFromJson: false, includeToJson: false) File? image,
    //probably will not be used in alpha version
    @JsonKey(includeFromJson: false, includeToJson: false) int? chatId,
    @Assert('maxParticipants > -2') required int maxParticipants,
    @Assert('invitesPerMember >-2') required int invitesPerMember,
    @Default('') String? extraInformation,
    @JsonKey(includeFromJson: false, includeToJson: false)
    @Default(null)
    CommunityModel? relatedCommunity,
    @Default(false) bool invitesOnly,
    @JsonKey(includeIfNull: false) @Default('') String iconUrl,
    @JsonKey(
      includeToJson: false,
      includeIfNull: false,
      includeFromJson: false,
    )
    @Default([])
    List<UserProfileModel> admins,
    @JsonKey(
      includeToJson: false,
      includeIfNull: false,
    )
    @Default([])
    List<UserProfileModel> participants,
    @JsonKey(includeIfNull: false) String? backgroundUrl,
    @JsonKey(toJson: JsonVibeTransformer.vibesToIds)
    @Assert('relatedVibes.length > 0')
    required List<VibeModel> relatedVibes,
    @JsonKey(
      includeToJson: false,
      includeFromJson: false,
    )
    @Default(false)
    bool dropBackground,
  }) = _JamModel;

  const JamModel._();

  bool get isPast => date.isBefore(DateTime.now());

  factory JamModel.fromJson(Map<String, dynamic> json) =>
      _$JamModelFromJson(json);

  @override
  JamModel fromJson(Map<String, dynamic> json) => JamModel.fromJson(json);

  // static identifier for go router codec converter
  static const jsonClassId = 'JamModel';

  @override
  String getJsonClassId() => jsonClassId;
}

//presentation layer specific todo move to presentation layer
extension JamModelExtension on JamModel {
  JamModel get backfilled {
    var jam = this;
    if (name.isNull || (name?.isEmpty ?? true)) {
      jam = jam.copyWith(name: 'Anonymous Jam');
    }
    if (description.isNull || (description?.isEmpty ?? true)) {
      jam = jam.copyWith(description: 'No description this time');
    }
    if (locationName.isNull || (locationName?.isEmpty ?? true)) {
      jam = jam.copyWith(locationName: 'Check map');
    }
    return jam;
  }

  String get backgroundUrlWithPlaceholder {
    final user = supabase.auth.currentUser;

    return user == null || backgroundUrl.isEmptyOrNull
        ? ImagePathConstants.DEFAULT_JAM_IMAGE_BUCKET_URL
        : supaBucket
            .getPublicUrl('jams/${user.id}/jams_backgrounds/$backgroundUrl');
  }
}
