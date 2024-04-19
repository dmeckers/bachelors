import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jam/config/config.dart';
import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/generated/l10n.dart';
import 'package:jam/presentation/presentation.dart';

class ChatList extends ConsumerWidget with ChattingProviders {
  const ChatList({
    super.key,
    required this.chats,
  });

  final Chats chats;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chats$ = ref.watch(chatStream);

    return chats$.maybeWhen(
      orElse: () => const SizedBox(),
      data: (chats) {
        final archivedChats =
            chats.where((element) => element.isArchived).toList();
        final sortedChats = chats.toList()..sort(compareChats);

        return chats.isNotEmpty
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    if (archivedChats.isNotEmpty)
                      ArchivedChatsTile(chats: chats),
                    for (final chat in sortedChats)
                      if (chat.isArchived == false) ChatTile(chatModel: chat),
                  ],
                ),
              )
            : SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Center(
                  child: Text(S.of(context).noChatsFound),
                ),
              );
      },
    );
  }

  int compareChats(ChatModel a, ChatModel b) {
    if (a.isPinned == b.isPinned) {
      if (a.lastMessage != null && b.lastMessage != null) {
        return b.lastMessage!.sentAt.compareTo(a.lastMessage!.sentAt);
      } else if (a.lastMessage != null) {
        return -1;
      } else if (b.lastMessage != null) {
        return 1;
      } else {
        return 0;
      }
    } else {
      return a.isPinned ? -1 : 1;
    }
  }
}
