import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_ui/jam_ui.dart';

class MessageBox extends ConsumerWidget with ChattingProviders {
  const MessageBox({super.key, required this.message});

  final MessageModel message;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final selectedMessages = ref.watch(selectedMessagesProvider);

    return MessageBoxActionButtonsWrapper(
      message: message,
      child: ActionlessMessageBox(
        message: message,
      ),
    );
  }
}

class ActionlessMessageBox extends ConsumerWidget with ChattingProviders {
  const ActionlessMessageBox({super.key, required this.message});

  final MessageModel message;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MessageBoxBaseWrapper(
      message: message,
      child: IntrinsicWidth(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              message.messageText ?? '',
              style: context.jText.bodySmall,
            ),
            const SizedBox(height: 6),
            MessageBoxMetaInfo(message: message)
          ],
        ),
      ),
    );
  }
}
