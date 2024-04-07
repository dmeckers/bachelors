// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'package:jam/config/config.dart';
import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';

part 'chatting_providers.g.dart';

///
/// Provider for jumping to particular message in chat
///
final _itemScrollControllerProvider =
    Provider.autoDispose<ItemScrollController>((ref) => ItemScrollController());

///
/// Provider for determine wheter show FAB button that scrolls down to the bottom of chat
///
final _showFABProvider = StateProvider.autoDispose<bool>((ref) => false);

///
/// Provider to listen whether perform lazy load when reached threshold of
/// chat messages list
///
final _itemPositionsListenerProvider =
    Provider.autoDispose<ItemPositionsListener>(
        (ref) => ItemPositionsListener.create());

///
/// Provider to tracj pinned messages in order to show next to redirect
///
final _lastVisiblePinnedMessageProvider =
    StateProvider.family<MessageModel?, int>((ref, chatId) => null);

///
///Provider that holds selected messages
///that will be used for multi select actions and context operations
///
final _selectedMessagesProvider =
    StateProvider.autoDispose<List<MessageModel>>((ref) => []);

///
/// Cache to hold not sent message while editing another message
///
final _userTextInputFieldCache = StateProvider<String?>((ref) => null);

///
/// Text editing controller provider to share between different widgets
///
final _userTextInputControllerProvider =
    StateProvider.autoDispose<TextEditingController>(
        (ref) => TextEditingController());

///
/// State provider to hold selected chats for multi select actions
/// e.g. delete, archive, pin
///
final _selectedChatsProvider = StateProvider.autoDispose<Chats>((ref) => []);

///
/// Api call to send message
///
@riverpod
Future<MessageModel> _sendDeafultTextMessage(
  _SendDeafultTextMessageRef ref, {
  required MessageModel message,
  required int chatId,
  required UserProfileModel receiver,
}) {
  return ref.read(messagesRepositoryProvider).sendDeafultTextMessage(
        message: message,
        chatId: chatId,
        receiver: receiver,
      );
}

final highLightedMessageProvider = StateProvider((ref) => 0);

///
/// Api call to get stream of messages for specific chat
///
@riverpod
Stream<List<MessageModel>> _getChatMessages(
  _GetChatMessagesRef ref, {
  required ChatModel chat,
}) =>
    ref.read(messagesRepositoryProvider).getMessages$(chat: chat);

@riverpod
Future<void> _clearChatMessages(_ClearChatMessagesRef ref,
    {required int chatId, required bool forEveryone}) {
  return ref
      .read(messagesRepositoryProvider)
      .clearChatMessages(chatId: chatId, forEveryone: forEveryone);
}

@riverpod
Future<void> _deleteChatMessage(
  _DeleteChatMessageRef ref, {
  required MessageModel message,
  required bool forEveryone,
}) {
  return ref
      .read(messagesRepositoryProvider)
      .deleteMessage(message: message, forEveryone: forEveryone);
}

@riverpod
Future<void> _updateMessage(
  _UpdateMessageRef ref, {
  required MessageModel message,
  required UserProfileModel receiver,
}) {
  return ref
      .read(messagesRepositoryProvider)
      .updateMessage(message: message, receiver: receiver);
}

final _currentChatStateProvider = StateNotifierProvider.family<
    ChatStateStateNotifier,
    ({ChatState? state, int chatId}),
    int>((ref, chatId) {
  final state =
      ref.read(chatRepositoryProvider).cache.getCachedDraftMessage(chatId);

  return ChatStateStateNotifier(
    (chatId: chatId, state: state),
    chatCache: ref.watch(chatCacheProvider),
  );
});

final _archiveChatsProvider = FutureProvider<void>((ref) async {
  final selectedChats = ref.read(_selectedChatsProvider);
  await ref
      .read(chatRepositoryProvider)
      .archiveChats(selectedChats: selectedChats);
  ref.invalidate(_selectedChatsProvider);
});

// final _archiveChatProvider = FutureProvider.family<void, ChatModel>(
//   (ref, chat) async {
//     await ref.read(chatRepositoryProvider).archiveChats(selectedChats: [chat]);
//   },
// );

// final _unarchiveChatProvider = FutureProvider.family<void, ChatModel>(
//   (ref, chat) async {
//     await ref
//         .read(chatRepositoryProvider)
//         .unarchiveChats(selectedChats: [chat]);
//   },
// );

@riverpod
Future<void> _archiveChat(
  _ArchiveChatRef ref, {
  required ChatModel chat,
}) {
  return ref.read(chatRepositoryProvider).archiveChats(selectedChats: [chat]);
}

