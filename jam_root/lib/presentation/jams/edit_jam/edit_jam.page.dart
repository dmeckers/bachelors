import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jam/config/config.dart';
import 'package:jam/domain/jams/jam.model.dart';
import 'package:jam/generated/l10n.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_ui/jam_ui.dart';

final class EditJamPage extends HookConsumerWidget {
  const EditJamPage({super.key, required this.jam});

  final JamModel jam;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: SimpleAppBar(title: S.of(context).newJam),
      backgroundColor: context.jColor.secondary,
      body: Column(
        children: [
          _buildSection(
            context,
            Colors.amber,
            ImagePathConstants.JAM_CHOOSING_COSTUME_IMAGE_PATH,
            S.of(context).changeVibes,
            '',
            MediaQuery.of(context).size.height * 0.29,
          ),
          _buildSection(
            context,
            Colors.blue,
            ImagePathConstants.JAM_FACE_CONTROL_IMAGE_PATH,
            S.of(context).controlParticipants,
            S.of(context).restrictionsPoiliciesAndMore,
            MediaQuery.of(context).size.height * 0.29,
          ),
          _buildSection(
            context,
            Colors.green,
            ImagePathConstants.JAM_AT_TABLE_IMAGE_PATH,
            S.of(context).changeSomeDetails,
            S.of(context).changeTheNameDateAndMore,
            MediaQuery.of(context).size.height * 0.303,
            false,
            () => context.pushNamed(
              JamRoutes.jamEditDetails.name,
              pathParameters: {S.of(context).jamid: jam.id.toString()},
              extra: jam,
            ),
          ),
        ],
      ),
    );
  }

  InkWell _buildSection(
    BuildContext context,
    Color color,
    String imagePath,
    String title,
    String description,
    double height, [
    bool isDisabled = true,
    Function? action,
  ]) {
    return InkWell(
      onTap: () => action?.call(),
      child: Ink(
        color: color,
        height: height,
        width: double.infinity,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width * 0.3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    imagePath,
                  ),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(title),
                ),
                Text(
                  description,
                  style: context.jText.headlineMedium,
                ),
                if (isDisabled)
                  Text(
                    '(Unavailable in this version)',
                    style: context.jText.headlineSmall,
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
