import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jam/domain/domain.dart';
import 'package:jam/generated/l10n.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_ui/jam_ui.dart';

class DeleteMessageDialog extends HookConsumerWidget with ChattingProviders {
  const DeleteMessageDialog({super.key, this.message});

  final MessageModel? message;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedMessages = ref.watch(selectedMessagesProvider);
    final deleteForBoth = useState<bool>(false);

    return AlertDialog(
      actionsPadding: const EdgeInsets.only(top: 0, bottom: 16, right: 8),
      insetPadding: EdgeInsets.zero,
      contentPadding:
          const EdgeInsets.only(left: 24, right: 24, bottom: 0, top: 16),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      title: selectedMessages.length < 2
          ? Text(S.of(context).deleteMessage, style: TextStyle(fontSize: 18))
          : Text('Delete ${selectedMessages.length} messages',
              style: const TextStyle(fontSize: 18)),
      content:
          _buildModalContent(context, selectedMessages.length, deleteForBoth),
      actions: [
        TextButton(
          onPressed: () => context.pop(),
          child: Text(S.of(context).cancel,
              style: TextStyle(fontWeight: FontWeight.w600)),
        ),
        TextButton(
            onPressed: () {
              selectedMessages.isEmpty
                  ? _deleteMessage(ref, deleteForBoth.value)
                  : _deleteMessages(ref, selectedMessages, deleteForBoth.value);
              context.pop();
            },
            child: Text(
              S.of(context).delete,
              style: context.jText.bodySmall?.copyWith(color: Colors.red),
            ))
      ],
    );
  }

  _deleteMessage(WidgetRef ref, bool forBoth) {
    ref.read(
        deleteChatMessageProvider(message: message!, forEveryone: forBoth));
    // ref.read(messagesControllerProvider).deleteMessages(messages: messages, forBoth: forBoth);
    ref.read(selectedMessagesProvider.notifier).state = [];
  }

  _deleteMessages(WidgetRef ref, List<MessageModel> messages, bool forBoth) {
    // ref.read(messagesControllerProvider).deleteMessages(messages: messages, forBoth: forBoth);
    ref.read(selectedMessagesProvider.notifier).state = [];
  }

  Widget _buildModalContent(BuildContext context, int selectedMessageCount,
          ValueNotifier<bool?> checkboxState) =>
      ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 100),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          selectedMessageCount == 1
              ? const Text('Are you sure you want to delete this message?',
                  style: TextStyle(fontSize: 14))
              : const Text('Are you sure you want to delete theese messages?',
                  style: TextStyle(fontSize: 14)),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Checkbox(
                  value: checkboxState.value,
                  onChanged: (value) => checkboxState.value = value as bool),
              const Text('Delete for everyone', style: TextStyle(fontSize: 14))
            ],
          ),
        ]),
      );
}
