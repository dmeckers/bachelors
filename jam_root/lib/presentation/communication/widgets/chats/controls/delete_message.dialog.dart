import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/config/config.dart';

import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_ui/jam_ui.dart';

class DeleteMessageDialog extends HookConsumerWidget with ChattingProviders {
  const DeleteMessageDialog({super.key, this.message});

  final MessageModel? message;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedMessages = ref.watch(selectedMessagesProvider);
    final deleteForBoth = useState<bool>(false);
    final toDeleteMultiple = selectedMessages.length > 1;

    final titleText = toDeleteMultiple
        ? 'Delete ${selectedMessages.length} messages'
        : 'Delete message';

    final contentText = toDeleteMultiple
        ? 'Are you sure you want to delete these messages?'
        : 'Are you sure you want to delete this message?';

    return AlertDialog(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      title: Text(titleText, style: const TextStyle(fontSize: 18)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(contentText, style: const TextStyle(fontSize: 14)),
          CheckboxListTile(
            contentPadding: EdgeInsets.zero,
            controlAffinity: ListTileControlAffinity.leading,
            value: deleteForBoth.value,
            onChanged: (v) => deleteForBoth.value = v ?? false,
            title: const Text(
              'Delete for everyone',
              style: TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => context.pop(),
          child: const Text(
            'Cancel',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        TextButton(
          onPressed: () async => await _deleteMessages(
            context,
            ref,
            selectedMessages,
            deleteForBoth.value,
          ),
          child: Text(
            'Delete',
            style: context.jText.bodySmall?.copyWith(color: Colors.red),
          ),
        )
      ],
    );
  }

  _deleteMessages(
    BuildContext context,
    WidgetRef ref,
    Messages messages,
    bool forBoth,
  ) {
    // TODO when messages can be multiply selected handle delete list of messages
    ref.read(
      deleteChatMessageProvider(message: message!, forEveryone: forBoth),
    );

    ref.read(selectedMessagesProvider.notifier).state = [];
    context.pop();
  }
}
