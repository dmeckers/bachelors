import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/data/data.dart';

import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';

class SendTextMessageButton extends ConsumerWidget with ChattingProviders {
  const SendTextMessageButton({
    super.key,
    required this.chatId,
    required this.contact,
  });

  final int chatId;
  final UserProfileModel contact;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () async => await _handleSendMessage(ref),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
        child: Icon(Icons.send),
      ),
    );
  }

  _handleSendMessage(WidgetRef ref) async {
    final message = __getMessageFromInputBar(ref);
    await ref.read(messagesRepositoryProvider).sendDeafultTextMessage(
          message: message,
          receiver: contact,
          chatId: chatId,
        );
  }

  MessageModel __getMessageFromInputBar(WidgetRef ref) {
    final inputNotifier = ref.read(userTextInputControllerProvider.notifier);
    final replyToMessage = ref.read(
      currentChatStateProvider(chatId).select(
        (value) => value.state?.model,
      ),
    );
    // Clear the input field
    final newMessageText = inputNotifier.state.text;
    inputNotifier.state.clear();
    ref.read(currentChatStateProvider(chatId).notifier).clear();

    return MessageModel(
      messageType: MessageType.text,
      messageText: newMessageText,
      sentAt: DateTime.now(),
      repliedTo: replyToMessage?.id,
      repliedToDate: replyToMessage?.sentAt,
      fromMe: true,
    );
  }
}
