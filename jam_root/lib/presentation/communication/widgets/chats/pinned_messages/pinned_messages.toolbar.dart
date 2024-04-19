import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/generated/l10n.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import 'package:jam/config/config.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_ui/jam_ui.dart';
import 'package:jam_utils/jam_utils.dart';

class PinnedMessagesTopBar extends HookConsumerWidget with ChattingProviders {
  const PinnedMessagesTopBar({
    super.key,
    required this.messages,
    required this.chat,
  });

  final Messages messages;
  final ChatModel chat;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lastVisiblePinnedMessage =
        ref.watch(lastVisiblePinnedMessageProvider(chat.id));
    final pinnedMessages =
        messages.where((element) => element.isPinned).toList();
    final itemScrollController = ref.watch(autoScrollCtrlProvider);

    final pinnedMessageIndexNumber = pinnedMessages
            .contains(lastVisiblePinnedMessage ?? pinnedMessages.first)
        ? pinnedMessages
            .indexOf(lastVisiblePinnedMessage ?? pinnedMessages.first)
        : pinnedMessages.indexOf(pinnedMessages.last);

    final pinnedMessageContent =
        pinnedMessages[pinnedMessageIndexNumber].messageType == MessageType.text
            ? pinnedMessages[pinnedMessageIndexNumber].messageText?.crop(50)
            : S.of(context).media;

    return Container(
      height: 65,
      width: double.infinity,
      decoration: BoxDecoration(
        color: context.jTheme.cardColor,
        border: Border(
          top: BorderSide(color: context.jTheme.dividerColor, width: 0.3),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _buildLeadingIcon(),
          _buildPinnedMessageBarPanel(
            context,
            pinnedMessages,
            pinnedMessageIndexNumber,
            pinnedMessageContent ?? '',
            itemScrollController,
            ref,
          ),
          _buildLinkToPinnedMessagesList(context)
        ],
      ),
    );
  }

  Widget _buildLinkToPinnedMessagesList(BuildContext context) => IconButton(
        padding: const EdgeInsets.all(0),
        onPressed: () => context.pushNamed(
          ChatRoutes.pinnedMessages.name,
          pathParameters: {
            "${ChatRoutes.chat.pathParameter}": "${chat.id}",
          },
          extra: chat,
        ),
        icon: const Icon(Icons.publish_sharp),
      );

  Padding _buildLeadingIcon() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Transform.rotate(
          angle: 0.8,
          child: const Icon(Icons.push_pin, size: 16),
        ),
      );

  Expanded _buildPinnedMessageBarPanel(
    BuildContext context,
    List<MessageModel> pinnedMessages,
    int pinnedMessageIndexNumber,
    String pinnedMessageContent,
    AutoScrollController itemScrollController,
    WidgetRef ref,
  ) {
    return Expanded(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: context.jTheme.splashColor,
          onTap: () {
            itemScrollController.scrollToIndex(
              messages.indexOf(pinnedMessages[pinnedMessageIndexNumber]),
              duration: const Duration(microseconds: 100),
            );

            ref.read(highLightedMessageProvider.notifier).state =
                pinnedMessages[pinnedMessageIndexNumber].id!;
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 24.0, bottom: 2),
                child: Text(
                  'Pinned message #${pinnedMessageIndexNumber + 1}',
                  style: context.jText.headlineSmall,
                ),
              ),
              Text(
                pinnedMessageContent,
                style: context.jText.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
