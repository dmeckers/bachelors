import 'package:jam/config/config.dart';
import 'package:jam/domain/domain.dart';

class UntrackChatEvent implements ChatEvent {
  UntrackChatEvent(this.chatId);

  @override
  Map<String, dynamic> get payload => {
        'chat_id': chatId,
      };

  @override
  final int chatId;

  @override
  ChatEventType toChatEventType() {
    throw UnimplementedError();
  }

  @override
  String get eventName => ChatRealTime.UNTRACK_CHAT_EVENT;
}
