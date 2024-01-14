import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/application/application.dart';
import 'package:jam/config/config.dart';
import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';
import 'package:rxdart/rxdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ChatsEventsService
    with SupabaseUserGetter
    implements EventServiceInterface<ChatEvents, ChatEvent> {
  final Map<int, RealtimeChannel> _sockets = {};
  final Map<int, BehaviorSubject<ChatEvent>> _controllers = {};

  @override
  Future<void> fireEvent(ChatEvent event) async {
    await _sockets[event.chatId]?.sendBroadcastMessage(
      event: event.name,
      payload: event.payload,
    );
  }

  @override
  Stream<ChatEvents> getEvents$({
    String? channelIdentifier,
    dynamic data,
  }) async* {
    final chats = data as Chats;

    for (var element in chats) {
      _controllers[element.id] = BehaviorSubject<ChatEvent>();
      _sockets[element.id] = supabase
          .channel('chat-events-${element.id}')
          .onBroadcast(
            event: RealTime.USER_STOP_TYPING_EVENT,
            callback: (payload) {
              _controllers[element.id]?.add(
                UserStopsTypingInChatEvent(
                  payload['chat_id'],
                  payload['user_id'],
                ),
              );
            },
          )
          .onBroadcast(
            event: RealTime.USER_TYPING_EVENT,
            callback: (payload) {
              _controllers[element.id]?.add(
                UserTypingInChatEvent(
                  payload['chat_id'],
                  payload['user_id'],
                ),
              );
            },
          )
          .subscribe(
        (e, _) {
          debugPrint('Chat event: $e');
        },
      );
    }

    yield* CombineLatestStream.list(
      _controllers.values.map((e) => e.stream),
    ).asBroadcastStream();
  }
}

final chatsEventsProvider =
    Provider<EventServiceInterface<ChatEvents, ChatEvent>>(
  (ref) => ChatsEventsService(),
);
