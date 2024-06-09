import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';

enum ChatsPopupMenuActions { friendInvites }

class ChatsPopupMenu extends HookConsumerWidget with ChattingProviders {
  const ChatsPopupMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref.listen(getFriendInvitesProvider, (_, __) {});

    useEffect(() {
      final listener = ref.listenManual(getFriendInvitesProvider, (_, __) {});

      return () => listener.close();
    }, []);

    return PopupMenuButton<ChatsPopupMenuActions>(
      offset: const Offset(20, 40),
      itemBuilder: (context) => [
        PopupMenuItem(
          onTap: () => _navigateToFriendListPage(context),
          child: const Row(
            children: [
              FaIcon(FontAwesomeIcons.addressBook),
              SizedBox(width: 10),
              Text('Friends'),
            ],
          ),
        ),
        ref.watch(getFriendInvitesProvider).maybeWhen(
              data: (friendInvites) => PopupMenuItem<ChatsPopupMenuActions>(
                padding: EdgeInsets.zero,
                value: ChatsPopupMenuActions.friendInvites,
                child: friendInvites.isEmpty
                    ? _buildFriendInvitesPopupButton(context, friendInvites)
                    : Badge(
                        label: Text(
                          friendInvites.length.toString(),
                        ),
                        alignment: Alignment.topLeft,
                        offset: const Offset(0, 0),
                        child: _buildFriendInvitesPopupButton(
                            context, friendInvites),
                      ),
              ),
              orElse: () => _buildFriendInvitesPopupButton(context, []),
            ),
      ],
    );
  }

  PopupMenuItem<ChatsPopupMenuActions> _buildFriendInvitesPopupButton(
      BuildContext context, List<FriendInviteModel> invites) {
    return PopupMenuItem<ChatsPopupMenuActions>(
      padding: const EdgeInsets.only(left: 10),
      value: ChatsPopupMenuActions.friendInvites,
      onTap: () => _navigateToFriendRequest(context, invites),
      child: const Row(
        children: [
          FaIcon(FontAwesomeIcons.handshake),
          SizedBox(width: 10),
          Text('Friend requests'),
        ],
      ),
    );
  }

  _navigateToFriendRequest(
    BuildContext context,
    List<FriendInviteModel> friendInvites,
  ) {
    context.pushNamed(ChatRoutes.friendInvites.name, extra: friendInvites);
  }

  _navigateToFriendListPage(BuildContext context) {
    context.pushNamed(ChatRoutes.friendList.name);
  }
}
