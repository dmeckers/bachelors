import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jam/config/constants/image_paths.dart';
import 'package:jam/presentation/presentation.dart';

class MapBackdrop extends StatelessWidget {
  const MapBackdrop({
    super.key,
    this.isLoading,
    this.errorMessage,
    this.child,
  });

  final Widget? child;
  final bool? isLoading;
  final String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IgnorePointer(
          child: GoogleMap(
            initialCameraPosition: const CameraPosition(
              target: LatLng(37.4219983, -122.084),
              zoom: 14.4746,
            ),
            key: key,
          ),
        ),
        BackdropFilter(
          filter: ui.ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: SizedBox(height: MediaQuery.of(context).size.height),
        ),
        Align(
          alignment: Alignment.center,
          child: (isLoading ?? false)
              ? const CircularProgressIndicator()
              : errorMessage != null
                  ? Column(
                      children: [
                        JamErrorBox(
                          imageAssetPath: ImagePathConstants.ERROR_JAR_1,
                          errorMessage: errorMessage!,
                        ),
                        if (child != null) child!,
                      ],
                    )
                  : child ?? const SizedBox.shrink(),
        ),
      ],
    );
  }
}
