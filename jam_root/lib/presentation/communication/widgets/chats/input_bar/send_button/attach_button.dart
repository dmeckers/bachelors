import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jam/presentation/presentation.dart';

class ChatMessageInputBarAttachButton extends ConsumerWidget
    with ChattingProviders {
  const ChatMessageInputBarAttachButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messageTextFieldController =
        ref.watch(userTextInputControllerProvider);

    return Visibility(
        visible: messageTextFieldController.text.isEmpty,
        child: GestureDetector(
            onTap: () => debugPrint('Attach file'),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
              child: Icon(Icons.attach_file),
            )));
  }
}
