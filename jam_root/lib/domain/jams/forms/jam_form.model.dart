import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jam/domain/domain.dart';

part 'jam_form.model.freezed.dart';
part 'jam_form.model.g.dart';

@freezed
class BaseJamFormModel with _$BaseJamFormModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory BaseJamFormModel({
    required List<JamFormElementData> elements,
    required String title,
    @JsonKey(includeIfNull: false) String? filledByUserId,
  }) = _BaseJamFormModel;

  factory BaseJamFormModel.fromJson(Map<String, dynamic> json) =>
      _$BaseJamFormModelFromJson(json);
}
