import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/config/config.dart';

import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_ui/jam_ui.dart';
import 'package:jam_utils/jam_utils.dart';

class FriendInvitesPage extends HookConsumerWidget {
  const FriendInvitesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final friendInvites$ = ref.watch(getFriendInvitesProvider);

    return Scaffold(
      backgroundColor: context.jColor.primary,
      appBar: const SimpleAppBar(title: 'Friend Invites'),
      body: Center(
        child: friendInvites$.when(
          data: (invites) => invites.isEmpty
              ? const NotFoundPlaceholder(
                  message: 'No friend invites',
                )
              : ListView.separated(
                  separatorBuilder: (ctx, i) => JamDivider(
                    color: context.jColor.onSecondaryContainer,
                  ),
                  itemBuilder: (ctx, i) => _buildInviteTile(
                    context,
                    ref,
                    invites[i],
                  ),
                  itemCount: invites.length,
                ),
          error: (e, s) => const JamErrorBox(
            errorMessage:
                'Whoops! Something went wrong while fetching friend invites.\n Please try again later.',
          ),
          loading: () => const SizedBox(),
        ),
      ),
    );
  }

  ListTile _buildInviteTile(
    BuildContext context,
    WidgetRef ref,
    FriendInviteModel invite,
  ) {
    return ListTile(
      tileColor: context.jColor.primaryContainer,
      leading: CircleAvatar(
        backgroundImage: CachedNetworkImageProvider(
          invite.avatar ?? ImagePathConstants.DEFAULT_AVATAR_IMAGE_BUCKET_URL,
        ),
        radius: 23,
      ),
      title: Text(invite.username),
      subtitle:
          Text(invite.sentAt.toNTimeAgo, style: context.jText.headlineSmall),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const FaIcon(
              FontAwesomeIcons.circleCheck,
              color: Colors.green,
            ),
            onPressed: () => _handleAcceptFriendInvite(context, ref, invite),
          ),
          IconButton(
            icon: const FaIcon(
              FontAwesomeIcons.circleXmark,
              color: Colors.orangeAccent,
            ),
            onPressed: () => _handleRejectFriendInvits(
              context,
              ref,
              invite,
            ),
          ),
        ],
      ),
    );
  }

  _handleRejectFriendInvits(
    BuildContext context,
    WidgetRef ref,
    FriendInviteModel invite,
  ) async {
    await ref
        .read(socialRepositoryProvider)
        .rejectFriendInvite(friendInviteId: invite.id);

    context.doIfMounted(
      () => JSnackBar.show(
        context,
        description: 'Friend invite rejected.',
        type: SnackbarInfoType.info,
      ),
    );
  }

  _handleAcceptFriendInvite(
    BuildContext context,
    WidgetRef ref,
    FriendInviteModel invite,
  ) async {
    await ref
        .read(socialRepositoryProvider)
        .acceptFriendInvite(friendInviteId: invite.id);

    final chatId = await supabase.rpc(
      'get_chat_with_user',
      params: {
        'user_id': invite.userReceived,
        'current_user_id': supaAuth.currentUser!.id,
      },
    );

    final chatRealtime = ref.read(chatRealtimeServiceProvider);
    await chatRealtime.pushChatAndSubscribe(chatId);
    chatRealtime.fireEvent(TrackChatEvent(chatId, invite.userReceived));

    context.doIfMounted(
      () => JSnackBar.show(
        context,
        description: '${invite.username} is now your friend',
        type: SnackbarInfoType.success,
      ),
    );
  }
}
