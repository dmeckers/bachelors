import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';

class FriendInviteButton extends HookConsumerWidget {
  const FriendInviteButton({super.key, required this.viewedUser});

  final FriendShipStatusModel viewedUser;

  Widget _buildAddFriendsButton(
    BuildContext context,
    WidgetRef ref,
    ValueNotifier<bool> toShow,
  ) {
    return TextButton.icon(
      onPressed: () async {
        toShow.value = false;

        await ref.read(socialRepositoryProvider).acceptFriendInvite(
              friendInviteId: viewedUser.receivedFriendRequestId!,
            );

        if (!context.mounted) return;

        JSnackBar.show(
          context,
          title: 'You and ${viewedUser.profile.username} are now friends',
        );
      },
      icon: const FaIcon(
        FontAwesomeIcons.userCheck,
        color: Colors.green,
      ),
      label: const Text(
        'Add friend',
        style: TextStyle(
          color: Colors.green,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final disableButton = useState(false);
    final toShow = useState(true);

    if (toShow.value == false) return const SizedBox();

    final widget = switch (viewedUser.status) {
      RelationshipStatus.friends => const SizedBox(),
      RelationshipStatus.friendRequestSent => _buildRequestSentButton(),
      RelationshipStatus.friendRequestReceived =>
        _buildAddFriendsButton(context, ref, toShow),
      RelationshipStatus.notFriends =>
        _buildSendRequestButton(context, ref, disableButton),
    };

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20,
      ),
      child: widget,
    );
  }

  TextButton _buildRequestSentButton() {
    return TextButton.icon(
      onPressed: () async {},
      icon: const FaIcon(
        FontAwesomeIcons.userCheck,
        color: Colors.yellow,
      ),
      label: const Text(
        'Friend request sent',
        style: TextStyle(
          color: Colors.yellow,
        ),
      ),
    );
  }

  TextButton _buildSendRequestButton(
    BuildContext context,
    WidgetRef ref,
    ValueNotifier<bool> disableButton,
  ) {
    return TextButton.icon(
      onPressed: () async {
        disableButton.value = true;

        await ref
            .read(socialRepositoryProvider)
            .sendFriendInvite(userId: viewedUser.profile.id);

        if (!context.mounted) return;

        JSnackBar.show(
          context,
          title: 'Send friend request',
        );
      },
      icon: const FaIcon(
        FontAwesomeIcons.paperPlane,
        color: Colors.green,
      ),
      label: const Text(
        'Send friend request',
        style: TextStyle(
          color: Colors.green,
        ),
      ),
    );
  }
}
