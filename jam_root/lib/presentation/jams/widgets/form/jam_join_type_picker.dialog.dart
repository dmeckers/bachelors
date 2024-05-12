import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/config/constants/image_paths.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_ui/jam_ui.dart';

class JamJoinTypePickerDialog extends ConsumerWidget {
  const JamJoinTypePickerDialog({super.key, this.jamModel});

  final JamModel? jamModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      actionsPadding: const EdgeInsets.all(0),
      insetPadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      content: SizedBox(
        height: MediaQuery.of(context).size.height * 0.8,
        width: MediaQuery.of(context).size.width * 0.9,
        child: Column(
          children: [
            _buildTypeContainer(
              context,
              title: 'Free to join',
              description: 'Everyone can join',
              type: JamJoinTypeEnum.freeToJoin,
              ref: ref,
            ),
            const JamDivider(),
            _buildTypeContainer(
              context,
              title: 'Invites only',
              description: 'Only invited can see it on map',
              type: JamJoinTypeEnum.invitesOnly,
              ref: ref,
            ),
            const JamDivider(),
            _buildTypeContainer(
              context,
              title: 'Join with request',
              description: 'People can join only when you approve join request',
              type: JamJoinTypeEnum.requestToJoin,
              ref: ref,
            ),
            const JamDivider(),
            _buildTypeContainer(
              context,
              title: 'Free to join with registration',
              description: 'People can join after filling up the defined form',
              type: JamJoinTypeEnum.freeToJoinAfterForm,
              ref: ref,
            ),
            const JamDivider(),
            _buildTypeContainer(
              context,
              title: 'Join with registration',
              description:
                  'People can join after filling up the defined form and getting approved',
              type: JamJoinTypeEnum.freetoJoinAfterFormAndApprove,
              ref: ref,
            ),
          ],
        ),
      ),
    );
  }

  Flexible _buildTypeContainer(
    BuildContext context, {
    required String title,
    required String description,
    required JamJoinTypeEnum type,
    required WidgetRef ref,
  }) {
    return Flexible(
      flex: 1,
      child: Row(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width * 0.3,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImagePathConstants.CALL_JAM_IMAGE_PATH),
                fit: BoxFit.contain,
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: context.jText.headlineMedium,
                ),
                Text(
                  description,
                  style: context.jText.bodySmall,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: 30,
                  child: ElevatedButton(
                    onPressed: () {
                      jamModel == null
                          ? ref
                              .read(freshJamViewModelStateProvider.notifier)
                              .updateJoinType(type)
                          : ref
                              .read(
                                  jamViewModelStateProvider(jamModel!).notifier)
                              .updateJoinType(type);

                      context.pop();
                    },
                    child: Text(
                      'Select',
                      style: context.jText.bodySmall,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
