import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jam/config/config.dart';
import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_utils/jam_utils.dart';

class HeroAvatar extends HookConsumerWidget
    with ChattingProviders, ProfileRepositoryProviders {
  const HeroAvatar({
    super.key,
    required this.profile,
    this.radius = 20,
    this.onTap,
    this.isPersonal = true,
    this.tag,
    this.navigateOnTap = false,
  });

  final bool isPersonal;
  final UserProfileModel profile;
  final double radius;
  final VoidCallback? onTap;
  final String? tag;
  final bool navigateOnTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) => Hero(
        tag: tag ?? 'profile-${profile.id}',
        child: GestureDetector(
          onTap: navigateOnTap
              ? () {
                  isPersonal
                      ? context.pushNamed(
                          SettingsRoutes.profile.name,
                          extra: profile,
                        )
                      : context.pushNamed(
                          WatchOtherUsersRoutes.otherUserProfilePage.name,
                          pathParameters: {
                            WatchOtherUsersRoutes.otherUserProfilePage
                                .pathParameter!: profile.id,
                          },
                        );
                }
              : onTap,
          child: Stack(
            children: [
              CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(
                  profile.avatar.isEmptyOrNull
                      ? ImagePathConstants.DEFAULT_AVATAR_IMAGE_BUCKET_URL
                      : profile.avatar!,
                ),
                maxRadius: radius,
              ),
              Visibility(
                visible: profile.isOnlineAndActive && !isPersonal,
                child: Positioned(
                  bottom: 0,
                  right: 0,
                  child: OnlineBubble(
                    radius: radius,
                  ),
                ),
              )
            ],
          ),
        ),
      );
}
