import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_ui/jam_ui.dart';
import 'package:jam_utils/jam_utils.dart';

class SmallJamCard extends StatelessWidget {
  const SmallJamCard({super.key, required this.jam});

  final JamModel jam;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
            width: 2,
          ),
        ),
        child: ListTile(
          onTap: () => context.goNamed(
            JamRoutes.details.name,
            pathParameters: {
              'jamId': jam.id.toString(),
            },
          ),
          onLongPress: () => {
            HapticFeedback.vibrate(),
            showModalBottomSheet(
              context: context,
              builder: (ctx) => JamCardBottomSheetActions(jam: jam),
            )
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 10),
          leading: _buildLeading(),
          title: Text(jam.name?.capitalize() ?? 'Anonymous',
              style: context.jText.displaySmall?.copyWith(color: Colors.white)),
          tileColor: Colors.black,
          trailing: _buildTraling(context),
          subtitle: _buildSubtitle(
            context,
          ),
        ),
      ),
    );
  }

  SizedBox _buildLeading() => SizedBox(
        width: 50,
        child: CircleAvatar(
          radius: 15,
          backgroundImage: CachedNetworkImageProvider(
            jam.backgroundUrlWithPlaceholder,
          ),
        ),
      );

  SizedBox _buildTraling(BuildContext context) => SizedBox(
        height: 100,
        width: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Icon(
                    Icons.people,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    jam.participants.length.toString(),
                    style: context.jText.headlineSmall?.copyWith(
                      fontWeight: FontWeight.normal,
                      fontSize: 13,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0, top: 2.0),
              child: Text(
                jam.date.nameWithoutYear,
                style: context.jText.headlineSmall?.copyWith(
                  fontWeight: FontWeight.normal,
                  fontSize: 10,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      );

  Padding _buildSubtitle(
    BuildContext context,
  ) =>
      Padding(
        padding: const EdgeInsets.only(left: 2.0),
        child: Text(
          jam.locationName ?? 'Unknown',
          style: context.jText.bodySmall?.copyWith(
            fontSize: 12,
            color: Colors.white,
          ),
        ),
      );
}
