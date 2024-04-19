import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rxdart/rxdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:jam/application/application.dart';
import 'package:jam/config/config.dart';
import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';

final Map<int, BehaviorSubject<ChatModel>> chatControllers = {};
final Map<int, RealtimeChannel> sockets = {};

class ChatRealtimeService
    with SupabaseUserGetter
    implements ChatRealtimeInterface {
  ChatRealtimeService({required this.repository});

  @override
  final ChatRepositoryInterface repository;

  // final _chats = BehaviorSubject<Chats>.seeded([]);

  final _chatStreams = BehaviorSubject<List<Stream<ChatModel>>>.seeded([]);
  RealtimeChannel? pushAndDie;

  @override
  Stream<Chats> get$() async* {
    final cahced = localDatabase.get('chats') as List<dynamic>?;

    yield cahced?.cast<ChatModel>() ?? [];

    final data = await repository.getChats();

    _openRealtimeChatQueue();

    for (var element in data) {
      chatControllers[element.id] = BehaviorSubject<ChatModel>.seeded(element);

      _subscribeChatAndStoreSocket(element.id, element.relatedContact.id);
    }

    _chatStreams.value = chatControllers.values.map((e) => e.stream).toList();

    yield* _chatStreams.stream
        .scan(
          (accumulated, value, index) => [...accumulated, ...value],
          List<Stream<ChatModel>>.empty(growable: true),
        )
        .switchMap((streams) => CombineLatestStream.list(streams))
        .map(
          (chats) => chats.where((chat) => chat.toHide == false).toList(),
        )
        .asBroadcastStream();
  }

  ///
  /// Channel to add and remove chats in realtime
  ///
  _openRealtimeChatQueue() {
    sockets[0] = supabase
        .channel('chats-gates-${getUserIdOrThrow()}')
        .onBroadcast(
          event: ChatRealTime.TRACK_CHAT_EVENT,
          callback: (payload) async {
            final chatId = payload['chat_id'];
            if (chatControllers[chatId] != null) return;
            pushChatAndSubscribe(chatId);
          },
        )
        .onBroadcast(
          event: ChatRealTime.UNTRACK_CHAT_EVENT,
          callback: (payload) {
            final chatId = payload['chat_id'];
            if (chatControllers[chatId] == null) return;
          },
        )
        .subscribe();
  }

  ///
  /// Subscription to chat events
  ///
  _subscribeChatAndStoreSocket(int chatId, String userId) {
    sockets[chatId] = supabase
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
              chatControllers[chatId]!.value.copyWith(
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
                chatControllers[chatId]!.value.copyWith(
                      chatEventType: ChatEventType.stopTyping,
                    );
          },
        )
        .onBroadcast(
          event: ChatRealTime.USER_TYPING_EVENT,
          callback: (payload) {
            chatControllers[chatId]?.value =
                chatControllers[chatId]!.value.copyWith(
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
                chatControllers[chatId]!.value.copyWith(
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
        chatControllers[data['chat_id']]!.value.copyWith(
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

    if (data['chat_id'] == null || data['user_id'] != getUserIdOrThrow()) {
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
    if (event is TrackChatEvent) {
      pushAndDie = supabase.channel('chats-gates-${event.userId}').subscribe(
        (e, _) async {
          if (e == RealtimeSubscribeStatus.subscribed) {
            await pushAndDie!.sendBroadcastMessage(
              event: event.eventName,
              payload: event.payload,
            );

            pushAndDie!.unsubscribe();
          }
        },
        const Duration(seconds: 5),
      );
    } else {
      await sockets[event.chatId]?.sendBroadcastMessage(
        event: event.eventName,
        payload: event.payload,
      );
    }
  }

  @override
  Future<void> pushChatAndSubscribe(int chatId) async {
    /// fetch chat /w messages
    final chat = await repository.getChatById(chatId: chatId);

    /// add to the list
    chatControllers[chatId] = BehaviorSubject<ChatModel>.seeded(chat);

    /// update _chatStreams
    _chatStreams.value = chatControllers.values.map((e) => e.stream).toList();

    /// save socket connection
    _subscribeChatAndStoreSocket(chatId, chat.relatedContact.id);
  }

  @override
  void removeChatAndUnsubscribe(int chatId) {
    ///
    /// First pass to stream null to all
    /// listeners to remove the chat from lists
    ///
    // chatControllers[chatId]!.value = null;

    ///
    /// Unsub and close to avoid memory leaks
    ///
    sockets[chatId]!.unsubscribe();
    chatControllers[chatId]!.close();

    ///
    /// Clear map key to be sure
    /// nothing is left
    ///
    chatControllers.remove(chatId);
  }
}

final chatRealtimeServiceProvider = Provider<ChatRealtimeInterface>((ref) {
  return ChatRealtimeService(repository: ref.read(chatRepositoryProvider));
});

final chatStream = StreamProvider(
  (ref) => ref.read(chatRealtimeServiceProvider).get$(),
);
