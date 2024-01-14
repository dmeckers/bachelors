import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jam/domain/domain.dart';

part 'last_chat_message.model.freezed.dart';
part 'last_chat_message.model.g.dart';

@freezed
abstract class LastMessageModel
    with _$LastMessageModel
    implements AbstractMessageModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory LastMessageModel({
    required int id,
    required int chatId,
    required DateTime sentAt,
    required MessageType messageType,
    required String senderId,
    required String? messageText,
    @Default(MessageDeliveryStatus.sending)
    MessageDeliveryStatus? messageStatus,
    String? mediaContentUrl,
  }) = _LastMessageModel;

  const LastMessageModel._();

  @override
  AbstractMessageModel copyWithMessageText(String messageText) {
    return copyWith(messageText: messageText);
  }

  @override
  AbstractMessageModel copyWithMediaContentUrl(String mediaContentUrl) {
    return messageType == MessageType.text || messageType == MessageType.event
        ? this
        : copyWith(messageText: MessageType.toMessageString(messageType));
  }

  @override
  bool get isTextMessage => messageType == MessageType.text;

  factory LastMessageModel.fromJson(Map<String, dynamic> json) =>
      _$LastMessageModelFromJson(json);
}
