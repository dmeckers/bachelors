import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:jam/config/config.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';

class ChatTileLeading extends StatelessWidget {
  const ChatTileLeading({
    super.key,
    required this.isSelected,
    required this.friend,
  });

  static const AVATAR_RADIUS = 25.0;

  final UserProfileModel friend;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: AVATAR_RADIUS,
          backgroundImage: CachedNetworkImageProvider(
            friend.avatar ?? ImagePathConstants.DEFAULT_AVATAR_IMAGE_BUCKET_URL,
          ),
        ),
        Visibility(
          visible: isSelected || friend.isOnline,
          child: Positioned(
            top: 35,
            bottom: 0,
            left: 35,
            right: 0,
            child: isSelected
                ? const Icon(
                    Icons.check_circle_rounded,
                    color: Colors.blue,
                    size: 19,
                  )
                : const OnlineBubble(),
          ),
        )
      ],
    );
  }
}
