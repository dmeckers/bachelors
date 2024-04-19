import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jam/domain/domain.dart';
import 'package:jam/generated/l10n.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_ui/jam_ui.dart';
import 'package:jam_utils/jam_utils.dart';

class ChatExtraInputModeBar extends HookConsumerWidget with ChattingProviders {
  const ChatExtraInputModeBar({super.key, required this.chatId});

  final int chatId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(
      currentChatStateProvider(chatId).select((value) => value.state),
    );
    final textInputCache = ref.watch(userTextInputFieldCache);

    if (state?.model == null) return const SizedBox();

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      height: 50,
      decoration: BoxDecoration(color: context.jColor.onSecondary),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Icon(state!.inputMode == ChatInputMode.reply
                ? Icons.reply
                : Icons.edit),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  state.inputMode == ChatInputMode.reply
                      ? "Reply to ${state.model?.senderName}"
                      : S.of(context).editing,
                  style: context.jText.headlineSmall,
                ),
                const SizedBox(height: 3),
                Text(
                  state.model?.isTextMessage ?? false
                      ? (state.model?.messageText as String).crop(50)
                      : S.of(context).media,
                  style: context.jText.bodySmall?.copyWith(fontSize: 10),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: IconButton(
              onPressed: () {
                ref
                    .read(currentChatStateProvider(chatId).notifier)
                    .setStandartInputMode();
                textInputCache;
                ref.read(userTextInputControllerProvider.notifier).state.text =
                    textInputCache ?? '';
              },
              icon: const Icon(
                Icons.clear,
                size: 15,
              ),
            ),
          )
        ],
      ),
    );
  }
}
