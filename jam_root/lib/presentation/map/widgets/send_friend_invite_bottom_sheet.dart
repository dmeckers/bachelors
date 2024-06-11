import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/application/application.dart';

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
                backgroundImage: otherUser.profile.avatarImageProvider,
              ),
              Text(
                otherUser.profile.fullName,
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
    final common = currentUser.vibes.intersectById(otherUser.profile.vibes);

    return Column(
      children: [
        otherUser.status != RelationshipStatus.friends
            ? SizedBox(
                height: 100,
                child: Text(
                  'Vibes in common: ${common.map((e) => e.name).join(', ')}',
                  style: context.jText.bodySmall,
                ),
              )
            : const SizedBox(),
        _FriendBottomSheetButton(
          data: otherUser,
          userId: userId,
          onInviteSent: onInviteSent,
        )
      ],
    );
  }
}

class _FriendBottomSheetButton extends HookConsumerWidget {
  const _FriendBottomSheetButton({
    required this.data,
    required this.onInviteSent,
    required this.userId,
  });
  final String userId;
  final FriendShipStatusModel data;
  final void Function() onInviteSent;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final friendShipStatusState = useState(data.status);

    final styles = switch (friendShipStatusState.value) {
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
            await _handleSendFriendInvite(
              context,
              ref,
              data: data,
              notifier: friendShipStatusState,
            );
            break;
          case RelationshipStatus.friendRequestSent:
            break;
          case RelationshipStatus.friends:
            return context.pushNamed(
              ChatRoutes.chat.name,
              pathParameters: {
                'chatId': '${data.profile.rootChatId}',
              },
              extra: ChatModel(
                  id: data.profile.rootChatId!, relatedContact: data.profile),
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
          title: 'You and ${data.profile.fullName} are now friends!',
          onOkPressed: () => onInviteSent(),
        ),
      ),
    );
  }

  _handleSendFriendInvite(
    BuildContext context,
    WidgetRef ref, {
    required FriendShipStatusModel data,
    required ValueNotifier<RelationshipStatus> notifier,
  }) async {
    try {
      notifier.value = RelationshipStatus.friendRequestSent;

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
            title:
                result.first as bool ? 'Invite sent' : 'Could not send invite',
            onOkPressed: () => onInviteSent(),
          ),
        ),
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
