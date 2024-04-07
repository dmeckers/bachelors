import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jam/application/application.dart';
import 'package:jam/config/config.dart';
import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';

class ChatCache with Storer implements ChatCacheInterface {
  @override
  void cacheDraftMessage({required int chatId, required ChatState state}) {
    localDatabase.put(
      HiveConstants.LOCAL_DB_CHAT_STATE_KEY,
      map..[chatId] = state,
    );
  }

  @override
  ChatState? getCachedDraftMessage(int chatId) {
    return localDatabase.get(HiveConstants.LOCAL_DB_CHAT_STATE_KEY)?[chatId];
  }

  @override
  void clearCachedDraftMessage(int chatId) {
    if (map[chatId] == null) return;

    localDatabase.put(
      HiveConstants.LOCAL_DB_CHAT_STATE_KEY,
      map..remove(chatId),
    );
  }

  @override
  void cacheChatPageIndex({required int chatId, required int pageIndex}) {
    final updatedPageIndex =
        map[chatId]?.copyWith(page: pageIndex) ?? ChatState(page: pageIndex);

    localDatabase.put(
      HiveConstants.LOCAL_DB_CHAT_STATE_KEY,
      map..[chatId] = updatedPageIndex,
    );
  }

  Map<int, ChatState> get map {
    final cached = localDatabase.get(
      HiveConstants.LOCAL_DB_CHAT_STATE_KEY,
    ) as Map?;

    return cached?.cast<int, ChatState>() ?? <int, ChatState>{};
  }

  @override
  int getCachedChatPageIndex(int chatId) {
    return map[chatId]?.page ?? 0;
  }

  @override
  void cacheTotalPages({required int chatId, required int totalPages}) {
    final updatedTotalPages = map[chatId]?.copyWith(totalPages: totalPages) ??
        ChatState(totalPages: totalPages);

    localDatabase.put(
      HiveConstants.LOCAL_DB_CHAT_STATE_KEY,
      map..[chatId] = updatedTotalPages,
    );
  }

  @override
  int getCachedTotalPages(int chatId) {
    return map[chatId]?.totalPages ?? 0;
  }
}

final chatCacheProvider = Provider<ChatCache>((ref) => ChatCache());
