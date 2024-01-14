import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_ui/jam_ui.dart';

class ReplyMessageBox extends ConsumerWidget with ChattingProviders {
  const ReplyMessageBox({
    super.key,
    required this.message,
    required this.repliedTo,
    required this.repliedIndex,
    required this.chat,
  });

  final ChatModel chat;
  final MessageModel message;
  final MessageModel repliedTo;
  final int repliedIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedMessages = ref.watch(selectedMessagesProvider);

    return _buildContainer(context, selectedMessages, ref);
  }

  MessageBoxBaseWrapper _buildContainer(
    BuildContext context,
    List<MessageModel> selectedMessages,
    WidgetRef ref,
  ) {
    return MessageBoxBaseWrapper(
      message: message,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            fit: FlexFit.loose,
            child: ReplyMessageRefTile(
              message: message,
              repliedMessage: repliedTo,
              repliedIndex: repliedIndex,
              chat: chat,
            ),
          ),
          Flexible(
            child: MessageBoxActionButtonsWrapper(
              message: message,
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: SizedBox(
                  width: double.infinity,
                  child: Text(
                    message.messageText ?? '',
                    style: context.jText.bodySmall,
                  ),
                ),
              ),
            ),
            // child: buildActionButtonGestureDetector(
            //   context: context,
            //   ref: ref,
            //   message: message,

            //   ),
            // ),
          ),
          const SizedBox(height: 6),
          MessageBoxMetaInfo(message: message),
        ],
      ),
    );
  }
}
