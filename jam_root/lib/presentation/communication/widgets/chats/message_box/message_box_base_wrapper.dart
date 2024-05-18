import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_ui/jam_ui.dart';

class MessageBoxBaseWrapper extends ConsumerWidget with ChattingProviders {
  const MessageBoxBaseWrapper({
    super.key,
    required this.child,
    required this.message,
  });

  final Widget child;
  final MessageModel message;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final primaryColor = context.jColor.primary;

    return Dismissible(
      key: super.key ?? ValueKey(message.id),
      direction: DismissDirection.endToStart,
      resizeDuration: const Duration(seconds: 0),
      background: _buildDismissibleBackground(context, primaryColor),
      movementDuration: const Duration(milliseconds: 0),
      dismissThresholds: const {
        DismissDirection.endToStart: 0.3,
      },
      child: MessageBoxBase(
        message: message,
        child: child,
      ),
      confirmDismiss: (direction) async {
        ref
            .read(currentChatStateProvider(message.chatId!).notifier)
            .updateChatInputMode(ChatInputMode.reply, message);

        return false;
      },
    );
  }

  Widget _buildDismissibleBackground(BuildContext context, Color primaryColor) {
    return SizedBox(
      width: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CircleAvatar(
            backgroundColor: primaryColor,
            child: const Icon(
              Icons.reply,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
