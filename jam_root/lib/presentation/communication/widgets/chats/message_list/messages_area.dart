import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/config/config.dart';
import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_utils/jam_utils.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ChatMessagesList extends HookConsumerWidget
    with
        ChatBuilderHelper,
        ChatScrollHelper,
        ChattingProviders,
        ProfileRepositoryProviders {
  const ChatMessagesList({
    super.key,
    required this.messages,
    required this.chat,
  });

  final Messages messages;
  final ChatModel chat;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(currentUserProfileProvider);
    final hasPinnedMessages = messages.any((element) => element.isPinned);
    final handler = getMessageObserverHandler(ref, messages, chat.id);

    return currentUser.maybeWhen(
      data: (user) => _buildMessageList(
        user,
        hasPinnedMessages,
        handler,
      ),
      orElse: () => const SizedBox(),
    );
  }

  Consumer _buildMessageList(
    UserProfileModel currentUser,
    bool hasPinnedMessages,
    MessageVibilityHandler handler,
  ) {
    return Consumer(
      builder: (context, ref, child) {
        return Flexible(
          flex: 12,
          fit: FlexFit.tight,
          child: ScrollablePositionedList.separated(
            reverse: true,
            itemScrollController: ref.watch(itemScrollControllerProvider),
            itemPositionsListener: ref.watch(itemPositionsListenerProvider),
            separatorBuilder: (context, index) => buildMessagesDivider(
              messages,
              index,
            ),
            itemBuilder: (ctx, i) => VisibilityDetector(
              key: Key(messages[i].id.toString()),
              child: MessageBoxContainer(
                messages: messages,
                message: messages[i],
                chat: chat,
              ),
              onVisibilityChanged: (info) => handler(info, i),
            ),
            itemCount: messages.length,
          ),
        );
      },
    );
  }

  buildMessagesDivider(Messages messages, int index) =>
      index < messages.length - 1 &&
              messages[index].sentAt.isOtherDay(messages[index + 1].sentAt)
          ? ChatMessagesDateSeparator(message: messages[index])
          : const SizedBox(height: 0);
}
