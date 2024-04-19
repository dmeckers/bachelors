import 'package:jam/application/application.dart';
import 'package:jam/domain/domain.dart';

abstract class ChatRepositoryInterface {
  Future<void> archiveChats({required List<ChatModel> selectedChats});
  Future<void> unarchiveChats({required List<ChatModel> selectedChats});
  Future<void> pinChats({required List<ChatModel> selectedChats});
  Future<List<ChatModel>> getChats();
  Future<ChatModel> getChatById({required int chatId});
  Future<void> unpinChats({required List<ChatModel> selectedChats});

  // Future<void> muteChats({required List<ChatModel> selectedChats});
  // Future<void> unmuteChats({required List<ChatModel> selectedChats});

  Future<void> deleteChats({
    required List<ChatModel> selectedChats,
    bool forBoth = false,
  });

  abstract final ChatQueueInterface queue;
  abstract final ChatCacheInterface cache;
}
