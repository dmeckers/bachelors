import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/config/config.dart';

import 'package:jam/data/data.dart';
import 'package:jam/domain/communication/chats/chat.model.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_ui/jam_ui.dart';

final testKey = GlobalKey<ScaffoldState>();

class ChatsPage extends HookConsumerWidget
    with ChattingProviders, ChatBuilderHelper, ProfileRepositoryProviders {
  const ChatsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedChats = ref.watch(selectedChatsProvider);
    final c$ = ref.watch(chatsState$);

    useEffect(() {
      final chatsListener = ref.listenManual(chatsState$, (previous, next) {});

      return () => chatsListener.close();
    }, []);

    _initOnlineStatusObserver(ref);

    final usermeta = supaAuth.currentUser!.userMetadata;

    debugPrint(usermeta.toString());

    return Scaffold(
      backgroundColor: context.jTheme.primaryColor,
      key: testKey,
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
            return const Center(
              child: NotFoundPlaceholder(message: 'No chats found'),
            );
          }

          final archivedChats =
              chats.where((element) => element.isArchived).toList();
          final sortedChats = chats.toList()..sort(compareChats);

          return SingleChildScrollView(
            child: Column(
              children: [
                if (archivedChats.isNotEmpty) ArchivedChatsTile(chats: chats),
                for (final chat in sortedChats)
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

  int compareChats(ChatModel a, ChatModel b) {
    if (a.isPinned == b.isPinned) {
      if (a.lastMessage != null && b.lastMessage != null) {
        return b.lastMessage!.sentAt.compareTo(a.lastMessage!.sentAt);
      } else if (a.lastMessage != null) {
        return -1;
      } else if (b.lastMessage != null) {
        return 1;
      } else {
        return 0;
      }
    } else {
      return a.isPinned ? -1 : 1;
    }
  }
}
