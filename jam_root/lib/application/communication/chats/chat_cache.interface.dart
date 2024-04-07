import 'package:jam/domain/domain.dart';

abstract class ChatCacheInterface {
  void cacheDraftMessage({required int chatId, required ChatState state});

  ChatState? getCachedDraftMessage(int chatId);

  void clearCachedDraftMessage(int chatId);

  void cacheChatPageIndex({required int chatId, required int pageIndex});

  void cacheTotalPages({required int chatId, required int totalPages});

  int getCachedChatPageIndex(int chatId);

  int getCachedTotalPages(int chatId);
}
