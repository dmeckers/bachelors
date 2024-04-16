import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/application/application.dart';

import 'package:jam/config/config.dart';
import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_ui/jam_ui.dart';
import 'package:jam_utils/jam_utils.dart';

class SendFriendInviteDialog extends HookConsumerWidget
    with ProfileRepositoryProviders {
  const SendFriendInviteDialog({
    super.key,
    required this.userId,
    required this.onInviteSent,
  });

  final String userId;
  final void Function() onInviteSent;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userProfile = ref.watch(currentUserProfileProvider);
    final otherUserData = ref.watch(
      checkRelationShipStatusProvider(userId: userId),
    );

    final sendingIvnite = useState(false);

    return BottomSheetLayout(
      paddingTop: 20,
      size: BottomSheetSize.medium,
      children: [
        const SizedBox(height: 10),
        [userProfile, otherUserData].when(
          data: (data) {
            final dataList = data.toList();
            final currentUserProfileData = dataList.first as UserProfileModel;
            final otherUser = dataList.last as UserWithRelationshipStatus;

            return Column(
              children: [
                CircleAvatar(
                  radius: 27,
                  backgroundImage: CachedNetworkImageProvider(
                    otherUser.user.avatar ??
                        ImagePathConstants.DEFAULT_AVATAR_IMAGE_BUCKET_URL,
                  ),
                ),
                Text(
                  otherUser.user.username ?? 'User',
                  style: context.jText.headlineMedium,
                ),
                Text(
                  otherUser.user.profileStatus ?? '',
                  style: context.jText.headlineSmall,
                ),
                _buildBody(
                  currentUserProfileData,
                  otherUser,
                  context,
                  ref,
                  sendingIvnite,
                ),
              ],
            );
          },
          error: (e, _) => const JamErrorBox(
            errorMessage: 'Whoops! Could not send friend invite',
            compact: true,
          ),
          loading: () => const CircularProgressIndicator(),
        )
      ],
    );
  }

  Widget _buildBody(
      UserProfileModel currentUserProfileData,
      UserWithRelationshipStatus otherUser,
      BuildContext context,
      WidgetRef ref,
      ValueNotifier<bool> sendingIvnite) {
    return Column(
      children: [
        otherUser.status == RelationshipStatus.notFriends
            ? SizedBox(
                height: 100,
                child: Text(
                  'Vibes in common: ${currentUserProfileData.vibes.intersection(otherUser.user.vibes).map((e) => e.name).join(', ')}',
                  style: context.jText.bodySmall,
                ),
              )
            : const SizedBox(),
        _buildButton(
          currentUserProfileData,
          otherUser,
          context,
          ref,
          sendingIvnite,
        )
      ],
    );
  }

  ButtonWithLoader _buildButton(
    UserProfileModel profileData,
    UserWithRelationshipStatus otherUser,
    BuildContext context,
    WidgetRef ref,
    ValueNotifier<bool> sendingIvnite,
  ) {
    return ButtonWithLoader(
      onPressed: () => _handleSendInvite(
        context,
        ref,
        profileData,
        otherUser,
        sendingIvnite,
      ),
      text: switch (otherUser.status) {
        RelationshipStatus.notFriends => 'Senf friend invite',
        RelationshipStatus.friends => 'Message',
        RelationshipStatus.friendRequestSent => 'Invite sent',
      },
      color: otherUser.status == RelationshipStatus.friendRequestSent
          ? Colors.grey
          : context.jColor.onPrimary,
      textStyle: context.jText.bodySmall,
      size: const Size(200, 50),
    );
  }

  _handleSendInvite(
    BuildContext context,
    WidgetRef ref,
    UserProfileModel profileData,
    UserWithRelationshipStatus otherUser,
    ValueNotifier<bool> sendingIvnite,
  ) {
    if (otherUser.status == RelationshipStatus.friendRequestSent) return;

    if (otherUser.status == RelationshipStatus.friends) {
      return context.pushNamed(
        ChatRoutes.chat.name,
        pathParameters: {
          'chatId': otherUser.user.rootChatId.toString(),
        },
        extra: otherUser.user,
      );
    }

    final future = ref.read(
      sendFriendInviteProvider(userId: userId).future,
    );

    sendingIvnite.value = true;
    future.then(
      (success) {
        sendingIvnite.value = false;
        showDialog(
          context: context,
          builder: (context) => OkPopup(
            title: success ? 'Invite sent' : 'Could not send invite',
            onOkPressed: () => onInviteSent(),
          ),
        );
      },
    );
  }
}
