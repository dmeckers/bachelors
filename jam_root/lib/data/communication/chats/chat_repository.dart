import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam_utils/jam_utils.dart';
import 'package:rxdart/rxdart.dart';

import 'package:jam/application/application.dart';
import 'package:jam/config/config.dart';
import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';

final class ChatRepository
    with SupabaseUserGetter
    implements ChatRepositoryInterface {
  static const CLEAR_MESSAGES_RPC = 'clear_chat_messages';

  ChatRepository(
    this._ref,
    this.queue,
    this.cache,
    this.realtime,
    this.events,
  );

  final ProviderRef _ref;

  @override
  final ChatCacheInterface cache;

  @override
  final ChatQueueInterface queue;

  @override
  final ChatRealtimeInterface realtime;

  @override
  final EventServiceInterface<List<ChatEvent>, ChatEvent> events;

  @override
  Future<void> clearChatMessages({
    required int chatId,
    required bool forEveryone,
  }) async {
    return !(await isOnline(_ref))
        ? queue.queueClearChatMessages(
            chatId: chatId,
            forEveryone: forEveryone,
          )
        : await supabase.rpc(CLEAR_MESSAGES_RPC, params: {
            'chat_id': chatId,
            'for_everyone': forEveryone,
            'user_id': getUserIdOrThrow()
          });
  }

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
  Stream<Chats> getChats$() async* {
    final chats$ = !(await isOnline(_ref))
        ? _ref.read(powersyncChatsService).chats$().asBroadcastStream()
        : realtime.get$(data: await _fetchChats());

    final eventsSubject = BehaviorSubject<List<ChatEvent>>.seeded([]);

    chats$.take(1).listen(
      (chats) {
        eventsSubject
            .addStream(_ref.read(chatsEventsProvider).getEvents$(data: chats));
      },
    );

    yield* Rx.combineLatest2<List<ChatModel>, List<ChatEvent>, Chats>(
      chats$,
      eventsSubject.stream,
      (chats, events) => chats
          .map(
            (e) => e.copyWith(
              chatEventType: events
                  .where((element) => element.chatId == e.id)
                  .firstOrNull
                  ?.toChatEventType(),
            ),
          )
          .toList(),
    ).asBroadcastStream();
  }

  Future<Chats> _fetchChats() async {
    final data = await supabase.rpc(
      'get_root_personal_chats_with_meta',
      params: {
        'user_id': getUserIdOrThrow(),
      },
    ) as Dynamics;

    return data
        .map(
          (e) => ChatModel.fromJson(
            (e as Json).replaceWithNullIfEmpty(key: 'last_message'),
          ),
        )
        .toList();
  }
}

final chatRepositoryProvider = Provider<ChatRepositoryInterface>(
  (ref) => ChatRepository(
    ref,
    ref.read(chatQueueProvider),
    ref.read(chatCacheProvider),
    ref.read(chatRealtimeServiceProvider),
    ref.read(chatsEventsProvider),
  ),
);

final chatStream = StreamProvider.autoDispose(
  (ref) => ref.read(chatRepositoryProvider).getChats$(),
);
