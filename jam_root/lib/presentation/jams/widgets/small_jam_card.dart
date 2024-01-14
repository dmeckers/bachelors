import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:jam/config/config.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_ui/jam_ui.dart';
import 'package:jam_utils/jam_utils.dart';

class SmallJamCard extends StatelessWidget {
  const SmallJamCard({super.key, required this.jam});

  final JamModel jam;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ColorHelper.getDominantColor(
        jam.iconUrl.isEmpty
            ? ImagePathConstants.DEFAULT_JAM_IMAGE_BUCKET_URL
            : jam.iconUrl,
      ),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox();
        }
        final fontColor = ColorHelper.colorContrast(snapshot.data!);

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Card(
            child: _buildContent(
              context,
              snapshot,
              fontColor,
            ),
          ),
        );
      },
    );
  }

  ListTile _buildContent(
    BuildContext context,
    AsyncSnapshot<Color> snapshot,
    Color fontColor,
  ) =>
      ListTile(
        onTap: () => context.goNamed(
          JamRoutes.details.name,
          pathParameters: {
            'jamId': jam.id.toString(),
          },
        ),
        onLongPress: () => {
          HapticFeedback.mediumImpact(),
          showModalBottomSheet(
            context: context,
            builder: (ctx) => JamCardBottomSheetActions(jam: jam),
          )
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 10),
        tileColor: snapshot.data,
        leading: _buildLeading(fontColor),
        title: _buildTitle(context, fontColor),
        trailing: _buildTraling(fontColor, context),
        subtitle: _buildSubtitle(context, fontColor),
      );

  SizedBox _buildLeading(Color fontColor) => SizedBox(
        width: 50,
        child: CircleAvatar(
          radius: 15,
          backgroundImage: CachedNetworkImageProvider(
            jam.backgroundUrlWithPlaceholder,
          ),
        ),
      );

  Text _buildTitle(BuildContext context, Color fontColor) => Text(
        jam.name?.capitalize() ?? 'Anonymous',
        style: context.jText.displaySmall?.copyWith(
          color: fontColor,
        ),
      );

  SizedBox _buildTraling(Color fontColor, BuildContext context) => SizedBox(
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
                  Icon(
                    Icons.people,
                    color: fontColor,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    jam.participants.length.toString(),
                    style: context.jText.headlineSmall?.copyWith(
                      color: fontColor,
                      fontWeight: FontWeight.normal,
                      fontSize: 13,
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
                jam.date.nameWithoutYear(),
                style: context.jText.headlineSmall?.copyWith(
                    color: fontColor,
                    fontWeight: FontWeight.normal,
                    fontSize: 10),
              ),
            ),
          ],
        ),
      );

  Padding _buildSubtitle(BuildContext context, Color fontColor) => Padding(
        padding: const EdgeInsets.only(left: 2.0),
        child: Text(
          jam.locationName ?? 'Unknown',
          style: context.jText.bodySmall?.copyWith(
            color: fontColor,
            fontSize: 12,
          ),
        ),
      );
}
