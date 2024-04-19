import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jam/config/constants/constants.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/generated/l10n.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_ui/jam_ui.dart';
import 'package:jam_utils/jam_utils.dart';

class FriendInvitesPage extends HookConsumerWidget {
  const FriendInvitesPage({super.key, required this.friendInvites});

  final List<FriendInviteModel> friendInvites;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final invitesList = useState(friendInvites);

    return Scaffold(
      backgroundColor: context.jColor.primary,
      appBar: SimpleAppBar(title: S.of(context).friendInvites),
      body: Center(
        child: invitesList.value.isEmpty
            ? NotFoundPlaceholder(
                message: S.of(context).noFriendInvites,
              )
            : ListView.separated(
                separatorBuilder: (ctx, i) => JamDivider(
                      color: context.jColor.onSecondaryContainer,
                    ),
                itemBuilder: (ctx, i) => _buildInviteTile(
                      context,
                      invitesList,
                      ref,
                      i,
                    ),
                itemCount: invitesList.value.length),
      ),
    );
  }

  ListTile _buildInviteTile(
    BuildContext context,
    ValueNotifier<List<FriendInviteModel>> invitesList,
    WidgetRef ref,
    int i,
  ) {
    return ListTile(
      tileColor: context.jColor.primaryContainer,
      leading: CircleAvatar(
        backgroundImage: CachedNetworkImageProvider(
          invitesList.value[i].avatar ??
              ImagePathConstants.DEFAULT_AVATAR_IMAGE_BUCKET_URL,
        ),
        radius: 23,
      ),
      title: Text(invitesList.value[i].username),
      subtitle: Text(invitesList.value[i].sentAt.toNTimeAgo(),
          style: context.jText.headlineSmall),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
              icon: const FaIcon(
                FontAwesomeIcons.circleCheck,
                color: Colors.green,
              ),
              onPressed: () =>
                  _handleAcceptFriendInvite(context, ref, invitesList, i)),
          IconButton(
            icon: const FaIcon(
              FontAwesomeIcons.circleXmark,
              color: Colors.orangeAccent,
            ),
            onPressed: () =>
                _handleRejectFriendInvits(context, ref, invitesList, i),
          ),
        ],
      ),
    );
  }

  _handleRejectFriendInvits(
    BuildContext context,
    WidgetRef ref,
    ValueNotifier<List<FriendInviteModel>> invites,
    int index,
  ) {
    final future = ref.read(
      rejectFriendInviteProvider(
        friendInviteId: invites.value[index].id.toString(),
      ).future,
    );

    future.then((value) {
      JSnackBar.show(
        context,
        description: 'Friend invite rejected.',
        type: SnackbarInfoType.info,
      );

      _removeInvitesFromListAndInvalidateState(invites, index, ref);
    });
  }

  _handleAcceptFriendInvite(
    BuildContext context,
    WidgetRef ref,
    ValueNotifier<List<FriendInviteModel>> invites,
    int index,
  ) {
    final future = ref.read(
      acceptFriendInviteProvider(
        friendInviteId: invites.value[index].id.toString(),
      ).future,
    );

    future.then(
      (value) {
        JSnackBar.show(
          context,
          description: '${invites.value[index].username} is now your friend',
          type: SnackbarInfoType.success,
        );

        _removeInvitesFromListAndInvalidateState(invites, index, ref);
      },
    );
  }

  _removeInvitesFromListAndInvalidateState(
      ValueNotifier<List<FriendInviteModel>> invites,
      int index,
      WidgetRef ref) {
    invites.value = invites.value
        .where((element) => element.id != invites.value[index].id)
        .toList();
    ref.invalidate(getFriendInvitesProvider);
  }
}
