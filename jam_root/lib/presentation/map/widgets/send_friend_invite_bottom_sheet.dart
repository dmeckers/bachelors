import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jam/config/config.dart';
import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam/presentation/user/user_state.dart';
import 'package:jam_ui/jam_ui.dart';
import 'package:jam_utils/jam_utils.dart';

class SendFriendInviteBottomSheet extends HookConsumerWidget
    with ProfileRepositoryProviders {
  const SendFriendInviteBottomSheet({
    super.key,
    required this.userId,
    required this.onInviteSent,
  });

  final String userId;
  final void Function() onInviteSent;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final otherUserData = ref.watch(
      checkRelationShipStatusProvider(userId: userId),
    );

    return BottomSheetLayout(
      paddingTop: 20,
      size: BottomSheetSize.medium,
      children: [
        const SizedBox(height: 10),
        otherUserData.when(
          data: (otherUser) => Column(
            children: [
              CircleAvatar(
                radius: 27,
                backgroundImage: CachedNetworkImageProvider(
                  otherUser.profile.avatar ??
                      ImagePathConstants.DEFAULT_AVATAR_IMAGE_BUCKET_URL,
                ),
              ),
              Text(
                otherUser.profile.username ?? 'User',
                style: context.jText.headlineMedium,
              ),
              Text(
                otherUser.profile.profileStatus ?? '',
                style: context.jText.headlineSmall,
              ),
              _buildBody(
                otherUser,
                context,
                ref,
              ),
            ],
          ),
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
    FriendShipStatusModel otherUser,
    BuildContext context,
    WidgetRef ref,
  ) {
    final currentUser = ref.watch(userStateProvider).getLastValue();

    return Column(
      children: [
        otherUser.status == RelationshipStatus.notFriends
            ? SizedBox(
                height: 100,
                child: Text(
                  'Vibes in common: ${currentUser.vibes.intersection(otherUser.profile.vibes).map((e) => e.name).join(', ')}',
                  style: context.jText.bodySmall,
                ),
              )
            : const SizedBox(),
        _buildButton(
          currentUser,
          otherUser,
          context,
          ref,
        )
      ],
    );
  }

  ButtonWithLoader _buildButton(
    UserProfileModel profileData,
    FriendShipStatusModel data,
    BuildContext context,
    WidgetRef ref,
  ) {
    final styles = switch (data.status) {
      RelationshipStatus.notFriends => (
          text: 'Send friend invite',
          color: Colors.green
        ),
      RelationshipStatus.friends => (
          text: 'Message',
          color: context.jColor.primary
        ),
      RelationshipStatus.friendRequestSent => (
          text: 'Invite sent',
          color: Colors.grey
        ),
      RelationshipStatus.friendRequestReceived => (
          text: 'Add friends',
          color: Colors.green
        ),
    };

    return ButtonWithLoader(
      onPressed: () async {
        switch (data.status) {
          case RelationshipStatus.friendRequestReceived:
            await _handleAddFriends(context, ref, data: data);
            break;
          case RelationshipStatus.notFriends:
            await _handleSendFriendInvite(context, ref, data: data);
            break;
          case RelationshipStatus.friendRequestSent:
            break;
          case RelationshipStatus.friends:
            return context.pushNamed(
              ChatRoutes.chat.name,
              pathParameters: {
                'chatId': '${data.profile.rootChatId}',
              },
              extra: data.profile,
            );
          default:
        }
      },
      text: styles.text,
      color: styles.color,
      textStyle: context.jText.bodySmall,
      size: const Size(200, 50),
    );
  }

  _handleAddFriends(
    BuildContext context,
    WidgetRef ref, {
    required FriendShipStatusModel data,
  }) async {
    await ref
        .read(socialRepositoryProvider)
        .acceptFriendInvite(friendInviteId: data.receivedFriendRequestId!);

    context.doIfMounted(
      () => showDialog(
        context: context,
        builder: (context) => OkPopup(
          title: 'You and ${data.profile.username} are now friends!',
          onOkPressed: () => onInviteSent(),
        ),
      ),
    );
  }

  _handleSendFriendInvite(
    BuildContext context,
    WidgetRef ref, {
    required FriendShipStatusModel data,
  }) async {
    // TODO refactor later
    final result = await Future.wait([
      ref.read(socialRepositoryProvider).sendFriendInvite(userId: userId),
      PushNotificationsService.sendNotification(
        NotificationTypeEnum.sendFriendInviteNotifications,
        {
          'user_received': userId,
          'user_fcm_token': data.profile.fcmToken,
        },
      )
    ]);

    context.doIfMounted(
      () => showDialog(
        context: context,
        builder: (context) => OkPopup(
          title: result.first as bool ? 'Invite sent' : 'Could not send invite',
          onOkPressed: () => onInviteSent(),
        ),
      ),
    );
  }
}
