import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jam/domain/domain.dart';

part 'jam_form.model.freezed.dart';
part 'jam_form.model.g.dart';

@freezed
class JamJoinRequestModel with _$JamJoinRequestModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory JamJoinRequestModel({
    required List<JamFormElementData> elements,
    required String title,
    @JsonKey(includeIfNull: false) String? filledByUserId,
  }) = _JamJoinRequestModel;

  factory JamJoinRequestModel.fromJson(Map<String, dynamic> json) =>
      _$JamJoinRequestModelFromJson(json);
}
