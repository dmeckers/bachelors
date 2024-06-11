import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_utils/jam_utils.dart';

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

        context.doIfMounted(
          () => JSnackBar.show(
            context,
            JSnackbarData(
              title: 'You and ${viewedUser.profile.username} are now friends',
            ),
          ),
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
    final toShow = useState(true);
    final initialStatus = useState(viewedUser.status);

    if (toShow.value == false) return const SizedBox();

    final widget = switch (initialStatus.value) {
      RelationshipStatus.friends => const SizedBox(),
      RelationshipStatus.friendRequestSent => _buildRequestSentButton(),
      RelationshipStatus.friendRequestReceived =>
        _buildAddFriendsButton(context, ref, toShow),
      RelationshipStatus.notFriends => _buildSendRequestButton(
          context,
          ref,
          initialStatus,
        ),
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

  TextButton _buildSendRequestButton(BuildContext context, WidgetRef ref,
      ValueNotifier<RelationshipStatus> initialStatus) {
    return TextButton.icon(
      onPressed: () async {
        initialStatus.value = RelationshipStatus.friendRequestSent;

        await ref
            .read(socialRepositoryProvider)
            .sendFriendInvite(userId: viewedUser.profile.id);

        context.doIfMounted(
          () => JSnackBar.show(
            context,
            const JSnackbarData(
              description: 'Friend request sent!',
            ),
          ),
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
