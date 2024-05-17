import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/config/config.dart';

import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam/presentation/user/user_state.dart';
import 'package:jam_ui/jam_ui.dart';
import 'package:jam_utils/jam_utils.dart';

final canInviteProvider = StateProvider<bool?>((ref) => null);

class OtherUserProfilePage extends HookConsumerWidget
    with ProfileRepositoryProviders {
  const OtherUserProfilePage({
    super.key,
    required this.viewedUserId,
    this.jamId,
  });

  final String viewedUserId;
  final String? jamId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (jamId.isNull) return const SizedBox();

    final currentUser = ref.read(userStateProvider).getLastValue();
    final asyncUserInfo = ref.watch(getUserInfoProvider(viewedUserId));

    final joinRequests = ref
        .watch(jamDetailsStateProvider(int.parse(jamId!)))
        .requireValue
        .joinRequests;

    return Scaffold(
      body: Center(
        child: asyncUserInfo.when(
          data: (viewedProfile) {
            final isFriend = currentUser.friends
                .where((friend) => friend.id == viewedUserId)
                .isNotEmpty;

            final canSendInvite = isFriend
                ? false
                : joinRequests
                        .where((req) => req.userId == viewedUserId)
                        .firstOrNull
                        ?.canReceiveFriendRequests ??
                    false;

            final inviteIcon = canSendInvite
                ? FontAwesomeIcons.userPlus
                : FontAwesomeIcons.userCheck;

            final inviteColor = canSendInvite ? Colors.green : Colors.yellow;
            final inviteText =
                canSendInvite ? 'Send friend request' : 'Friend request sent';

            return Scaffold(
              appBar: SimpleAppBar(
                  title:
                      viewedProfile.username ?? viewedProfile.fullName ?? ''),
              body: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: HeroAvatar(
                        isPersonal: false,
                        profile: viewedProfile,
                        radius: 60,
                        onTap: () =>
                            viewedProfile.photoUrls?.isNotEmpty ?? false
                                ? _showFullScreenImageViewer(
                                    context: context,
                                    images: viewedProfile.photoUrls!,
                                    mainAvatar: viewedProfile.avatar ?? '',
                                  )
                                : null,
                      ),
                    ),
                    if (!isFriend)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 20,
                        ),
                        child: TextButton.icon(
                          onPressed: () async {
                            final cancel =
                                ref.read(canInviteProvider).isNotNullOrFalse;
                            if (cancel || canSendInvite == false) return;

                            ref.read(canInviteProvider.notifier).state = false;

                            await ref
                                .read(socialRepositoryProvider)
                                .sendFriendInvite(userId: viewedUserId);

                            if (!context.mounted) return;

                            JSnackBar.show(
                              context,
                              title: 'Friend request sent',
                            );
                          },
                          icon: FaIcon(
                            inviteIcon,
                            color: inviteColor,
                          ),
                          label: Text(
                            inviteText,
                            style: TextStyle(color: inviteColor),
                          ),
                        ),
                      ),
                    ShakesOnNoLongPress(
                      child: ListTile(
                        leading: const Icon(Icons.person),
                        title: Text(viewedProfile.fullName ?? 'No Name'),
                        subtitle: Text(
                          'Name',
                          style: context.jText.headlineSmall,
                        ),
                      ),
                    ),
                    ShakesOnNoLongPress(
                      child: ListTile(
                        leading: const FaIcon(FontAwesomeIcons.commentDots),
                        title: Text(viewedProfile.profileStatus ?? 'No Status'),
                        subtitle: Text(
                          'Status',
                          style: context.jText.headlineSmall,
                        ),
                      ),
                    ),
                    ShakesOnNoLongPress(
                      child: ListTile(
                        leading: const FaIcon(FontAwesomeIcons.fire),
                        title: Text(
                          viewedProfile.vibes.map((e) => e.name).join(', '),
                        ),
                        subtitle: Text(
                          'Vibes',
                          style: context.jText.headlineSmall,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
          error: (error, s) => const JamErrorBox(
            errorMessage: 'Whoops! Something went wrong',
          ),
          loading: () => const Scaffold(
            body: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }

  _showFullScreenImageViewer({
    required BuildContext context,
    required List<String> images,
    required String mainAvatar,
  }) =>
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FullScreenImageViewer(
            images: images,
            isPersonal: false,
            mainAvatar: mainAvatar,
          ),
        ),
      );
}
