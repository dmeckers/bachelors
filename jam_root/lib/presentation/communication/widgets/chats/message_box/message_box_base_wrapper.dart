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
    return Dismissible(
      key: super.key ?? UniqueKey(),
      direction: DismissDirection.endToStart,
      resizeDuration: const Duration(seconds: 0),
      background: _buildDismissibleBackground(context),
      movementDuration: const Duration(milliseconds: 0),
      dismissThresholds: const {
        DismissDirection.endToStart: 0.3,
      },
      child: _buildWrapper(context),
      confirmDismiss: (direction) async {
        ref
            .read(currentChatStateProvider(message.chatId!).notifier)
            .updateChatInputMode(ChatInputMode.reply, message);

        return false;
      },
    );
  }

  Widget _buildDismissibleBackground(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CircleAvatar(
            backgroundColor: context.jColor.primary,
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

  _buildWrapper(BuildContext context) {
    return Container(
      constraints: _constraints(context, message),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: message.fromMe ? Colors.blueGrey : Colors.green.shade900,
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(16),
          topRight: const Radius.circular(16),
          bottomLeft: message.fromMe ? const Radius.circular(16) : Radius.zero,
          bottomRight:
              !message.fromMe ? const Radius.circular(16) : Radius.zero,
        ),
      ),
      child: child,
    );
  }

  _constraints(BuildContext context, MessageModel message) =>
      switch (message.messageType) {
        MessageType.text => BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.65,
            minWidth: 10,
            maxHeight: 500,
            minHeight: 30,
          ),
        MessageType.audio_message => BoxConstraints(
            minWidth: MediaQuery.of(context).size.width * 0.65,
            maxHeight: 70,
          ),
        _ => BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.65,
            maxHeight: 500,
          ),
      };
}
