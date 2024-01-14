import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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
    final userInfo = ref.watch(getUserInfoProvider(userId));
    final userProfile = ref.watch(currentUserProfileProvider);
    final userIsIvnited = ref.watch(
      checkUserHasFriendInviteProvider(userId: userId),
    );

    final sendingIvnite = useState(false);

    return BottomSheetLayout(
      paddingTop: 20,
      size: BottomSheetSize.medium,
      children: [
        const SizedBox(height: 10),
        [userInfo, userProfile, userIsIvnited].when(
          data: (data) {
            final dataList = data.toList();
            final userInfoData = dataList[0] as UserProfileModel;
            final currentUserProfileData = dataList[1] as UserProfileModel;
            final userIsIvnitedData = dataList[2] as bool;

            return Column(
              children: [
                CircleAvatar(
                  radius: 27,
                  backgroundImage: CachedNetworkImageProvider(
                    userInfoData.avatar ??
                        ImagePathConstants.DEFAULT_AVATAR_IMAGE_BUCKET_URL,
                  ),
                ),
                Text(
                  userInfoData.username ?? 'User',
                  style: context.jText.headlineMedium,
                ),
                Text(
                  userInfoData.profileStatus ?? '',
                  style: context.jText.headlineSmall,
                ),
                _buildBody(
                  userProfile,
                  currentUserProfileData,
                  userInfoData,
                  context,
                  userIsIvnitedData,
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
      AsyncValue<UserProfileModel> userProfile,
      UserProfileModel currentUserProfileData,
      UserProfileModel userInfoData,
      BuildContext context,
      bool userIsIvnitedData,
      WidgetRef ref,
      ValueNotifier<bool> sendingIvnite) {
    return userProfile.when(
      data: (profileData) => Column(
        children: [
          !profileData.friends.any((e) => e.id == userId)
              ? SizedBox(
                  height: 100,
                  child: Text(
                    'Vibes in common: ${currentUserProfileData.vibes.intersection(userInfoData.vibes).map((e) => e.name).join(', ')}',
                    style: context.jText.bodySmall,
                  ),
                )
              : const SizedBox(),
          _buildButton(
            profileData,
            context,
            userIsIvnitedData,
            ref,
            sendingIvnite,
          )
        ],
      ),
      error: (_, __) => const SizedBox(height: 100),
      loading: () => const SizedBox(height: 100),
    );
  }

  ButtonWithLoader _buildButton(
    UserProfileModel profileData,
    BuildContext context,
    bool userIsIvnitedData,
    WidgetRef ref,
    ValueNotifier<bool> sendingIvnite,
  ) {
    return ButtonWithLoader(
      onPressed: () => _handleSendInvite(
        context,
        ref,
        profileData,
        userIsIvnitedData,
        sendingIvnite,
      ),
      text: profileData.friends.where((e) => e.id == userId).firstOrNull != null
          ? 'Message'
          : userIsIvnitedData
              ? 'Invite sent'
              : 'Send friend invite',
      color: userIsIvnitedData ? Colors.grey : context.jColor.onPrimary,
      textStyle: context.jText.bodySmall,
      size: const Size(200, 50),
    );
  }

  _handleSendInvite(
    BuildContext context,
    WidgetRef ref,
    UserProfileModel profileData,
    bool userIsIvnitedData,
    ValueNotifier<bool> sendingIvnite,
  ) {
    final friend = profileData.friends.where((e) => e.id == userId).firstOrNull;
    final isFriend = friend != null;
    if (isFriend) {
      return context.pushNamed(
        ChatRoutes.chat.name,
        pathParameters: {
          'chatId': friend.rootChatId.toString(),
        },
        extra: friend,
      );
    }

    if (userIsIvnitedData) return null;

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
