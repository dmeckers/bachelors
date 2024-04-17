import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rxdart/rxdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:jam/application/application.dart';
import 'package:jam/config/config.dart';
import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';

final Map<int, BehaviorSubject<ChatModel?>> chatControllers = {};
final Map<int, RealtimeChannel> sockets = {};

class ChatRealtimeService
    with SupabaseUserGetter
    implements ChatRealtimeInterface, FiresEvents<ChatEvent> {
  const ChatRealtimeService({required this.repository});

  @override
  final ChatRepositoryInterface repository;

  @override
  Stream<Chats> get$() async* {
    final cahced = localDatabase.get('chats') as List<dynamic>?;

    yield cahced?.cast<ChatModel>() ?? [];

    _openRealtimeChatQueue();

    final data = await repository.getChats();

    for (var element in data) {
      chatControllers[element.id] = BehaviorSubject<ChatModel>.seeded(element);

      _subscribeChatAndStoreSocket(element.id, element.relatedContact.id);
    }

    yield* CombineLatestStream.list(chatControllers.values.map((e) => e.stream))
        .map(
          (chats) =>
              chats.where((chat) => chat != null).toList().cast<ChatModel>(),
        )
        .cast<Chats>()
        .asBroadcastStream();
  }

  ///
  /// Channel to add and remove chats in realtime
  ///
  _openRealtimeChatQueue() {
    sockets[0] = supabase
        .channel('chats-queue-${getUserIdOrThrow()}')
        .onBroadcast(
          event: ChatRealTime.TRACK_CHAT_EVENT,
          callback: (payload) async {
            final chatId = payload['chat_id'];
            if (chatControllers[chatId] != null) return;

            /// fetch chat /w messages
            final chat = await repository.getChatById(chatId: chatId);

            /// add to the list
            chatControllers[chatId] = BehaviorSubject<ChatModel>.seeded(chat);

            /// save socket connection
            _subscribeChatAndStoreSocket(chatId, chat.relatedContact.id);
          },
        )
        .onBroadcast(
          event: ChatRealTime.UNTRACK_CHAT_EVENT,
          callback: (payload) {
            final chatId = payload['chat_id'];
            if (chatControllers[chatId] == null) return;

            chatControllers[chatId]!.value = null;
            chatControllers[chatId]!.close();
            sockets[chatId]!.unsubscribe();
          },
        )
        .subscribe();
  }

  ///
  /// Subscription to chat events
  ///
  _subscribeChatAndStoreSocket(int chatId, String userId) {
    supabase
        .channel('chat-$chatId')

        ///
        /// CHAT META
        ///
        .onPostgresChanges(
          event: PostgresChangeEvent.update,
          callback: _handleChatUpdate,
          table: 'users_chats',
          filter: PostgresChangeFilter(
            type: PostgresChangeFilterType.eq,
            column: 'user_id',
            value: getUserIdOrThrow(),
          ),
        )

        ///
        /// INTERLOCUTOR
        ///
        .onPostgresChanges(
          event: PostgresChangeEvent.update,
          callback: (callback) {
            if (!(callback.newRecord['id'] == userId)) {
              return;
            }
            chatControllers[chatId]?.add(
              chatControllers[chatId]!.value?.copyWith(
                    relatedContact:
                        UserProfileModel.fromJson(callback.newRecord),
                  ),
            );
          },
          filter: PostgresChangeFilter(
            type: PostgresChangeFilterType.eq,
            column: 'id',
            value: userId,
          ),
          table: 'profiles',
        )

        ///
        /// MESSAGES UPSERT
        ///
        .onPostgresChanges(
          event: PostgresChangeEvent.update,
          callback: _handleUpsertEvent,
          table: 'messages',
          filter: PostgresChangeFilter(
            type: PostgresChangeFilterType.eq,
            column: 'chat_id',
            value: chatId,
          ),
        )
        .onPostgresChanges(
          event: PostgresChangeEvent.insert,
          callback: _handleUpsertEvent,
          table: 'messages',
          filter: PostgresChangeFilter(
            type: PostgresChangeFilterType.eq,
            column: 'chat_id',
            value: chatId,
          ),
        )

        ///
        /// EVENTS
        ///
        /// TYPING EVENTS
        ///
        .onBroadcast(
          event: ChatRealTime.USER_STOP_TYPING_EVENT,
          callback: (payload) {
            chatControllers[chatId]?.value =
                chatControllers[chatId]!.value?.copyWith(
                      chatEventType: ChatEventType.stopTyping,
                    );
          },
        )
        .onBroadcast(
          event: ChatRealTime.USER_TYPING_EVENT,
          callback: (payload) {
            chatControllers[chatId]?.value =
                chatControllers[chatId]!.value?.copyWith(
                      chatEventType: ChatEventType.typing,
                    );
          },
        )

        ///
        /// CLEAR CHAT HISTORY
        ///
        .onBroadcast(
          event: ChatRealTime.CLEAR_CHAT_HISTORY_EVENT,
          callback: (payload) {
            chatControllers[chatId]?.value =
                chatControllers[chatId]!.value?.copyWith(
                      lastMessage: null,
                    );
          },
        )
        .subscribe(
      (e, _) {
        debugPrint('Chat event: $e');
      },
    );
  }

  void _handleUpsertEvent(PostgresChangePayload payload) async {
    final data = payload.newRecord;
    if (chatControllers[data['chat_id']] == null || data['sender_id'] == null) {
      return;
    }

    chatControllers[data['chat_id']]?.value =
        chatControllers[data['chat_id']]!.value?.copyWith(
              lastMessage: LastMessageModel.fromJson(
                data
                  ..putIfAbsent('message_status', () => 'unread')
                  ..putIfAbsent(
                    'from_me',
                    () => data['sender_id'] == getUserIdOrThrow(),
                  ),
              ),
            );
  }

  void _handleChatUpdate(PostgresChangePayload payload) {
    final data = payload.newRecord;

    if (data['chat_id'] == null) {
      return;
    }

    final chatId = payload.newRecord['chat_id'];
    final previous = chatControllers[chatId]?.value;
    if (previous?.toHide == data['to_hide']) return;

    chatControllers[chatId]?.value = previous!.copyWith(
      toHide: data['to_hide'],
    );
  }

  @override
  Future<void> fireEvent(ChatEvent event) async {
    await sockets[event.chatId]?.sendBroadcastMessage(
      event: event.eventName,
      payload: event.payload,
    );
  }
}

final chatRealtimeServiceProvider = Provider<ChatRealtimeInterface>((ref) {
  return ChatRealtimeService(repository: ref.read(chatRepositoryProvider));
});

final chatStream = StreamProvider(
  (ref) => ref.read(chatRealtimeServiceProvider).get$(),
);
