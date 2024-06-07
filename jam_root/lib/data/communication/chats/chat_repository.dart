import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam_utils/jam_utils.dart';

import 'package:jam/application/application.dart';
import 'package:jam/config/config.dart';
import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';

final class ChatRepository
    with SupabaseUserGetter
    implements ChatRepositoryInterface {
  const ChatRepository(
    this._ref,
    this.queue,
    this.cache,
  );

  static const GET_CHATS_RPC = 'get_root_personal_chats_with_meta';
  static const GET_CHAT_RPC = 'get_one_root_chat';

  final ProviderRef _ref;

  @override
  final ChatCacheInterface cache;

  @override
  final ChatQueueInterface queue;

  @override
  Future<void> archiveChats({required Chats selectedChats}) async {
    return !(await isOnline(_ref))
        ? queue.queueArchiveChats(
            selectedChats: selectedChats,
          )
        : await supabase
            .from('users_chats')
            .update({'is_archived': true})
            .inFilter('chat_id', selectedChats.map((e) => e.id).toList())
            .eq('user_id', getUserIdOrThrow());
  }

  @override
  Future<void> pinChats({required Chats selectedChats}) async {
    return !(await isOnline(_ref))
        ? queue.queuePinChats(
            selectedChats: selectedChats,
          )
        : await supabase
            .from('users_chats')
            .update({'is_pinned': true})
            .inFilter('chat_id', selectedChats.map((e) => e.id).toList())
            .eq('user_id', getUserIdOrThrow());
  }

  @override
  Future<void> unarchiveChats({required Chats selectedChats}) async {
    return !(await isOnline(_ref))
        ? queue.queueUnarchiveChats(
            selectedChats: selectedChats,
          )
        : await supabase
            .from('users_chats')
            .update({'is_archived': false})
            .inFilter('chat_id', selectedChats.map((e) => e.id).toList())
            .eq('user_id', getUserIdOrThrow());
  }

  @override
  Future<void> unpinChats({required Chats selectedChats}) async {
    return !(await isOnline(_ref))
        ? queue.queueUnpinChats(
            selectedChats: selectedChats,
          )
        : await supabase
            .from('users_chats')
            .update({'is_pinned': false})
            .inFilter('chat_id', selectedChats.map((e) => e.id).toList())
            .eq('user_id', getUserIdOrThrow());
  }

  @override
  Future<Chats> getChats() async {
    final data = await supabase.rpc(
      GET_CHATS_RPC,
      params: {'user_id': getUserIdOrThrow()},
    ) as Dynamics;

    return data.map((e) => ChatModel.fromJson(e)).toList();
  }

  @override
  Future<ChatModel> getChatById({required int chatId}) async {
    final response = await supabase.rpc(GET_CHAT_RPC, params: {
      'user_id': getUserIdOrThrow(),
      'chat_id': chatId,
    }) as Dynamics;

    return ChatModel.fromJson(response.first);
  }

  @override
  Future<void> deleteChats({
    required Chats selectedChats,
    bool forBoth = false,
  }) async {
    await supabase.rpc('delete_chats', params: {
      'user_id': getUserIdOrThrow(),
      'chat_ids': selectedChats.map((e) => e.id).toList(),
      'for_everyone': forBoth,
    });
  }
}

final chatRepositoryProvider = Provider<ChatRepositoryInterface>(
  (ref) => ChatRepository(
    ref,
    ref.read(chatQueueProvider),
    ref.read(chatCacheProvider),
  ),
);
