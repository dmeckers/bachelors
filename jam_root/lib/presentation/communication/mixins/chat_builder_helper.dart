import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_utils/jam_utils.dart';

mixin ChatBuilderHelper {
  List<Widget> buildContextActionButtons(
      BuildContext context, List<ChatModel> selectedChats, WidgetRef ref) {
    return [
      selectedChats.any((element) => element.isPinned == false)
          ? IconButton(
              onPressed: () {
                final providers = ref.read(chattingProvidersProvider);
                ref
                    .read(chatsStateProvider)
                    .pinChats(selectedChats: selectedChats);

                ref.read(providers.selectedChatsProvider.notifier).state = [];
              },
              icon: const Icon(Icons.push_pin))
          : IconButton(
              onPressed: () {
                final providers = ref.read(chattingProvidersProvider);
                // ref.read(providers.unpinChatsProvider(chats: selectedChats));
                ref
                    .read(chatsStateProvider)
                    .unpinChats(selectedChats: selectedChats);

                ref.read(providers.selectedChatsProvider.notifier).state = [];
              },
              icon: const Icon(Icons.free_cancellation_outlined),
            ),
      // selectedChats.any((element) => element.isMuted)
      //     ? IconButton(
      //         onPressed: () {
      //           ref.read(chatsControllerProvider).muteChats(selectedChats: selectedChats);
      //           ref.read(selectedChatsProvider.notifier).state = [];
      //           // ref.read(chatsControllerProvider)
      //         },
      //         icon: const Icon(Icons.volume_up))
      //     : IconButton(
      //         onPressed: () {
      //           ref.read(chatsControllerProvider).unmuteChats(selectedChats: selectedChats);
      //           ref.read(selectedChatsProvider.notifier).state = [];
      //         },
      // icon: const Icon(Icons.volume_off)),
      IconButton(
          onPressed: () {
            // ref.read(chatsControllerProvider).muteChats(selectedChats: selectedChats);
            // ref.read(selectedChatsProvider.notifier).state = [];
            showUnimplementedSnackbar(context);
            // ref.read(chatsControllerProvider)
          },
          icon: const Icon(Icons.volume_up)),
      IconButton(
          onPressed: () => _deleteChatsDialogBuilder(context),
          icon: const Icon(Icons.delete)),
    ];
  }

  Future<void> _deleteChatsDialogBuilder(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) => const DeleteChatsDialog(),
    );
  }
}
