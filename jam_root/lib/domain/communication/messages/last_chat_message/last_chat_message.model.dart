import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import 'package:jam/domain/domain.dart';

part 'last_chat_message.model.freezed.dart';
part 'last_chat_message.model.g.dart';

@freezed
abstract class LastMessageModel
    with _$LastMessageModel
    implements AbstractMessageModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  @HiveType(typeId: 63, adapterName: 'LastMessageModelAdapter')
  const factory LastMessageModel({
    @HiveField(0) required int id,
    @HiveField(1) required int chatId,
    @HiveField(2) required DateTime sentAt,
    @HiveField(3) required MessageType messageType,
    @HiveField(4) required String senderId,
    @HiveField(5) required String? messageText,
    @Default(MessageDeliveryStatus.sending)
    @HiveField(6)
    MessageDeliveryStatus? messageStatus,
    @HiveField(7) String? mediaContentUrl,
    @HiveField(8) required bool fromMe,
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
