import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
        onTap: () => _handleSubmitTextMessage(context, ref),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
          child: Icon(Icons.send),
        ));
  }

  _handleSubmitTextMessage(BuildContext context, WidgetRef ref) async {
    {
      final replyToMessage = ref.watch(
        currentChatStateProvider(chatId).select((value) => value.state?.model),
      );

      final newMessageText =
          ref.read(userTextInputControllerProvider.notifier).state.text;

      final message = MessageModel(
        messageType: MessageType.text,
        messageText: newMessageText,
        sentAt: DateTime.now(),
        repliedTo: replyToMessage?.id,
        repliedToDate: replyToMessage?.sentAt,
        fromMe: true,
      );

      ref.read(userTextInputControllerProvider.notifier).state.clear();
      ref.read(currentChatStateProvider(chatId).notifier).clear();

      ref.read(
        sendDeafultTextMessageProvider(
          message: message,
          chatId: chatId,
          receiver: contact,
        ),
      );
    }
  }
}
