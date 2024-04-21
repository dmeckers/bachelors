import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/data/data.dart';

import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';

class ClearChatsDialog extends HookConsumerWidget with ChattingProviders {
  const ClearChatsDialog({super.key, this.chat, this.onClose});

  final ChatModel? chat;
  final void Function()? onClose;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedChats = ref.watch(selectedChatsProvider);
    final clearForBoth = useState<bool?>(null);
    final isSingleChat = selectedChats.length == 1 || chat != null;

    final titleText =
        isSingleChat ? 'Clear chat' : 'Clear ${selectedChats.length} chats';

    final contentText = isSingleChat
        ? 'Are you sure you want to clear this chat'
        : 'Are you sure you want to clear selected chats';

    final checkboxText = isSingleChat
        ? 'Also clear for other user'
        : 'Also clear for other users';

    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      title: Text(titleText, style: const TextStyle(fontSize: 18)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(contentText, style: const TextStyle(fontSize: 14)),
          CheckboxListTile(
            contentPadding: EdgeInsets.zero,
            controlAffinity: ListTileControlAffinity.leading,
            value: clearForBoth.value ?? false,
            onChanged: (v) => clearForBoth.value = v,
            title: Text(checkboxText, style: const TextStyle(fontSize: 14)),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text(
            'Cancel',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        TextButton(
          onPressed: () => _handleClearChats(
            context,
            ref: ref,
            forEveryone: clearForBoth.value ?? false,
          ),
          child: const Text(
            'Yes',
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }

  _handleClearChats(
    BuildContext context, {
    required WidgetRef ref,
    required bool forEveryone,
  }) async {
    Navigator.of(context).pop();
    // since i have removed clear chat from main page it is only possible to clear one chat at a time
    // but i will keep the multiple chat clear for future use
    if (chat == null) return;
    await ref
        .read(messagesRepositoryProvider)
        .clearChatMessages(chatId: chat!.id, forEveryone: forEveryone);

    ref.read(selectedChatsProvider.notifier).state = [];

    onClose?.call();
  }
}
