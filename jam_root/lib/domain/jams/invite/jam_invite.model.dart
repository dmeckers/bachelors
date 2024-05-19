import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jam/config/config.dart';

import 'package:jam/domain/domain.dart';

part 'jam_invite.model.g.dart';
part 'jam_invite.model.freezed.dart';

@freezed
class JamInviteModel with _$JamInviteModel implements Jsonable<JamInviteModel> {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory JamInviteModel({
    required int id,
    required int jamId,
    required String invitedUserId,
    required String sendedFromUserId,
    @JsonKey(
      includeIfNull: false,
    )
    required String status,
    required DateTime insertedAt,
    required UserProfileModel sender,
    @JsonKey(
      readValue: _JamInviteJsonTransformer.readJamName,
    )
    required String jamName,
  }) = _JamInviteModel;

  const JamInviteModel._();

  factory JamInviteModel.fromJson(Map<String, dynamic> json) =>
      _$JamInviteModelFromJson(json);

  @override
  JamInviteModel fromJson(Map<String, dynamic> json) =>
      JamInviteModel.fromJson(json);

  static const jsonClassId = 'JsonInviteModel';

  @override
  String getJsonClassId() {
    return jsonClassId;
  }
}

class _JamInviteJsonTransformer {
  static Object? readJamName(json, value) => (json as Json).containsKey('jam')
      ? json['jam']['name']
      : json['jam_name'];
}
