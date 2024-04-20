import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/config/config.dart';

import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';

class DeleteChatsDialog extends HookConsumerWidget with ChattingProviders {
  const DeleteChatsDialog({super.key, this.chat, this.onClose});

  final ChatModel? chat;
  final void Function()? onClose;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedChats = ref.watch(selectedChatsProvider);
    final deleteForBoth = useState<bool?>(null);
    final isSingleChat = selectedChats.length == 1 || chat != null;

    final titleText =
        isSingleChat ? 'Delete chat' : 'Delete ${selectedChats.length} chats';

    final contentText = isSingleChat
        ? 'Are you sure you want to delete this chat'
        : 'Are you sure you want to delete selected chats';

    final checkboxText = isSingleChat
        ? 'Also delete for other user'
        : 'Also delete for other users';

    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      title: Text(titleText, style: const TextStyle(fontSize: 18)),
      content: Column(
        children: [
          Text(contentText, style: const TextStyle(fontSize: 14)),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Checkbox(
                value: deleteForBoth.value ?? false,
                onChanged: (v) => deleteForBoth.value = v,
              ),
              Text(checkboxText, style: const TextStyle(fontSize: 14)),
            ],
          )
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () => _handleDeleteChats(
            context,
            ref: ref,
            selectedChats: selectedChats,
            forBoth: deleteForBoth.value ?? false,
          ),
          child: const Text(
            'Yes',
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }

  _handleDeleteChats(
    BuildContext context, {
    required WidgetRef ref,
    required Chats selectedChats,
    required bool forBoth,
  }) async {
    Navigator.pop(context);
    final chatsToDelete =
        chat != null ? [...selectedChats, chat!] : selectedChats;

    await ref.read(chatsStateProvider).deleteChats(
          selectedChats: chatsToDelete,
          forBoth: forBoth,
        );

    ref.read(selectedChatsProvider.notifier).state = [];

    onClose?.call();
  }
}
