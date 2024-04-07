import 'package:jam/config/config.dart';
import 'package:jam/domain/domain.dart';

class UserStopsTypingInChatEvent implements ChatEvent {
  const UserStopsTypingInChatEvent(this.chatId, this.userId);

  @override
  final int chatId;
  final String userId;

  @override
  final String eventName = RealTime.USER_STOP_TYPING_EVENT;

  @override
  Map<String, dynamic> get payload => {
        'user_id': userId,
        'chat_id': chatId,
      };

  @override
  ChatEventType toChatEventType() => ChatEventType.stopTyping;
}
