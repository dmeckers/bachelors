import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/generated/l10n.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import 'package:jam/config/config.dart';
import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_ui/jam_ui.dart';
import 'package:jam_utils/jam_utils.dart';

class ReplyMessageRefTile extends ConsumerWidget with ChattingProviders {
  const ReplyMessageRefTile({
    super.key,
    required this.message,
    required this.repliedMessage,
    required this.repliedIndex,
    required this.chat,
  });

  final MessageModel message;
  final MessageModel repliedMessage;
  final int repliedIndex;
  final ChatModel chat;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = ref.watch(autoScrollCtrlProvider);
    //this is so bad
    final repliedToName = repliedMessage.senderName ??
        (repliedMessage.senderId == chat.relatedContact.id
            ? chat.relatedContact.fullName
            : localDatabase
                .get(HiveConstants.LOCAL_DB_USER_PROFILE_KEY)
                .fullName);

    return Container(
      constraints: const BoxConstraints(maxHeight: 45),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 4),
      decoration: BoxDecoration(
        color: context.jTheme.primaryColor,
        borderRadius: BorderRadius.circular(6),
        border: Border(
          left: BorderSide(
            color: message.fromMe
                ? context.jTheme.scaffoldBackgroundColor
                : context.jTheme.indicatorColor,
            width: 3,
          ),
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: context.jTheme.splashColor,
          onTap: () => _handleNavigateToMessage(
            scrollController,
            repliedIndex,
            ref,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    S.of(context).replyToRepliedtoname(repliedToName),
                    style: context.jText.bodySmall?.copyWith(fontSize: 12),
                  ),
                ),
              ),
              const SizedBox(height: 2),
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Text(
                  message.messageType == MessageType.text
                      ? repliedMessage.messageText!.crop(35)
                      : S.of(context).media,
                  style: context.jText.bodySmall?.copyWith(fontSize: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _handleNavigateToMessage(
    AutoScrollController scrollController,
    int repliedIndex,
    WidgetRef ref,
  ) {
    scrollController.scrollToIndex(
      repliedIndex,
      duration: const Duration(microseconds: 100),
    );

    if (repliedMessage.id == null) return;

    ref.read(highLightedMessageProvider.notifier).state = repliedMessage.id!;
  }
}
