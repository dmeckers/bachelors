import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jam/config/config.dart';
import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_ui/jam_ui.dart';
import 'package:jam_utils/jam_utils.dart';

enum PersonalChatAppBarPopupMenuActions {
  mute,
  search,
  clearHistory,
  deleteChat,
  changeBackground,
}

class ChatAppBar extends ConsumerWidget
    with ChattingProviders
    implements PreferredSizeWidget {
  const ChatAppBar({
    required this.chat,
    super.key,
  });

  final ChatModel chat;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(chatEvents$(chat.id)).maybeWhen(
          data: (event) => _buildBar(
            context,
            chat.copyWith(chatEventType: event),
            ref,
          ),
          orElse: () => _buildBar(context, chat, ref),
        );
  }

  ChatBarBase _buildBar(
    BuildContext context,
    ChatModel chat,
    WidgetRef ref,
  ) {
    return ChatBarBase(
      avatar: HeroAvatar(
        isPersonal: false,
        profile: chat.relatedContact,
        navigateOnTap: true,
      ),
      onTap: () => context.pushNamed(
        WatchOtherUsersRoutes.otherUserProfilePage.name,
        pathParameters: {
          WatchOtherUsersRoutes.otherUserProfilePage.pathParameter!:
              chat.relatedContact.id,
        },
      ),
      bodyWidgets: [
        Text(
          chat.relatedContact.username ?? 'User',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        _buildChatSubtitle(context, chat),
      ],
      popupMenu: ChatPopupMenu(chat: chat),
    );
  }

  Widget _buildChatSubtitle(BuildContext context, ChatModel chat) {
    final isOnline = chat.relatedContact.isOnlineAndActive;
    final subtitleText = isOnline
        ? 'Online'
        : 'Last seen ${chat.relatedContact.lastActiveAt.toNTimeAgo}';
    final isTyping = chat.chatEventType == ChatEventType.typing;

    return isTyping
        ? Text('Typing...', style: context.jText.headlineSmall)
        : Text(subtitleText, style: context.jText.headlineSmall);
  }

  @override
  Size get preferredSize => const Size.fromHeight(DEFAULT_APP_BAR_HEIGHT);
}
