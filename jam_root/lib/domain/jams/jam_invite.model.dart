import 'package:freezed_annotation/freezed_annotation.dart';

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
