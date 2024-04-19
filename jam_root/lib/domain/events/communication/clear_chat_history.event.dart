import 'package:jam/config/config.dart';
import 'package:jam/domain/domain.dart';

class ClearChatHistoryEvent implements ChatEvent {
  ClearChatHistoryEvent(this.chatId);

  @override
  final int chatId;

  @override
  Map<String, dynamic> get payload => {
        'chat_id': chatId,
      };

  @override
  ChatEventType toChatEventType() {
    throw UnimplementedError();
  }

  @override
  String get eventName => ChatRealTime.CLEAR_CHAT_HISTORY_EVENT;
}