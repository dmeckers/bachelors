import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';

class SendEditMessageButton extends ConsumerWidget with ChattingProviders {
  const SendEditMessageButton({
    super.key,
    required this.chatId,
    required this.receiver,
  });

  final UserProfileModel receiver;
  final int chatId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(
      currentChatStateProvider(chatId).select((value) => value.state?.model),
    );

    return GestureDetector(
      onTap: () => model != null
          ? ref.read(sendEdittedTextMessageProvider(chatId, receiver, model))
          : HapticFeedback.vibrate(),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        child: Icon(Icons.edit_square),
      ),
    );
  }
}
