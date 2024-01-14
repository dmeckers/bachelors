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
        currentChatStateProvider(chatId).select((value) => value.state?.model));

    return GestureDetector(
      onTap: () => _handleSubmitEditMessage(ref, model),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        child: Icon(Icons.edit_square),
      ),
    );
  }

  _handleSubmitEditMessage(WidgetRef ref, MessageModel? model) {
    if (ref.read(userTextInputControllerProvider.notifier).state.text.isEmpty) {
      HapticFeedback.vibrate();
      return;
    }
    if (model == null) return;

    ref.read(
      updateMessageProivder(
        message: model.copyWith(
          messageText:
              ref.read(userTextInputControllerProvider.notifier).state.text,
        ),
        receiver: receiver,
      ),
    );

    ref.invalidate(currentChatStateProvider(chatId));
    ref.invalidate(userTextInputControllerProvider);
  }
}
