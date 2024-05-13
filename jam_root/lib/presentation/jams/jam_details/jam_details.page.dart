import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jam/config/config.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_theme/jam_theme.dart';
import 'package:jam_ui/jam_ui.dart';
import 'package:jam_utils/jam_utils.dart';

class JamDetailsPage extends HookConsumerWidget {
  const JamDetailsPage({super.key, required this.jamId});

  final String jamId;

  Color getContrastingTextColor(Color backgroundColor) {
    final luminance = backgroundColor.computeLuminance();
    return luminance > 0.5 ? Colors.black : Colors.white;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final jam = ref.watch(
      getJamByIdProvider(
        jamId: int.parse(jamId),
      ),
    );

    return Scaffold(
      body: jam.maybeWhen(
        data: (data) => Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: CachedNetworkImageProvider(
                data.backgroundUrlWithPlaceholder,
              ),
              fit: BoxFit.contain,
              colorFilter: ColorFilter.mode(
                context.jColor.background.withOpacity(0.9),
                BlendMode.srcOver,
              ),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: Text(
                  data.name.jamPostfix(),
                  textAlign: TextAlign.right,
                  style: context.jText.displayMedium
                      ?.copyWith(fontFamily: rubickFamily),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Driven by: ',
                    style: context.jText.headlineSmall,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    data.creator?.fullName ?? 'Anonymous',
                    style: context.jText.headlineSmall,
                  ),
                  const SizedBox(width: 10),
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(
                      data.creator?.avatar ??
                          ImagePathConstants.DEFAULT_AVATAR_IMAGE_BUCKET_URL,
                    ),
                  )
                ],
              ),
              const Spacer(),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.65,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Wrap(
                        children: [
                          ...data.relatedVibes.map((e) => Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0,
                                  vertical: 4,
                                ),
                                child: VText(vibe: e),
                              ))
                        ],
                      ),
                      JamLocationNameTile(jam: data),
                      JamDivider(color: context.jColor.primary),
                      JamDateTimeTile(jam: data),
                      JamDivider(color: context.jColor.primary),
                      JamParticipantsTile(jam: data),
                      JamDivider(color: context.jColor.primary),
                      JamExtraInformationTile(jam: data),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, left: 10),
                        child: Column(
                          children: [
                            _buildShowOnMapButton(context, data),
                            _buildInviteFriendsButton(context, data),
                            _buildEditJamButton(context, data),
                            _buildEditJamFormButton(context, data),
                          ],
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        orElse: () => const SizedBox(),
      ),
    );
  }

  Widget _buildEditJamFormButton(BuildContext context, JamModel jam) {
    final isOwner = supabase.auth.currentUser!.id == jam.creatorId;
    final formExists = jam.formModel != null;

    if (!(isOwner && formExists && DateTime.now().isBefore(jam.date))) {
      return const SizedBox();
    }

    return Align(
      alignment: Alignment.topLeft,
      child: TextButton.icon(
        onPressed: () => context.pushNamed(
          JamRoutes.editJamForm.name,
          pathParameters: {'jamId': jam.id.toString()},
          extra: jam,
        ),
        icon: const Icon(Icons.quiz_outlined),
        label: const Text('Edit jam form'),
      ),
    );
  }

  Widget _buildEditJamButton(BuildContext context, JamModel jam) {
    final isOwner = supabase.auth.currentUser!.id == jam.creatorId;

    if (isOwner && DateTime.now().isBefore(jam.date)) {
      return Align(
        alignment: Alignment.topLeft,
        child: TextButton.icon(
          onPressed: () => context.pushNamed(
            JamRoutes.edit.name,
            pathParameters: {'jamId': jam.id.toString()},
            extra: jam,
          ),
          icon: const Icon(Icons.edit),
          label: const Text('Edit jam'),
        ),
      );
    }

    return const SizedBox();
  }

  Widget _buildInviteFriendsButton(BuildContext context, JamModel jam) {
    if (DateTime.now().isBefore(jam.date)) {
      return Align(
        alignment: Alignment.topLeft,
        child: TextButton.icon(
          onPressed: () => showDialog(
            context: context,
            builder: (ctx) => InviteFriendToJamDialog(
              jam: jam,
            ),
          ),
          icon: const Icon(Icons.mail),
          label: const Text('Invite friends'),
        ),
      );
    }

    return const SizedBox();
  }

  Widget _buildShowOnMapButton(BuildContext context, JamModel jam) {
    return Align(
      alignment: Alignment.topLeft,
      child: TextButton.icon(
        onPressed: () => context.pushNamed(
          MapRoutes.map.name,
          queryParameters: {MapRoutes.map.pathParameter!: jam.location},
        ),
        icon: const Icon(Icons.map),
        label: const Text('Open in Maps'),
      ),
    );
  }
}
