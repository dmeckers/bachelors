import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jam/domain/domain.dart';
import 'package:jam/generated/l10n.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_theme/jam_theme.dart';
import 'package:jam_ui/jam_ui.dart';
import 'package:jam_utils/jam_utils.dart';

class BigJamCard extends ConsumerWidget {
  const BigJamCard({super.key, required this.jam});

  final JamModel jam;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
        onTap: () => context.goNamed(
              JamRoutes.details.name,
              pathParameters: {
                S.of(context).jamid: jam.id.toString(),
              },
            ),
        onLongPress: () {
          HapticFeedback.vibrate();

          showModalBottomSheet(
            context: context,
            builder: (ctx) => JamCardBottomSheetActions(jam: jam),
          );
        },
        child: Card(
          elevation: 2,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            jam.name?.crop(13) ?? S.of(context).anonymous,
                            maxLines: 2,
                            style: context.jText.displaySmall?.copyWith(
                              color: Colors.white,
                              fontFamily: rubickFamily,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        jam.date.nameWithoutYear(),
                        style: context.jText.bodyMedium?.copyWith(
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              _buildBackground(context),
            ],
          ),
        ));
  }

  ClipPath _buildBackground(BuildContext context) {
    return ClipPath(
      clipper: WaveClipper(),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: CachedNetworkImageProvider(
              jam.backgroundUrlWithPlaceholder,
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
