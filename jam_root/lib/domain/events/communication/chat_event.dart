import 'package:jam/domain/domain.dart';

abstract class ChatEvent implements Event {
  const ChatEvent(this.payload, this.chatId);

  ChatEventType toChatEventType();

  @override
  final String name = 'CHAT_EVENT';

  @override
  final Map<String, dynamic> payload;

  final int chatId;
}
