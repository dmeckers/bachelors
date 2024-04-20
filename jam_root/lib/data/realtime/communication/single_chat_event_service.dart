import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/globals.dart';
import 'package:rxdart/rxdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:jam/application/application.dart';
import 'package:jam/config/config.dart';
import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';

RealtimeChannel? _singleChatSocket;

///
/// Responsible for showing the chat events
/// e.g. typing, stop typing , sending audio, files, choosing emoji etc
///
class SingleChatEventService
    with SupabaseUserGetter
    implements SingleChatEventServiceInterface {
  SingleChatEventService({required this.chatId});

  final BehaviorSubject<ChatEventType> _controllers =
      BehaviorSubject<ChatEventType>();

  final int chatId;

  @override
  Future<void> fireEvent(ChatEvent event) async {
    await _singleChatSocket?.sendBroadcastMessage(
      event: event.eventName,
      payload: event.payload,
    );

    await MAIN_CHATS_SOCKETS[chatId]?.sendBroadcastMessage(
      event: event.eventName,
      payload: event.payload,
    );
  }

  @override
  Stream<ChatEventType> getEvents$({
    String? channelIdentifier,
  }) async* {
    _singleChatSocket = supabase
        .channel('chat-events-$channelIdentifier')
        .onBroadcast(
          event: ChatRealTime.USER_STOP_TYPING_EVENT,
          callback: (payload) {
            _controllers.value = ChatEventType.stopTyping;
          },
        )
        .onBroadcast(
          event: ChatRealTime.USER_TYPING_EVENT,
          callback: (payload) {
            _controllers.value = ChatEventType.typing;
          },
        )
        .subscribe(
      (e, _) {
        debugPrint('Chat event: $e');
      },
    );

    yield* _controllers.stream.asBroadcastStream();
  }
}

final chatsEventsProvider =
    Provider.family.autoDispose<SingleChatEventServiceInterface, int>(
  (ref, chatId) => SingleChatEventService(chatId: chatId),
);

final chatEvents$ = StreamProvider.family<ChatEventType, int>(
  (ref, chatId) {
    final service = ref.read(chatsEventsProvider(chatId));
    return service.getEvents$(channelIdentifier: chatId.toString());
  },
);
