import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';

class SendMessageButton extends HookConsumerWidget with ChattingProviders {
  const SendMessageButton({
    super.key,
    required this.chatId,
    required this.contact,
  });

  final UserProfileModel contact;
  final int chatId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref
        .watch(currentChatStateProvider(chatId).select((value) => value.state));

    final controller = ref.read(userTextInputControllerProvider);
    final text = useState(controller.text);
    final mediaMessageMode = ref.watch(mediaMessageModeProvider);

    controller.addListener(() {
      text.value = controller.text;
    });

    return switch (state?.inputMode) {
      ChatInputMode.edit => SendEditMessageButton(
          chatId: chatId,
          receiver: contact,
        ),
      _ => _buildMessageButton(mediaMessageMode, text),
    };
  }

  _buildMessageButton(
      MediaMessageMode mediaMessageMode, ValueNotifier<String> text) {
    if (text.value.isNotEmpty) {
      return SendTextMessageButton(
        chatId: chatId,
        contact: contact,
      );
    }
    return mediaMessageMode == MediaMessageMode.audio
        ? const SendAudioMessageButton()
        : const SendVideoMessageButton();
  }
}
