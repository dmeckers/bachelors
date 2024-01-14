import 'package:freezed_annotation/freezed_annotation.dart';

part 'forwarded_from.model.freezed.dart';
part 'forwarded_from.model.g.dart';

@freezed
abstract class ForwardedFromModel with _$ForwardedFromModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ForwardedFromModel(
      {required String? userId,
      required String? username,
      @Default(false) bool hideForwardedName}) = _ForwardedFromModel;

  factory ForwardedFromModel.fromJson(Map<String, dynamic> json) =>
      _$ForwardedFromModelFromJson(json);
}
