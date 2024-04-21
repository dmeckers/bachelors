import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jam/data/data.dart';
import 'package:jam/generated/l10n.dart';
import 'package:jam/globals.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_ui/jam_ui.dart';

class ChatsPage extends HookConsumerWidget
    with ChattingProviders, ChatBuilderHelper, ProfileRepositoryProviders {
  const ChatsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedChats = ref.watch(selectedChatsProvider);
    final c$ = ref.watch(chatsState$);

    // useEffect(() {
    //   final chatsListener = ref.listenManual(chatsState$, (previous, next) {});

    //   return () {
    //     debugPrint('statement');
    //     chatsListener.close();
    //   };
    // }, []);

    _initOnlineStatusObserver(ref);

    return Scaffold(
      backgroundColor: context.jTheme.primaryColor,
      key: MAIN_PAGE_KEY,
      appBar: AppBar(
        actions: selectedChats.isNotEmpty
            ? buildContextActionButtons(context, selectedChats, ref)
            : [
                const ChatsPopupMenu(),
              ],
      ),
      drawer: const MenuDrawer(),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(300),
        ),
        onPressed: () => context.pushNamed(ChatRoutes.friendList.name),
        child: const FaIcon(FontAwesomeIcons.message),
      ),
      body: c$.maybeWhen(
        data: (chats) {
          if (chats.isEmpty) {
            return Center(
              child: NotFoundPlaceholder(message: S.of(context).noChatsFound),
            );
          }

          final archivedChats =
              chats.where((element) => element.isArchived).toList();

          return SingleChildScrollView(
            child: Column(
              children: [
                if (archivedChats.isNotEmpty) ArchivedChatsTile(chats: chats),
                for (final chat in chats)
                  if (chat.isArchived == false) ChatTile(chatModel: chat),
              ],
            ),
          );
        },
        orElse: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }

  void _initOnlineStatusObserver(WidgetRef ref) => useEffect(
        () {
          WidgetsBinding.instance.addObserver(
            ref.watch(onlineStatusObserverProvider),
          );

          return null;
        },
        const [],
      );
}
