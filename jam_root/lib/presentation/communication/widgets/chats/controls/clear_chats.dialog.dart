import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jam/domain/domain.dart';
import 'package:jam/generated/l10n.dart';
import 'package:jam/presentation/presentation.dart';

class ClearChatsDialog extends HookConsumerWidget with ChattingProviders {
  const ClearChatsDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedChats = ref.watch(selectedChatsProvider);
    final clearForBoth = useState<bool?>(null);

    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      title: selectedChats.length == 1
          ? Text(S.of(context).clearChat, style: TextStyle(fontSize: 18))
          : Text(S.of(context).clearSelectedChats(selectedChats.length),
              style: TextStyle(fontSize: 18)),
      content: _buildModalContent(context, selectedChats.length, clearForBoth),
      actions: [
        _buildCancelButton(context),
        _buildConfirmButton(context, ref, selectedChats, clearForBoth),
      ],
    );
  }

  Widget _buildModalContent(BuildContext context, int selectedChatsCount,
          ValueNotifier<bool?> checkboxState) =>
      selectedChatsCount == 1
          ? Column(mainAxisSize: MainAxisSize.min, children: [
              Text(S.of(context).clearChatHistoryThisUser,
                  style: TextStyle(fontSize: 14)),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                      value: checkboxState.value ?? false,
                      onChanged: (value) =>
                          checkboxState.value = value as bool),
                   Text(S.of(context).alsoForThisUser,
                      style: TextStyle(fontSize: 14))
                ],
              ),
            ])
          : Text(S.of(context).sureYouWantClearTheseChats,
              style: TextStyle(fontSize: 14));

  TextButton _buildConfirmButton(BuildContext context, WidgetRef ref,
      List<ChatModel> selectedChats, ValueNotifier<bool?> clearForBoth) {
    return TextButton(
      onPressed: () {
        Navigator.pop(context);
        // ref.read(chatsControllerProvider).clearChatsHistory(
        //     selectedChats: selectedChats, forBoth: clearForBoth.value ?? false);
        ref.read(selectedChatsProvider.notifier).state = [];
      },
      child: Text(
        S.of(context).yes,
        style: TextStyle(color: Colors.red, fontWeight: FontWeight.w600),
      ),
    );
  }

  TextButton _buildCancelButton(BuildContext context) => TextButton(
        onPressed: () => Navigator.pop(context),
        child: Text(
          S.of(context).cancel,
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      );
}
