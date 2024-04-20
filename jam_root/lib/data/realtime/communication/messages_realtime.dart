import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rxdart/rxdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:jam/application/application.dart';
import 'package:jam/config/config.dart';
import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';

class MessagesRealtimeService
    with SupabaseUserGetter
    implements MessagesRealtimeInterface {
  BehaviorSubject<Messages>? _controller;

  @override
  Stream<Messages> get$({
    String? channelIdentifier,
    ChatModel? data,
  }) async* {
    _controller = BehaviorSubject<Messages>.seeded([]);

    final messages =
        await supabase.rpc('get_root_personal_chat_messages', params: {
      'chat_id': data!.id,
      'user_id': getUserIdOrThrow(),
      'message_offset': 0,
    }) as Dynamics;

    final decrypted = messages
        .map(
          (e) => MessageModel.fromJson(
            e['message'],
          ),
        )
        .toList();

    _controller!.add(decrypted);

    supabase
        .channel('chat:$channelIdentifier')
        .onPostgresChanges(
          event: PostgresChangeEvent.all,
          callback: _handleEvent,
          table: 'messages',
          filter: PostgresChangeFilter(
            type: PostgresChangeFilterType.eq,
            column: 'chat_id',
            value: data.id,
          ),
        )
        .onPostgresChanges(
          event: PostgresChangeEvent.insert,
          table: 'deleted_messages',
          callback: _handlePutInDeleted,
          filter: PostgresChangeFilter(
            type: PostgresChangeFilterType.eq,
            column: 'chat_id',
            value: data.id,
          ),
        )
        .subscribe(
      (e, _) {
        debugPrint(e.name);
      },
    );

    yield* _controller!.stream;
  }

  _handleEvent(PostgresChangePayload payload) {
    final cb = switch (payload.eventType) {
      PostgresChangeEvent.delete => _handleDeleteEvent,
      PostgresChangeEvent.insert => _handleInsertEvent,
      PostgresChangeEvent.update => _handleUpdateEvent,
      _ => throw UnimplementedError(),
    };

    cb(payload);
  }

  void _handleDeleteEvent(PostgresChangePayload payload) {
    _delete(payload.oldRecord);
  }

  void _handlePutInDeleted(PostgresChangePayload payload) {
    _controller!.add(
      _controller!.value
          .where((msg) => msg.id != payload.newRecord['message_id'])
          .toList(),
    );
  }

  void _handleInsertEvent(PostgresChangePayload payload) async {
    if (payload.newRecord['sender_id'] == getUserIdOrThrow() &&
        payload.newRecord['message_type'] != MessageType.event.name) {
      return;
    }
    pushMessage(
      MessageModel.fromJson(payload.newRecord..['from_me'] = false),
    );
  }

  void _handleUpdateEvent(PostgresChangePayload payload) async {
    if (payload.newRecord['sender_id'] == getUserIdOrThrow()) {
      return;
    }
    pushUpdateMessage(MessageModel.fromJson(payload.newRecord));
  }

  @override
  void pushMessage(MessageModel message) =>
      _controller!.add([message, ..._controller!.value]);

  @override
  void pushMessages(Messages messages) {
    final updatedState = [..._controller!.value, ...messages];
    _controller!.value = updatedState;
  }

  @override
  void pushDeleteMessage(MessageModel message) => _controller!.add(
        _controller!.value
            .where((element) => element.id != message.id)
            .toList(),
      );

  @override
  void pushUpdateMessage(MessageModel message) => _controller!.add(
        _controller!.value
            .map((e) => e.id == message.id ? message : e)
            .toList(),
      );

  _delete(Map<String, dynamic> oldRecord) {
    oldRecord['message_type'] == null
        ? _controller!.value
            .where((element) => element.id != oldRecord['id'])
            .toList()
        : pushDeleteMessage(MessageModel.fromJson(oldRecord));
  }

  @override
  void dispose() {
    _controller?.close();
  }

  @override
  void pushUnpinAllMessages() {
    _controller!.add(
      _controller!.value
          .map((e) => e.copyWith(pinnedState: MessagePinState.no_one))
          .toList(),
    );
  }

  @override
  void flushMessages() {
    _controller!.value = [];
  }
}

final messagesRealtimeProvider = Provider<MessagesRealtimeInterface>(
  (ref) => MessagesRealtimeService(),
);
