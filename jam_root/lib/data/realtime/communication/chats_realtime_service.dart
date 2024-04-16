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
    implements ChatRealtimeInterface, FiresEvents<ChatEvent> {
  const ChatRealtimeService({required this.repository});

  @override
  final ChatRepositoryInterface repository;

  // @override
  // void dispose() {
  //   for (var element in chatControllers.values) {
  //     element.close();
  //   }
  //   chatControllers.clear();
  // }

  @override
  Stream<Chats> get$() async* {
    final cahced = localDatabase.get('chats') as List<dynamic>?;

    yield cahced?.cast<ChatModel>() ?? [];

    final data = await repository.getChats();

    for (var element in data) {
      chatControllers[element.id] = BehaviorSubject<ChatModel>.seeded(element);

      sockets[element.id] = supabase
          .channel('chat-${element.id}')

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
              if (!(callback.newRecord['id'] == element.relatedContact.id)) {
                return;
              }
              chatControllers[element.id]?.add(
                chatControllers[element.id]!.value.copyWith(
                      relatedContact:
                          UserProfileModel.fromJson(callback.newRecord),
                    ),
              );
            },
            filter: PostgresChangeFilter(
              type: PostgresChangeFilterType.eq,
              column: 'id',
              value: element.relatedContact.id,
            ),
            table: 'profiles',
          )

          ///
          /// MESSAGES
          ///
          .onPostgresChanges(
            event: PostgresChangeEvent.all,
            callback: _handleMessageEvent,
            table: 'messages',
            filter: PostgresChangeFilter(
                type: PostgresChangeFilterType.eq,
                column: 'chat_id',
                value: element.id),
          )

          ///
          /// EVENTS
          ///
          .onBroadcast(
            event: RealTime.USER_STOP_TYPING_EVENT,
            callback: (payload) {
              chatControllers[element.id]?.value =
                  chatControllers[element.id]!.value.copyWith(
                        chatEventType: ChatEventType.stopTyping,
                      );
            },
          )
          .onBroadcast(
            event: RealTime.USER_TYPING_EVENT,
            callback: (payload) {
              chatControllers[element.id]?.value =
                  chatControllers[element.id]!.value.copyWith(
                        chatEventType: ChatEventType.typing,
                      );
            },
          )
          .subscribe(
        (e, _) {
          debugPrint('Chat event: $e');
        },
      );
    }

    yield* CombineLatestStream.list(chatControllers.values.map((e) => e.stream))
        .asBroadcastStream();
  }

  void _handleMessageEvent(PostgresChangePayload payload) {
    final cb = switch (payload.eventType) {
      PostgresChangeEvent.delete => _handleDeleteEvent,
      PostgresChangeEvent.insert => _handleUpsertEvent,
      PostgresChangeEvent.update => _handleUpsertEvent,
      _ => throw UnimplementedError()
    };

    cb(payload);
  }

  void _handleDeleteEvent(PostgresChangePayload payload) {
    // todo: implement
    debugPrint(payload.toString());
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
