import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jam/data/data.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_ui/jam_ui.dart';

class OtherUserProfilePage extends HookConsumerWidget
    with ProfileRepositoryProviders {
  const OtherUserProfilePage({
    super.key,
    required this.viewedUserId,
  });

  final String viewedUserId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncUserInfo =
        ref.watch(checkRelationShipStatusProvider(userId: viewedUserId));

    return Scaffold(
      body: Center(
        child: asyncUserInfo.when(
          data: (viewedProfile) {
            return Scaffold(
              appBar: SimpleAppBar(
                title: viewedProfile.profile.username ??
                    viewedProfile.profile.fullName ??
                    '',
              ),
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
                        profile: viewedProfile.profile,
                        radius: 60,
                        onTap: () =>
                            viewedProfile.profile.photoUrls?.isNotEmpty ?? false
                                ? _showFullScreenImageViewer(
                                    context: context,
                                    images: viewedProfile.profile.photoUrls!,
                                    mainAvatar:
                                        viewedProfile.profile.avatar ?? '',
                                  )
                                : null,
                      ),
                    ),
                    FriendInviteButton(viewedUser: viewedProfile),
                    ShakesOnNoLongPress(
                      child: ListTile(
                        leading: const Icon(Icons.person),
                        title:
                            Text(viewedProfile.profile.fullName ?? 'No Name'),
                        subtitle: Text(
                          'Name',
                          style: context.jText.headlineSmall,
                        ),
                      ),
                    ),
                    ShakesOnNoLongPress(
                      child: ListTile(
                        leading: const FaIcon(FontAwesomeIcons.commentDots),
                        title: Text(
                            viewedProfile.profile.profileStatus ?? 'No Status'),
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
                          viewedProfile.profile.vibes
                              .map((e) => e.name)
                              .join(', '),
                        ),
                        subtitle: Text(
                          'Vibes',
                          style: context.jText.headlineSmall,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          error: (error, s) => const JamErrorBox(
            errorMessage: 'Whoops! Something went wrong',
          ),
          loading: () => const Scaffold(
            body: Center(child: CircularProgressIndicator()),
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
