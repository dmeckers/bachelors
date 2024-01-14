import 'package:jam/domain/domain.dart';

abstract class ChatCacheInterface {
  void cacheDraftMessage({required int chatId, required ChatState state});

  ChatState? getCachedDraftMessage(int chatId);

  void clearCachedDraftMessage(int chatId);
}
