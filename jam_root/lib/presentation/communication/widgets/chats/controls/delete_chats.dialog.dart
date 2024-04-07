import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';

class DeleteChatsDialog extends HookConsumerWidget with ChattingProviders {
  const DeleteChatsDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedChats = ref.watch(selectedChatsProvider);
    final deleteForBoth = useState<bool?>(null);

    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      title: selectedChats.length == 1
          ? const Text('Delete chat', style: TextStyle(fontSize: 18))
          : Text('Delete ${selectedChats.length} chats',
              style: const TextStyle(fontSize: 18)),
      content: _buildModalContent(context, selectedChats.length, deleteForBoth),
      actions: [
        _buildCancelDeleteChatButton(context),
        _buildConfirmDeleteChatButton(
            context, ref, selectedChats, deleteForBoth),
      ],
    );
  }

  Widget _buildModalContent(BuildContext context, int selectedChatsCount,
          ValueNotifier<bool?> checkboxState) =>
      selectedChatsCount == 1
          ? Column(mainAxisSize: MainAxisSize.min, children: [
              const Text('Are you sure you want to delete this chat',
                  style: TextStyle(fontSize: 14)),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                      value: checkboxState.value ?? false,
                      onChanged: (value) =>
                          checkboxState.value = value as bool),
                  const Text('Also delete for this user',
                      style: TextStyle(fontSize: 14))
                ],
              ),
            ])
          : const Text('Are you sure you want to delete selected chats',
              style: TextStyle(fontSize: 14));

  TextButton _buildCancelDeleteChatButton(BuildContext context) => TextButton(
        onPressed: () => Navigator.pop(context),
        child:
            const Text('Cancel', style: TextStyle(fontWeight: FontWeight.w600)),
      );

  TextButton _buildConfirmDeleteChatButton(BuildContext context, WidgetRef ref,
          List<ChatModel> selectedChats, ValueNotifier<bool?> checkboxState) =>
      TextButton(
        onPressed: () {
          Navigator.pop(context);
          // ref
          //     .read(chatsControllerProvider)
          //     .deleteChats(selectedChats: selectedChats, deleteForBoth: checkboxState.value ?? false);
          ref.read(selectedChatsProvider.notifier).state = [];
        },
        child: const Text('Yes',
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.w600)),
      );
}
