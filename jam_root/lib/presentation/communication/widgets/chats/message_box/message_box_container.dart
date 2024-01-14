import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/config/config.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_ui/jam_ui.dart';

class MessageBoxContainer extends HookConsumerWidget with ChattingProviders {
  const MessageBoxContainer({
    super.key,
    required this.messages,
    required this.chat,
    required this.message,
  });

  final Messages messages;
  final ChatModel chat;
  final MessageModel message;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final toHighlight = useState(false);

    ref.listen(highLightedMessageProvider, (_, next) {
      toHighlight.value = next == message.id;
      if (toHighlight.value) {
        Future.delayed(const Duration(seconds: 2), () {
          ref.invalidate(highLightedMessageProvider);
        });
      }
    });

    return AnimatedContainer(
      duration: toHighlight.value
          ? const Duration(milliseconds: 500)
          : const Duration(seconds: 1),
      padding: const EdgeInsets.symmetric(horizontal: 5),
      width: double.infinity,
      color: toHighlight.value
          ? context.jColor.primary.withOpacity(0.4)
          : Colors.transparent,
      child: _buildMessageBox(message),
    );
  }

  Widget _buildMessageBox(MessageModel message) {
    if (message.messageType == MessageType.event) {
      return _alignedMessage(EventMessageBox(message: message), message);
    }

    if (message.repliedTo == null) {
      return _alignedMessage(MessageBox(message: message), message);
    }

    final repliedTo = messages
        .where((element) => element.id == message.repliedTo)
        .firstOrNull;

    if (repliedTo == null) {
      return _alignedMessage(MessageBox(message: message), message);
    }

    return _alignedMessage(
      ReplyMessageBox(
        message: message,
        chat: chat,
        repliedTo: repliedTo,
        repliedIndex: messages.indexOf(repliedTo),
      ),
      message,
    );
  }

  Widget _alignedMessage(Widget child, MessageModel message) => Align(
        alignment:
            message.fromMe ? Alignment.centerRight : Alignment.centerLeft,
        child: child,
      );
}
