import 'package:jam/domain/domain.dart';

abstract class AbstractMessageModel {
  abstract final int? id;
  abstract final MessageType messageType;
  abstract final DateTime sentAt;
  abstract final int? chatId;
  abstract final String? messageText;
  abstract final String? senderId;
  abstract final String? mediaContentUrl;
  abstract final bool fromMe;

  bool get isTextMessage => messageType == MessageType.text;
  AbstractMessageModel copyWithMessageText(String messageText);
  AbstractMessageModel copyWithMediaContentUrl(String mediaContentUrl);
}
