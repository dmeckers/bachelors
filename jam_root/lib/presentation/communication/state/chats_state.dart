import 'dart:async';

import 'package:flutter/widgets.dart';

import 'package:jam/application/application.dart';
import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';

import 'package:jam/config/config.dart';

class ChatsState extends WidgetsBindingObserver with Storer {
  final _state = BehaviorSubject<Chats>.seeded([]);
  final ProviderRef _ref;

  ChatsState(this._ref);

  Stream<Chats> chats$() async* {
    _ref.read(chatRealtimeServiceProvider).get$().listen(
      (chats) {
        _state.add(chats);
      },
    );

    yield* _state.stream.doOnData(
      (chats) {
        final mapped = chats
            .map(
              (e) => e.copyWith(
                chatEventType: ChatEventType.stopTyping,
                relatedContact: e.relatedContact.copyWith(
                  isOnline: false,
                ),
              ),
            )
            .toList();

        localDatabase.put(
          HiveConstants.LOCAL_DB_CHAT_KEY,
          mapped,
        );
      },
    );
  }

  unpinChats({required Chats selectedChats}) {
    final updatedState = _state.value.replaceIntersected(
      toReplaceWith: selectedChats,
      tap: (c) => c.copyWith(isPinned: false),
    );

    _state.value = updatedState;

    _ref.read(chatRepositoryProvider).unpinChats(selectedChats: selectedChats);
  }

  pinChats({required Chats selectedChats}) {
    final updatedState = _state.value.replaceIntersected(
      toReplaceWith: selectedChats,
      tap: (c) => c.copyWith(isPinned: true),
    );

    _state.value = updatedState;

    _ref.read(chatRepositoryProvider).pinChats(selectedChats: selectedChats);
  }

  archiveChats({required Chats selectedChats}) {
    final updatedState = _state.value.replaceIntersected(
      toReplaceWith: selectedChats,
      tap: (c) => c.copyWith(isArchived: true),
    );
    _state.value = updatedState;

    _ref
        .read(chatRepositoryProvider)
        .archiveChats(selectedChats: selectedChats);
  }

  unarchiveChats({required Chats selectedChats}) {
    final updatedState = _state.value.replaceIntersected(
      toReplaceWith: selectedChats,
      tap: (c) => c.copyWith(isArchived: false),
    );

    _state.value = updatedState;

    _ref
        .read(chatRepositoryProvider)
        .unarchiveChats(selectedChats: selectedChats);
  }

  deleteChats({required Chats selectedChats, bool forBoth = false}) {
    _state.value = _state.value.excludeById(selectedChats);

    _ref.read(chatRepositoryProvider).deleteChats(
          selectedChats: selectedChats,
          forBoth: forBoth,
        );
  }
}

final chatsStateProvider = Provider<ChatsState>(
  (ref) => ChatsState(ref),
);

final chatsState$ = StreamProvider.autoDispose<Chats>(
  (ref) => ref.watch(chatsStateProvider).chats$(),
);
