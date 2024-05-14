import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jam/domain/domain.dart';

part 'join_request_model.freezed.dart';
part 'join_request_model.g.dart';

@freezed
class JamJoinRequestModel with _$JamJoinRequestModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory JamJoinRequestModel({
    required int id,
    required int jamId,
    required DateTime? seenAt,
    required String userId,
    required ProcessStepTypeEnum status,
    BaseJamFormModel? filledForm,
  }) = _JamJoinRequestModel;

  factory JamJoinRequestModel.fromJson(Map<String, dynamic> json) =>
      _$JamJoinRequestModelFromJson(json);
}
