import 'package:jam/config/config.dart';
import 'package:jam/domain/domain.dart';

class TrackChatEvent implements ChatEvent {
  TrackChatEvent(this.chatId, this.userId);

  @override
  final int chatId;

  final String userId;

  @override
  Map<String, dynamic> get payload => {
        'chat_id': chatId,
        'user_id': userId,
      };

  @override
  ChatEventType toChatEventType() {
    throw UnimplementedError();
  }

  @override
  String get eventName => ChatRealTime.TRACK_CHAT_EVENT;
}
