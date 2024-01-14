import 'package:jam/domain/domain.dart';

abstract class ChatQueueInterface {
  Future<void> queueClearChatMessages({
    required int chatId,
    required bool forEveryone,
  });

  Future<void> queueArchiveChats({required List<ChatModel> selectedChats});

  Future<void> queueDeleteChat({
    required ChatModel chat,
    required bool forEveryone,
  });

  Future<void> queuePinChats({required List<ChatModel> selectedChats});

  Future<void> queueUnarchiveChats({required List<ChatModel> selectedChats});

  Future<void> queueUnpinChats({required List<ChatModel> selectedChats});
}
