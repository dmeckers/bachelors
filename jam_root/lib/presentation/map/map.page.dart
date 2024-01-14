import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/config/config.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_utils/jam_utils.dart';

class MapPage extends HookConsumerWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var mapData = ref.watch(getMapDataStreamProvider);
    final mapStyle = ref.watch(mapStyleProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Your local area map',
          style: TextStyle(fontSize: 18),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              if (ref.read(connectivityStatusProvider) ==
                  ConnectionStatus.isDisconnected) return;

              mapData = ref.refresh(getMapDataStreamProvider);
            },
          ),
        ],
      ),
      body: mapStyle.maybeWhen(
        data: (style) => ref.watch(connectivityStatusProvider) ==
                ConnectionStatus.isDisconnected
            ? _buildMapInternetError(
                context,
                style,
                'You are offline. Please check your internet connection',
              )
            : mapData.when(
                data: (data) => MapWidget(
                  mapData: data,
                  style: style,
                ),
                error: (error, _) => _buildMapError(
                  context,
                  style,
                  'Whoops! Something went wrong while loading the map',
                ),
                loading: () => _buildMapPlaceholder(context, style),
              ),
        orElse: () => const SizedBox(),
      ),
    );
  }

  Stack _buildMapPlaceholder(
    BuildContext context,
    String style,
  ) {
    return _mapWithBackDrop(context, style, const CircularProgressIndicator());
  }

  Stack _buildMapError(
    BuildContext context,
    String error,
    String style,
  ) {
    return _mapWithBackDrop(context, style, JamErrorBox(errorMessage: error));
  }

  Stack _buildMapInternetError(
      BuildContext context, String style, String error) {
    return _mapWithBackDrop(
      context,
      style,
      JamErrorBox(
        errorMessage: error,
        imageAssetPath: ImagePathConstants.NO_INTERNET_CONNECTION,
      ),
    );
  }

  Stack _mapWithBackDrop(BuildContext context, String style, Widget child) {
    return Stack(
      children: [
        IgnorePointer(
          child: GoogleMap(
            initialCameraPosition: const CameraPosition(
              target: LatLng(37.4219983, -122.084),
              zoom: 14.4746,
            ),
            key: key,
            onMapCreated: (GoogleMapController controller) {
              controller.setMapStyle(style);
            },
          ),
        ),
        BackdropFilter(
          filter: ui.ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: SizedBox(height: MediaQuery.of(context).size.height),
        ),
        Align(
          alignment: Alignment.center,
          child: child,
        ),
      ],
    );
  }
}

final mapStyleProvider = FutureProvider((ref) {
  return rootBundle.loadString(EnvironmentConstants.MAP_STYLE_PATH);
});
