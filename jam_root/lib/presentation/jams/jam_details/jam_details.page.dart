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
                  data.name?.jamPostfix() ?? 'Anonymous',
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
                      const Spacer(),
                      ShowJamOnMapButton(jam: data),
                      const SizedBox(height: 5),
                      if (DateTime.now().isBefore(data.date))
                        _buildInviteFriendsButton(context, data),
                      const SizedBox(height: 5),
                      if (supabase.auth.currentUser!.id == data.creatorId &&
                          DateTime.now().isBefore(data.date))
                        _buildEditJamButton(context, data),
                      const SizedBox(height: 15),
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

  SizedBox _buildEditJamButton(BuildContext context, JamModel data) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.6,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.black,
        ),
        onPressed: () => context.pushNamed(
          JamRoutes.edit.name,
          pathParameters: {'jamId': data.id.toString()},
          extra: data,
        ),
        child: const Row(
          children: [
            Icon(Icons.edit),
            SizedBox(width: 30),
            Text('Edit Jam'),
          ],
        ),
      ),
    );
  }

  SizedBox _buildInviteFriendsButton(BuildContext context, JamModel jam) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.6,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.black,
        ),
        onPressed: () => showDialog(
          context: context,
          builder: (ctx) => InviteFriendToJamDialog(
            jam: jam,
          ),
        ),
        child: const Row(
          children: [
            Icon(Icons.mail),
            SizedBox(width: 30),
            Text('Invite friends')
          ],
        ),
      ),
    );
  }

  // void _handleDeleteJam(BuildContext context, WidgetRef ref, int jamId) {
  //   ref.read(deleteJamProvider(jamId: jamId).future).then((_) {
  //     ref.invalidate(userJamControllerProvider);
  //     context.canPop() ? context.pop() : context.goNamed(JamRoutes.jams.name);
  //   });
  // }
}


 //                         child: IconButton(
  //                           icon: const Icon(
  //                             Icons.delete,
  //                             color: Colors.red,
  //                           ),
  //                           onPressed: () => showDialog(
  //                             context: context,
  //                             builder: (context) => DestructiveDialog(
  //                               onConfirm: (_) => _handleDeleteJam(
  //                                 context,
  //                                 ref,
  //                                 data.id!,
  //                               ),
  //                               title: 'Delete jam',
  //                               subtitle:
  //                                   'Are you sure you want to delete this jam?',
  //                             ),
  //                           ),
  //                         ),
  //                       ),
  //                     )
  //                   : const SizedBox();