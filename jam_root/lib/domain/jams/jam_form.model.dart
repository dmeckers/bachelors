import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jam/domain/domain.dart';

part 'jam_form.model.freezed.dart';
part 'jam_form.model.g.dart';

@freezed
class JamFormModel with _$JamFormModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory JamFormModel({
    required List<JamFormElementData> elements,
    required String title,
  }) = _JamFormModel;

  factory JamFormModel.fromJson(Map<String, dynamic> json) =>
      _$JamFormModelFromJson(json);
}
