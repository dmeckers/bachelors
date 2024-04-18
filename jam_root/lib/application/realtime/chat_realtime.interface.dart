import 'package:jam/application/application.dart';

import 'package:jam/domain/domain.dart';

abstract class ChatRealtimeInterface implements FiresEvents<ChatEvent> {
  abstract final ChatRepositoryInterface repository;

  Stream<List<ChatModel>> get$();
  Future<void> pushChatAndSubscribe(int chatId);
  void removeChatAndUnsubscribe(int chatId);
}

abstract class SingleChatEventServiceInterface
    implements NoParameterEventServiceInterface<ChatEventType, ChatEvent> {}
