import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/data/data.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_ui/jam_ui.dart';

final testKey = GlobalKey<ScaffoldState>();

class ChatsPage extends HookConsumerWidget
    with ChattingProviders, ChatBuilderHelper, ProfileRepositoryProviders {
  const ChatsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedChats = ref.watch(selectedChatsProvider);
    final chatStream$ = ref.watch(chatStream);

    _initOnlineStatusObserver(ref);

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
      body: chatStream$.when(
        data: (data) => ChatList(
          chats: data,
        ),
        error: (error, _) => const JamErrorBox(
          errorMessage: 'Whoops! Something went wrong while loading the chats',
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
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
