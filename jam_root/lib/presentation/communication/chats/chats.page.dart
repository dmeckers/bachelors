import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/config/config.dart';

import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/globals.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_ui/jam_ui.dart';
import 'package:jam_utils/jam_utils.dart';
import 'package:share_plus/share_plus.dart';
import 'package:showcaseview/showcaseview.dart';

final _showcaseKey1 = GlobalKey();
final _showcaseKey2 = GlobalKey();

class ShowcasedAppBar extends ConsumerWidget
    with ChattingProviders, ChatBuilderHelper, ProfileRepositoryProviders
    implements PreferredSizeWidget {
  const ShowcasedAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedChats = ref.watch(selectedChatsProvider);
    return Showcase(
      key: _showcaseKey1,
      title: 'Welcome user to the prototype presentation!',
      titleAlignment: TextAlign.center,
      descriptionAlignment: TextAlign.center,
      titleTextStyle: TextStyle(
        color: context.jTheme.primaryColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      descTextStyle: TextStyle(
        color: context.jTheme.primaryColor,
        fontSize: 16,
      ),
      blurValue: 5,
      descriptionPadding: const EdgeInsets.only(left: 25),
      description: 'Access settings and map from menu drawer',
      // tooltipPosition: TooltipPosition.bottom,
      child: AppBar(
        actions: selectedChats.isNotEmpty
            ? buildContextActionButtons(context, selectedChats, ref)
            : [
                const ChatsPopupMenu(),
              ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(DEFAULT_APP_BAR_HEIGHT);
}

class ChatsPage extends HookConsumerWidget
    with
        ChattingProviders,
        ChatBuilderHelper,
        ProfileRepositoryProviders,
        Storer {
  const ChatsPage({super.key});

  _showCaseIfWasnYet(BuildContext context) {
    useEffect(() {
      final user = hiveGet<UserProfileModel>();

      if (user.isNull || user!.isShowcased) return;

      WidgetsBinding.instance.addPostFrameCallback((_) {
        ShowCaseWidget.of(context).startShowCase([
          _showcaseKey1,
          _showcaseKey2,
        ]);
      });

      return null;
    }, []);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final c$ = ref.watch(chatsState$);

    _initOnlineStatusObserver(ref);
    _showCaseIfWasnYet(context);

    return Scaffold(
      backgroundColor: context.jTheme.primaryColor,
      key: MAIN_PAGE_KEY,
      appBar: const ShowcasedAppBar(),
      drawer: const MenuDrawer(),
      floatingActionButton: Showcase(
        key: _showcaseKey2,
        blurValue: 5,
        description: 'Here you access your friend list',
        child: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(300),
          ),
          onPressed: () => context.pushNamed(ChatRoutes.friendList.name),
          child: const FaIcon(FontAwesomeIcons.message),
        ),
      ),
      body: c$.maybeWhen(
        data: (chats) {
          if (chats.isEmpty) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Center(
                  child: NotFoundPlaceholder(message: 'No chats found!'),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    Share.share('Check out this cool app: https://example.com');
                  },
                  child: const Text('Invite friends to app \u{1F4E4}'),
                ),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () => context.pushNamed(MapRoutes.map.name),
                    child: const Text('Go to map \u{1F5FA}'),
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () async => await supaAuth.signOut(),
                    child: const Text('logoit'),
                  ),
                )
              ],
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
