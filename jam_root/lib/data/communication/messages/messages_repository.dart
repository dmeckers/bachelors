import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jam/application/application.dart';
import 'package:jam/config/config.dart';
import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam_utils/jam_utils.dart';

final class MessagesRepository
    with SupabaseUserGetter, Storer
    implements MessagesRepositoryInterface {
  static const SEND_DEFAULT_TEXT_MESSAGE_RPC = 'send_default_text_message';
  static const DELETE_MESSAGE_RPC = 'delete_message';
  static const UPDATE_MESSAGE_RPC = 'update_message';
  static const FETCH_MISSING_RPC = 'fetch_missing_data';
  static const CLEAR_MESSAGES_RPC = 'clear_chat_messages';

  @override
  final ChatCacheInterface chatCache;

  @override
  final MessagesQueueInterface chatQueue;

  @override
  final MessagesRealtimeInterface messagesRealtime;

  final ProviderRef _ref;

  const MessagesRepository(
    this._ref,
    this.chatCache,
    this.chatQueue,
    this.messagesRealtime,
  );

  @override
  Future<MessageModel> sendDeafultTextMessage({
    required MessageModel message,
    required UserProfileModel receiver,
    required int chatId,
  }) async {
    if (!(await _isOnline())) {
      final messageModel = await chatQueue.queueSendText(
        chatId: chatId,
        message: message,
        receiver: receiver,
      );

      messagesRealtime.pushMessage(
        messageModel.copyWith(
          senderId: getUserIdOrThrow(),
          chatId: chatId,
          messageStatus: MessageDeliveryStatus.unread,
        ),
      );

      return messageModel;
    }

    final id = await supabase.rpc(SEND_DEFAULT_TEXT_MESSAGE_RPC, params: {
      'chat_id': chatId,
      'message_text': message.messageText!,
      'replied_to': message.repliedTo,
    });

    messagesRealtime.pushMessage(
      message.copyWith(
        id: id,
        senderId: getUserIdOrThrow(),
        chatId: chatId,
        messageStatus: MessageDeliveryStatus.unread,
      ),
    );

    return message;
  }

  @override
  Future<void> deleteMessage({
    required MessageModel message,
    required bool forEveryone,
  }) async {
    if (!(await _isOnline())) {
      return chatQueue.queueDelete(
        message: message,
        forEveryone: forEveryone,
      );
    }
    messagesRealtime.pushDeleteMessage(message);

    forEveryone
        ? await supabase.from('messages').delete().eq('id', message.id!)
        : await supabase.from('deleted_messages').insert(
            {
              'message_id': message.id!,
              'user_id': getUserIdOrThrow(),
            },
          );
  }

  @override
  Future<void> updateMessage({
    required MessageModel message,
    required UserProfileModel receiver,
  }) async {
    if (!(await _isOnline())) {
      return await chatQueue.queueUpdate(
        message: message,
        receiver: receiver,
      );
    }

    messagesRealtime.pushUpdateMessage(
      message.copyWith(editedAt: DateTime.now()),
    );

    await supabase.rpc(UPDATE_MESSAGE_RPC, params: {
      'message_id': message.id,
      'message_text': message.messageText!,
    });
  }

  @override
  Stream<Messages> getMessages$({required ChatModel chat}) async* {
    final cahced =
        localDatabase.get('chat-messages-${chat.id}') as List<dynamic>?;

    yield cahced?.cast<MessageModel>() ?? [];

    final stream = await _isOnline()
        ? messagesRealtime.get$(
            channelIdentifier: chat.id.toString(),
            data: chat,
          )
        : _ref.read(powerSyncMessageServiceProvider).messages$(chat.id);

    chatCache.cacheChatPageIndex(chatId: chat.id, pageIndex: 0);
    chatCache.cacheTotalPages(chatId: chat.id, totalPages: 0);

    yield* stream;
  }

  @override
  Future<void> pinMessage({
    required MessageModel message,
    required bool forEveryone,
  }) async {
    if (!(await _isOnline())) {
      return chatQueue.queuePin(
        message: message,
        forEveryone: forEveryone,
      );
    }

    if (forEveryone) {
      final senderName = await _getSenderName(message.senderId!);
      await supabase.from('messages').insert(
        {
          'message_text': "$senderName pinned a message",
          'chat_id': message.chatId,
          'sender_id': message.senderId,
          'message_type': MessageType.event.name,
          'sent_at': DateTime.now().toString(),
        },
      );
    }

    messagesRealtime.pushUpdateMessage(
      message.copyWith(
        pinnedState:
            forEveryone ? MessagePinState.everyone : MessagePinState.sender,
      ),
    );

    await supabase.from('messages').update(
      {'pinned_state': forEveryone ? 'everyone' : 'sender'},
    ).eq('id', message.id!);
  }

  @override
  Future<void> unpinMessage({required MessageModel message}) async {
    if (!(await _isOnline())) {
      return chatQueue.queueUnpin(message: message);
    }

    messagesRealtime.pushUpdateMessage(
      message.copyWith(
        pinnedState: MessagePinState.no_one,
      ),
    );

    await supabase
        .from('messages')
        .update({'pinned_state': 'no_one'}).eq('id', message.id!);
  }

  @override
  Future<Messages> getPinnedMessages({required ChatModel chat}) async {
    if (!await _isOnline()) {
      return _ref
          .read(powerSyncMessageServiceProvider)
          .getPinnedMessages(chat: chat);
    }

    return await supabase
        .from('messages')
        .select('* ,  message_status(message_status)')
        .eq('chat_id', chat.id)
        .neq('pinned_state', 'no_one')
        .order('sent_at', ascending: false)
        .withConverter<Messages>(
          (data) => data
              .map(
                (e) => MessageModel.fromJson(
                  e.replaceKeyValue(
                    key: 'message_status',
                    value: e['message_status'].first['message_status'],
                  ),
                ),
              )
              .toList(),
        );
  }

  @override
  Future<Messages> loadMorePinnedMessages({
    required ChatModel chat,
    required int offset,
  }) async =>
      _ref
          .read(powerSyncMessageServiceProvider)
          .getPinnedMessages(chat: chat, offset: offset);

  Future<bool> _isOnline() async {
    final connectivity = await Connectivity().checkConnectivity();

    return connectivity != ConnectivityResult.none;
  }

  Future<String> _getSenderName(String senderId) async {
    final senderName = await supabase
        .from('profiles')
        .select('full_name')
        .eq('id', senderId)
        .limit(1)
        .single();
    return senderName['full_name'];
  }

  @override
  Future<Messages> loadMoreMessages({
    required int chatId,
  }) async {
    final currentPage = chatCache.getCachedChatPageIndex(chatId);
    final totalPages = chatCache.getCachedTotalPages(chatId);
    if (currentPage > totalPages) return [];
    final offset = currentPage + 1;

    final data = await supabase.rpc('get_root_personal_chat_messages', params: {
      'chat_id': chatId,
      'user_id': getUserIdOrThrow(),
      'message_offset': offset,
    }) as Dynamics;

    final messages =
        data.map((e) => MessageModel.fromJson(e['message'])).toList();

    if (messages.isEmpty) {
      chatCache.cacheChatPageIndex(chatId: chatId, pageIndex: offset);
      chatCache.cacheTotalPages(chatId: chatId, totalPages: offset - 1);
    } else {
      chatCache.cacheChatPageIndex(chatId: chatId, pageIndex: offset);
      chatCache.cacheTotalPages(chatId: chatId, totalPages: offset);
      messagesRealtime.pushMessages(messages);
    }

    return messages;
  }

  @override
  Future<void> unpinAllMessages({required int chatId}) async {
    if (!(await _isOnline())) {
      return chatQueue.queueUnpinAll(chatId: chatId);
    }

    await supabase
        .from('messages')
        .update({'pinned_state': 'no_one'}).eq('chat_id', chatId);

    messagesRealtime.pushUnpinAllMessages();
  }

  @override
  Future<void> clearChatMessages({
    required int chatId,
    required bool forEveryone,
  }) async {
    messagesRealtime.flushMessages();

    !(await isOnline(_ref))
        ? chatQueue.queueClearChatMessages(
            chatId: chatId,
            forEveryone: forEveryone,
          )
        : await supabase.rpc(CLEAR_MESSAGES_RPC, params: {
            'chat_id': chatId,
            'for_everyone': forEveryone,
            'user_id': getUserIdOrThrow()
          });
  }
}

final messagesRepositoryProvider = Provider<MessagesRepository>(
  (ref) => MessagesRepository(
    ref,
    ref.read(chatCacheProvider),
    ref.read(messagesQueueProvider),
    ref.read(messagesRealtimeProvider),
  ),
);