@riverpod
Future<void> _unarchiveChat(
  _UnarchiveChatRef ref, {
  required ChatModel chat,
}) {
  return ref.read(chatRepositoryProvider).unarchiveChats(selectedChats: [chat]);
}

@riverpod
Future<void> _pinChat(
  _PinChatRef ref, {
  required ChatModel chat,
}) {
  return ref.read(chatRepositoryProvider).pinChats(selectedChats: [chat]);
}

@riverpod
Future<void> _pinChats(
  _PinChatsRef ref, {
  required Chats chats,
}) {
  return ref.read(chatRepositoryProvider).pinChats(selectedChats: chats);
}

@riverpod
Future<void> _unpinChat(
  _UnpinChatRef ref, {
  required ChatModel chat,
}) {
  return ref.read(chatRepositoryProvider).unpinChats(selectedChats: [chat]);
}

@riverpod
Future<void> _unpinChats(
  _UnpinChatsRef ref, {
  required Chats chats,
}) {
  return ref.read(chatRepositoryProvider).unpinChats(selectedChats: chats);
}

@riverpod
Future<Messages> _getPinnedMessages(
  _GetPinnedMessagesRef ref, {
  required ChatModel chat,
}) {
  return ref.read(messagesRepositoryProvider).getPinnedMessages(chat: chat);
}

@riverpod
Future<List<MessageModel>> _loadMorePinnedMessages(
  _LoadMorePinnedMessagesRef ref, {
  required ChatModel chat,
  required int offset,
}) {
  return ref
      .read(messagesRepositoryProvider)
      .loadMorePinnedMessages(chat: chat, offset: offset);
}

final _highlightProvider = StateProvider.family.autoDispose<bool, int>(
  (ref, id) => false,
);

mixin class ChattingProviders {
  AutoDisposeStateProviderFamily<bool, int> get highlightProvider =>
      _highlightProvider;

  _GetPinnedMessagesFamily get getPinnedMessagesProvider =>
      _getPinnedMessagesProvider;

  _LoadMorePinnedMessagesFamily get loadMorePinnedMessagesProvider =>
      _loadMorePinnedMessagesProvider;

  StateProviderFamily<MessageModel?, int>
      get lastVisiblePinnedMessageProvider => _lastVisiblePinnedMessageProvider;

  _PinChatFamily get pinChatProvider => _pinChatProvider;

  _PinChatsFamily get pinChatsProvider => _pinChatsProvider;

  _UnpinChatFamily get unpinChatProvider => _unpinChatProvider;

  _UnpinChatsFamily get unpinChatsProvider => _unpinChatsProvider;

  _UnarchiveChatFamily get unarchiveChatProvider => _unarchiveChatProvider;

  _ArchiveChatFamily get archiveChatProvider => _archiveChatProvider;

  FutureProvider<void> get archiveChatsProvider => _archiveChatsProvider;

  AutoDisposeStateProvider<bool> get showFABProvider => _showFABProvider;

  // AutoDisposeProvider<ItemScrollController> get itemScrollControllerProvider =>
  //     _itemScrollControllerProvider;

  // AutoDisposeProvider<ItemPositionsListener>
  //     get itemPositionsListenerProvider => _itemPositionsListenerProvider;

  AutoDisposeStateProvider<List<MessageModel>> get selectedMessagesProvider =>
      _selectedMessagesProvider;

  StateProvider<String?> get userTextInputFieldCache =>
      _userTextInputFieldCache;

  AutoDisposeStateProvider<TextEditingController>
      get userTextInputControllerProvider => _userTextInputControllerProvider;

  AutoDisposeStateProvider<Chats> get selectedChatsProvider =>
      _selectedChatsProvider;

  _SendDeafultTextMessageFamily get sendDeafultTextMessageProvider =>
      _sendDeafultTextMessageProvider;

  _GetChatMessagesFamily get getChatMessagesProvider =>
      _getChatMessagesProvider;

  _ClearChatMessagesFamily get clearChatMessagesProvider =>
      _clearChatMessagesProvider;

  _DeleteChatMessageFamily get deleteChatMessageProvider =>
      _deleteChatMessageProvider;

  AutoDisposeFutureProvider<void> updateMessageProivder({
    required MessageModel message,
    required UserProfileModel receiver,
  }) =>
      _updateMessageProvider(message: message, receiver: receiver);

  StateNotifierProviderFamily<
      ChatStateStateNotifier,
      ({ChatState? state, int chatId}),
      int> get currentChatStateProvider => _currentChatStateProvider;
}

final chattingProvidersProvider =
    Provider<ChattingProviders>((ref) => ChattingProviders());
