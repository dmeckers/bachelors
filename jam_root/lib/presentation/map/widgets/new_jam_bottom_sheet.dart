import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jam/config/config.dart';
import 'package:jam_ui/jam_ui.dart';

class NewJamBottomSheet extends StatelessWidget {
  const NewJamBottomSheet({
    super.key,
    required this.onActionPressed,
    required this.position,
  });

  final void Function() onActionPressed;
  final LatLng position;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      width: double.infinity,
      child: Column(
        children: [
          const CircleAvatar(
            radius: 47,
            backgroundImage: CachedNetworkImageProvider(
              ImagePathConstants.DEFAULT_JAM_IMAGE_BUCKET_URL,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Wanna start a new jam here?',
            style: context.jText.headlineMedium,
          ),
          const SizedBox(height: 8),
          const Spacer(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: onActionPressed,
            child: const Text('Let\'s do it'),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
