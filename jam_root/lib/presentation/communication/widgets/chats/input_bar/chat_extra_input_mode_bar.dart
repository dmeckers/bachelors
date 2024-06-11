import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/data/data.dart';

import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_ui/jam_ui.dart';
import 'package:jam_utils/jam_utils.dart';

class ChatExtraInputModeBar extends HookConsumerWidget
    with ChattingProviders, Storer {
  const ChatExtraInputModeBar({
    super.key,
    required this.chatId,
    required this.chatModel,
  });

  final int chatId;
  final ChatModel chatModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(
      currentChatStateProvider(chatId).select((value) => value.state),
    );

    final textInputCache = ref.watch(userTextInputFieldCache);

    if (state?.model.isNull ?? true) return const SizedBox();

// TODO
    final widgetAttributes = state!.inputMode!.getWidgetAttrivutes;
    final user = hiveGet<UserProfileModel>();
    final replyTo = state.model?.senderId == user?.id
        ? user?.fullName
        : chatModel.relatedContact.fullName;

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
            child: Icon(widgetAttributes.icon, size: 15),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widgetAttributes.title(replyTo),
                  style: context.jText.headlineSmall,
                ),
                const SizedBox(height: 3),
                Text(
                  state.model?.isTextMessage ?? false
                      ? (state.model?.messageText as String).crop(50)
                      : 'Media',
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
