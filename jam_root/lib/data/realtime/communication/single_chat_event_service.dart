import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rxdart/rxdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:jam/application/application.dart';
import 'package:jam/config/config.dart';
import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';

class SingleChatEventService
    with SupabaseUserGetter
    implements SingleChatEventServiceInterface {
  SingleChatEventService({required this.chatId});

  RealtimeChannel? _socket;

  ///
  /// TODO maybe is not necessary
  /// TODO test with and without
  ///
  RealtimeChannel? _pushAndDie;

  final BehaviorSubject<ChatEventType> _controllers =
      BehaviorSubject<ChatEventType>();

  final int chatId;

  @override
  Future<void> fireEvent(ChatEvent event) async {
    await _socket?.sendBroadcastMessage(
      event: event.eventName,
      payload: event.payload,
    );

    _pushAndDie = supabase.channel('chat-$chatId').subscribe(
      (e, _) async {
        if (e == RealtimeSubscribeStatus.subscribed) {
          await _pushAndDie!.sendBroadcastMessage(
            event: event.eventName,
            payload: event.payload,
          );

          await _pushAndDie!.unsubscribe();
        }
      },
    );
  }

  @override
  Stream<ChatEventType> getEvents$({
    String? channelIdentifier,
  }) async* {
    _socket = supabase
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
