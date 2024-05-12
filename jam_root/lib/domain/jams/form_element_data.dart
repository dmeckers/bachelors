import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jam/presentation/jams/form_builder/jam_form_builder.page.dart';

part 'form_element_data.freezed.dart';
part 'form_element_data.g.dart';

@freezed
class JamFormElementData with _$JamFormElementData {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory JamFormElementData({
    required int id,
    required JamFormElementType type,
    required bool isRequired,
    required int order,
    String? label,
    String? group,
    String? hint,
    dynamic value,
    String? description,
  }) = _JamFormElementData;

  factory JamFormElementData.fromJson(Map<String, dynamic> json) =>
      _$JamFormElementDataFromJson(json);
}
