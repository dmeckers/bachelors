import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jam/config/config.dart';
import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/jams/form/jam_form.page.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_ui/jam_ui.dart';
import 'package:jam_utils/jam_utils.dart';

class JamBottomSheet extends HookConsumerWidget with SupabaseUserGetter {
  const JamBottomSheet({
    super.key,
    required this.jamLocation,
    required this.onActionPressed,
  });

  final void Function() onActionPressed;

  final JamLocation jamLocation;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final jam = ref.watch(
      getJamByIdProvider(jamId: jamLocation.id),
    );

    final userJams = ref.watch(getParticipatingJamsProvider);

    return BottomSheetLayout(
      size: BottomSheetSize.medium,
      child: [jam, userJams].when(
        data: (data) {
          final jamData = data.first as JamModel;
          final userJamsData = data.last as List<JamModel>;
          final isMember = userJamsData.any((jam) => jam.id! == jamData.id!);
          final isOwner = getUserIdOrThrow() == jamData.creatorId;

          final toShowDetails = isMember || isOwner;

          return SizedBox(
            height: 230,
            child: Column(
              children: [
                CircleAvatar(
                  radius: 27,
                  backgroundImage: CachedNetworkImageProvider(
                    jamData.iconUrl.isEmpty
                        ? ImagePathConstants.DEFAULT_JAM_IMAGE_BUCKET_URL
                        : jamData.iconUrl,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  jamData.name,
                  style: context.jText.headlineMedium,
                ),
                const SizedBox(height: 8),
                Text(
                  "${jamData.date.nameWithoutYear}",
                  style: context.jText.headlineSmall,
                ),
                const SizedBox(height: 8),
                Text(
                  'Related vibes: ${jamData.relatedVibes.map((e) => e.name).join(', ')}',
                  style: context.jText.bodySmall,
                ),
                const Spacer(),
                toShowDetails
                    ? _buildButtonForParticipatingUser(context)
                    : _buildButton(isMember, context, ref),
              ],
            ),
          );
        },
        error: (error, _) => const JamErrorBox(
          errorMessage: 'Whoops! Failed to load jam',
          compact: true,
        ),
        loading: () => const CircularProgressIndicator(),
      ),
    );
  }

  TextButton _buildButton(
    bool isUserAlreadyParticipates,
    BuildContext context,
    WidgetRef ref,
  ) {
    return TextButton.icon(
      onPressed: () => (switch (jamLocation.joinType) {
        JamJoinTypeEnum.freeToJoin => _handleFreeToJoin,
        JamJoinTypeEnum.freeToJoinAfterForm => _handleFreeToJoinWithForm,
        JamJoinTypeEnum.freetoJoinAfterFormAndApprove => _handleJoinWithForm,
        JamJoinTypeEnum.invitesOnly => _handleFreeToJoin,
        JamJoinTypeEnum.requestToJoin => _handleRequestToJoin,
      })(context, ref),
      icon: Icon(jamLocation.joinType.icon),
      label: Text(jamLocation.joinType.title),
    );
  }

  Future _handleFreeToJoin(BuildContext context, WidgetRef ref) async {
    final success = await ref.read(jamRepositoryProvider).joinJam(
          jamId: jamLocation.id,
        );

    context.doIfMounted(
      () => showDialog(
        context: context,
        builder: (ctx) => OkPopup(
          title: success ? 'You have joined the jam' : 'Failed to join the jam',
          onOkPressed: () {
            onActionPressed();
            Navigator.of(context, rootNavigator: true).pop();
            if (success) {
              context.pushNamed(
                JamRoutes.details.name,
                pathParameters: {'jamId': jamLocation.id.toString()},
              );
            }
          },
        ),
      ),
    );
  }

  Future _handleRequestToJoin(BuildContext context, WidgetRef ref) async {
    onActionPressed();
    await ref.read(jamFormsServiceProvider).sendRequestForJoin(
          jamId: jamLocation.id,
        );

    context.doIfMounted(
      () => showDialog(
        context: context,
        builder: (ctx) => OkPopup(
          title: 'Request to join sent',
          onOkPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
          },
        ),
      ),
    );
  }

  Future _handleFreeToJoinWithForm(BuildContext context, WidgetRef ref) async {
    onActionPressed();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => JamFormPage(
          jamId: jamLocation.id,
          jamCreatorFcmToken: jamLocation.creatorFcmToken,
          toJoin: true,
        ),
      ),
    );
  }

  Future _handleJoinWithForm(BuildContext context, WidgetRef ref) async {
    onActionPressed();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => JamFormPage(
          jamId: jamLocation.id,
          jamCreatorFcmToken: jamLocation.creatorFcmToken,
        ),
      ),
    );
  }

  _buildButtonForParticipatingUser(BuildContext context) {
    return TextButton.icon(
      onPressed: () {
        context.pushNamed(
          JamRoutes.details.name,
          pathParameters: {'jamId': '${jamLocation.id}'},
        );
      },
      icon: const Icon(Icons.details),
      label: const Text('Details'),
    );
  }
}
