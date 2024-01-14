import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jam/application/application.dart';
import 'package:jam/config/config.dart';
import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';
import 'package:rxdart/rxdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ChatRealtimeService
    with SupabaseUserGetter
    implements ChatRealtimeInterface {
  @override
  void dispose() {
    // TODO: implement dispose
  }

  final Map<int, BehaviorSubject<ChatModel>> _controllers = {};

  @override
  Stream<Chats> get$({String? channelIdentifier, List<ChatModel>? data}) {
    for (var element in data!) {
      _controllers[element.id] = BehaviorSubject<ChatModel>.seeded(element);

      supabase
          .channel('chat-${element.id}')
          .onPostgresChanges(
            event: PostgresChangeEvent.all,
            callback: _handleChatEvents,
            table: 'users_chats',
            filter: PostgresChangeFilter(
              type: PostgresChangeFilterType.eq,
              column: 'user_id',
              value: getUserIdOrThrow(),
            ),
          )
          .onPostgresChanges(
            event: PostgresChangeEvent.update,
            callback: (callback) {
              if (!(callback.newRecord['id'] == element.relatedContact.id)) {
                return;
              }
              _controllers[element.id]?.add(
                _controllers[element.id]!.value.copyWith(
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
          .onPostgresChanges(
            event: PostgresChangeEvent.all,
            callback: _handleMessageEvent,
            table: 'messages',
            filter: PostgresChangeFilter(
                type: PostgresChangeFilterType.eq,
                column: 'chat_id',
                value: element.id),
          )
          .subscribe(
        (e, _) {
          debugPrint('Chat event: $e');
        },
      );
    }

    return CombineLatestStream.list(
      _controllers.values.map((e) => e.stream),
    ).asBroadcastStream();
  }

  _handleChatEvents(PostgresChangePayload event) {
    final cb = switch (event.eventType) {
      PostgresChangeEvent.delete => _handleChatDeleteEvent,
      PostgresChangeEvent.insert => _handleChatUpsertEvent,
      PostgresChangeEvent.update => _handleChatUpsertEvent,
      _ => throw UnimplementedError()
    };

    cb(event);
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
    if (_controllers[payload.newRecord['chat_id']] == null) return;

    _controllers[payload.newRecord['chat_id']]?.add(
      _controllers[payload.newRecord['chat_id']]!.value.copyWith(
            lastMessage: LastMessageModel.fromJson(
              payload.newRecord..putIfAbsent('message_status', () => 'unread'),
            ),
          ),
    );
  }

  void _handleChatDeleteEvent(PostgresChangePayload payload) {
    // to do
  }
  void _handleChatUpsertEvent(PostgresChangePayload payload) {
    final chatId = payload.newRecord['chat_id'];

    _controllers[chatId]?.add(
      _controllers[chatId]!.value.copyWith(
            isArchived: payload.newRecord['is_archived'],
            isPinned: payload.newRecord['is_pinned'],
          ),
    );
  }
}

final chatRealtimeServiceProvider = Provider<ChatRealtimeInterface>((ref) {
  return ChatRealtimeService();
});
