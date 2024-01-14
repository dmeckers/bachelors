import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jam/domain/domain.dart';

part 'replied_to.model.freezed.dart';
part 'replied_to.model.g.dart';

@freezed
abstract class RepliedToModel with _$RepliedToModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory RepliedToModel({
    required int messageId,
    required String senderId,
    required MessageType messageType,
    required String messageText,
  }) = _RepliedToModel;

  factory RepliedToModel.fromJson(Map<String, dynamic> json) =>
      _$RepliedToModelFromJson(json);
}
