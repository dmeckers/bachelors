import 'package:go_router/go_router.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';

enum ChatRoutes {
  friendInvites(null),
  friendList(null),
  chat('chatId'),
  archivedChats(null),
  pinnedMessages('chatId');

  final String? pathParameter;

  const ChatRoutes(this.pathParameter);
}

enum VibeRoutes {
  editMyVibes,
}

final chatsRoutes = [
  GoRoute(
    path: ChatRoutes.friendInvites.name,
    name: ChatRoutes.friendInvites.name,
    builder: (_, state) => FriendInvitesPage(
      friendInvites: (state.extra as List<FriendInviteModel>),
    ),
  ),
  GoRoute(
    path: VibeRoutes.editMyVibes.name,
    name: VibeRoutes.editMyVibes.name,
    builder: (context, state) => EditUserVibes(
      vibes: state.extra as List<VibeModel>?,
    ),
  ),
  GoRoute(
    path: ChatRoutes.friendList.name,
    name: ChatRoutes.friendList.name,
    builder: (_, __) => const FriendListPage(),
  ),
  GoRoute(
    path: ChatRoutes.archivedChats.name,
    name: ChatRoutes.archivedChats.name,
    builder: (_, __) => const ArchivedChatsPage(),
  ),
  GoRoute(
    path: ':${ChatRoutes.chat.pathParameter}',
    name: ChatRoutes.chat.name,
    builder: (_, state) => FriendRootChatPage(
      chat: state.extra as ChatModel,
    ),
    routes: [
      GoRoute(
        path: ChatRoutes.pinnedMessages.name,
        name: ChatRoutes.pinnedMessages.name,
        builder: (_, state) => PinnedMessagesPage(
          chat: state.extra as ChatModel,
        ),
      ),
    ],
  ),
];
