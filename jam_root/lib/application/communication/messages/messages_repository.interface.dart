import 'package:jam/application/application.dart';
import 'package:jam/domain/domain.dart';

abstract class MessagesRepositoryInterface {
  abstract final ChatCacheInterface chatCache;
  abstract final MessagesQueueInterface chatQueue;
  abstract final MessagesRealtimeInterface messagesRealtime;

  Future<MessageModel> sendDeafultTextMessage({
    required MessageModel message,
    required int chatId,
    required UserProfileModel receiver,
  });

  Stream<List<MessageModel>> getMessages$({required ChatModel chat});

  Future<void> deleteMessage({
    required MessageModel message,
    required bool forEveryone,
  });

  Future<void> updateMessage({
    required MessageModel message,
    required UserProfileModel receiver,
  });

  Future<void> pinMessage({
    required MessageModel message,
    required bool forEveryone,
  });

  Future<void> unpinAllMessages({required int chatId});

  Future<void> unpinMessage({required MessageModel message});

  Future<List<MessageModel>> getPinnedMessages({required ChatModel chat});
  Future<List<MessageModel>> loadMorePinnedMessages({
    required ChatModel chat,
    required int offset,
  });

  Future<List<MessageModel>> loadMoreMessages({
    required int chatId,
  });
  Future<void> clearChatMessages({
    required int chatId,
    required bool forEveryone,
  });
}
