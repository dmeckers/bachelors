import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

import 'package:jam/application/application.dart';
import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';

class MessagesQueue with SupabaseUserGetter implements MessagesQueueInterface {
  @override
  Future queueDelete({
    required MessageModel message,
    required bool forEveryone,
  }) async {
    const DELETE_MESSAGE_FOR_EVERYONE_SQL = """
    DELETE FROM messages WHERE id = ?
  """;

    const DELETE_MESSAGE_FOR_ME_SQL = """
    INSERT INTO deleted_messages (id , message_id , user_id) VALUES (? , ? , ?)
  """;
    forEveryone
        ? await PowerSync.db.execute(
            DELETE_MESSAGE_FOR_EVERYONE_SQL,
            [
              message.id.toString(),
            ],
          )
        : await PowerSync.db.execute(
            DELETE_MESSAGE_FOR_ME_SQL,
            [
              const Uuid().v4(),
              message.id.toString(),
              getUserIdOrThrow(),
            ],
          );
  }

  @override
  Future<MessageModel> queueSendText({
    required int chatId,
    required MessageModel message,
    required UserProfileModel receiver,
  }) async {
    const INSERT_MESSAGE_SQL = """
    INSERT INTO
      messages
      (id , chat_id, sender_id, message_text, sent_at, message_type , replied_to , pinned_state )
    VALUES
      (?, ?, ?, ?, ?, ?, ?, ?, ?)
    """;

    final params = [
      const Uuid().v1(),
      chatId,
      getUserIdOrThrow(),
      message.messageText,
      DateTime.now().toString(),
      MessageType.text.name,
      message.repliedTo ?? message.repliedToDate?.millisecondsSinceEpoch,
      message.pinnedState.name,
    ];

    await PowerSync.db.execute(INSERT_MESSAGE_SQL, params);

    return message.copyWith(
      id: message.sentAt.millisecondsSinceEpoch,
      senderId: getUserIdOrThrow(),
      chatId: chatId,
      messageStatus: MessageDeliveryStatus.sending,
    );
  }

  @override
  Future<void> queueUpdate({
    required MessageModel message,
    required UserProfileModel receiver,
  }) async {
    const UPDATE_MESSAGE_SQL = """
      UPDATE messages SET message_text = ? , edited_at = ? WHERE id = ?
    """;

    await PowerSync.db.execute(
      UPDATE_MESSAGE_SQL,
      [
        message.messageText,
        DateTime.now().toString(),
        message.id!.toString(),
      ],
    );
  }

  @override
  Future queuePin({
    required MessageModel message,
    required bool forEveryone,
  }) async {
    const UPDATE_MESSAGE_SQL = """
      UPDATE messages SET pinned_state = ? WHERE id = ?
    """;

    const INSERT_PIN_EVENT_MESSAGE_SQL = """
      INSERT INTO messages (id , chat_id, sender_id, message_text, message_type, sent_at) VALUES (?, ?, ?, ?, ?, ?)
    """;

    await PowerSync.db.execute(
      UPDATE_MESSAGE_SQL,
      [
        forEveryone
            ? MessagePinState.everyone.name
            : MessagePinState.sender.name,
        message.id?.toString() ?? message.sentAt.millisecondsSinceEpoch,
      ],
    );

    if (!forEveryone) return;

    final eventMessageParams = [
      const Uuid().v4(),
      message.chatId,
      getUserIdOrThrow(),
      message.senderName?.isNotEmpty ?? false
          ? 'You pinned a message'
          : 'Message pinned',
      MessageType.event.name,
      DateTime.now().toString(),
    ];

    await PowerSync.db.execute(
      INSERT_PIN_EVENT_MESSAGE_SQL,
      eventMessageParams,
    );
  }

  @override
  Future queueUnpin({required MessageModel message}) async {
    const UNPIN_MESSAGE_SQL = """
      UPDATE messages SET pinned_state = ? WHERE id = ?
    """;

    await PowerSync.db.execute(
      UNPIN_MESSAGE_SQL,
      [
        MessagePinState.no_one.name,
        message.id?.toString() ?? message.sentAt.millisecondsSinceEpoch,
      ],
    );
  }

  @override
  Future queueUnpinAll({required int chatId}) {
    const UNPIN_ALL_MESSAGES_SQL = """
      UPDATE messages SET pinned_state = ? WHERE chat_id = ?
    """;

    return PowerSync.db.execute(
      UNPIN_ALL_MESSAGES_SQL,
      [
        MessagePinState.no_one.name,
        chatId,
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
}

final messagesQueueProvider = Provider<MessagesQueue>(
  (ref) => MessagesQueue(),
);
