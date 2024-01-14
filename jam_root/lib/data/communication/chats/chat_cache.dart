import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/application/application.dart';
import 'package:jam/config/config.dart';
import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';

class ChatCache with Storer implements ChatCacheInterface {
  @override
  void cacheDraftMessage({required int chatId, required ChatState state}) {
    final cache = localDatabase.get(HiveConstants.LOCAL_DB_CHAT_STATE_KEY) ??
        <int, ChatState>{};
    localDatabase.put(
        HiveConstants.LOCAL_DB_CHAT_STATE_KEY, cache..[chatId] = state);
  }

  @override
  ChatState? getCachedDraftMessage(int chatId) {
    return localDatabase.get(HiveConstants.LOCAL_DB_CHAT_STATE_KEY)?[chatId];
  }

  @override
  void clearCachedDraftMessage(int chatId) {
    final cacheMap = localDatabase.get(HiveConstants.LOCAL_DB_CHAT_STATE_KEY) ??
        <int, ChatState>{};
    final cache =
        localDatabase.get(HiveConstants.LOCAL_DB_CHAT_STATE_KEY)?[chatId];
    if (cache == null) return;

    localDatabase.put(
      HiveConstants.LOCAL_DB_CHAT_STATE_KEY,
      cacheMap..remove(chatId),
    );
  }
}

final chatCacheProvider = Provider<ChatCache>((ref) => ChatCache());
