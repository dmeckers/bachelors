import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/application/application.dart';
import 'package:jam/config/config.dart';
import 'package:jam/data/data.dart';
import 'package:jam/domain/communication/chats/chat.model.dart';

class ChatQueue with SupabaseUserGetter implements ChatQueueInterface {
  toggleChatsQuery(Integers chats, String key, String value) {
    final placeholders =
        List<String>.generate(chats.length, (index) => '?').join(',');
    return """
          UPDATE
            users_chats
          SET $key = $value
          WHERE
            chat_id IN ($placeholders)
          AND
            user_id = ?;
        """;
  }

  @override
  Future<void> queueArchiveChats({required Chats selectedChats}) {
    final chatIds = selectedChats.map((e) => e.id).toList();

    return PowerSync.db.execute(
      toggleChatsQuery(chatIds, 'is_archived', 'true'),
      [
        ...chatIds,
        getUserIdOrThrow(),
      ],
    );
  }

  @override
  Future<void> queueClearChatMessages({
    required int chatId,
    required bool forEveryone,
  }) {
    final userId = getUserIdOrThrow();

    const CLEAR_CHAT_FOR_ME_SQL = """
    INSERT INTO deleted_messages (message_id, user_id)
    SELECT id, ? FROM messages WHERE chat_id = ?
    WHERE NOT EXISTS (SELECT 1 FROM deleted_messages WHERE message_id = id AND user_id = ?);
""";

    const CLEAR_CHAT_FOR_EVERYONE_SQL = """
    DELETE FROM messages WHERE chat_id = ?;
  """;

    return forEveryone
        ? PowerSync.db.execute(CLEAR_CHAT_FOR_EVERYONE_SQL, [chatId])
        : PowerSync.db.execute(
            CLEAR_CHAT_FOR_ME_SQL,
            [userId, chatId, userId],
          );
  }

  @override
  Future<void> queuePinChats({required Chats selectedChats}) {
    final chatIds = selectedChats.map((e) => e.id).toList();

    return PowerSync.db.execute(
      toggleChatsQuery(chatIds, 'is_pinned', 'true'),
      [
        ...chatIds,
        getUserIdOrThrow(),
      ],
    );
  }

  @override
  Future<void> queueUnarchiveChats({required Chats selectedChats}) {
    final chatIds = selectedChats.map((e) => e.id).toList();
    try {
      return PowerSync.db.execute(
        toggleChatsQuery(chatIds, 'is_archived', '0'),
        [
          ...chatIds,
          getUserIdOrThrow(),
        ],
      );
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> queueUnpinChats({required Chats selectedChats}) {
    final chatIds = selectedChats.map((e) => e.id).toList();

    return PowerSync.db.execute(
      toggleChatsQuery(chatIds, 'is_pinned', 'false'),
      [
        ...chatIds,
        getUserIdOrThrow(),
      ],
    );
  }

  @override
  Future<void> queueDeleteChat({
    required ChatModel chat,
    required bool forEveryone,
  }) {
    // TODO: implement queueDeleteChat
    throw UnimplementedError();
  }
}

final chatQueueProvider = Provider<ChatQueueInterface>((ref) => ChatQueue());
