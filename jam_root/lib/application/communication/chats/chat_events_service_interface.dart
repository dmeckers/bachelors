import 'package:jam/domain/domain.dart';

abstract class ChatEventsServiceInterface {
  Future<void> fireTypingEvent({required int chatId});

  Future<void> fireStopTypingEvent({required int chatId});

  Stream<Map<int, ChatEventType>> getChatsEvents$({
    required List<ChatModel> chats,
  });

  Stream<ChatEventType> getChatEvents$({required int chatId});

  Stream<Map<String, UserProfileModel>> getFriendsEvents$();
}
