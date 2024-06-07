import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_utils/jam_utils.dart';
import 'package:location/location.dart';

class MapWidget extends HookConsumerWidget {
  const MapWidget({
    super.key,
    required this.completer,
    // this.positionNotifier,
  });

  final ObjectRef<Completer<GoogleMapController>> completer;
  // final ValueNotifier<LatLng?>? positionNotifier;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedPlace = ref.watch(selectedPlaceLocationProvider);

    // final completer = useRef(Completer<GoogleMapController>());
    return ref.watch(locations$).when(
          data: (data) => GoogleMap(
            zoomControlsEnabled: false,
            cloudMapId: '5361fdbe18cb28e5',
            onLongPress: (LatLng position) async {
              ref.read(locationStateProvider).addTempMarker(
                    lat: position.latitude,
                    lon: position.longitude,
                  );

              _handleNewJamLocationMapTap(context, position, ref);

              completer.value.future.then((value) {
                value.animateCamera(CameraUpdate.newLatLng(position));
              });
            },
            onTap: (_) async {
              if (ref.read(showBottomSheetProvider)) {
                Navigator.pop(context);
                ref.read(showBottomSheetProvider.notifier).state = false;
                ref.read(showPutJamBottomSheetProvider.notifier).state = false;
              }
            },
            onMapCreated: (controller) {
              completer.value.complete(controller);
              ref.read(googleMapsControllerProvider);
            },
            initialCameraPosition: const CameraPosition(
              target: const LatLng(51.5074, 0.1278),
              zoom: 14.4746,
            ),
            compassEnabled: false,
            // cameraTargetBounds:
            //     CameraTargetBounds(PositionService.getBounds(selectedPlace, 0.5)),
            minMaxZoomPreference: const MinMaxZoomPreference(10, 16),
            // markers: markers..add(userMarker),
          ),
          loading: () => const MapBackdrop(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
          error: (e, s) => const MapBackdrop(
            child: Center(
              child: ShareLocationButton(),
            ),
          ),
        );
  }

  Marker _mapToMarker(
    BuildContext context,
    LocationAbstactModel location,
    WidgetRef ref,
  ) {
    return Marker(
      markerId: MarkerId(location.id.toString()),
      position: LatLng(location.latitude, location.longitude),
      infoWindow: InfoWindow(title: location.name),
      icon: location.marker ?? BitmapDescriptor.defaultMarkerWithHue(0),
      onTap: () {
        switch (location.type) {
          case LocationType.jam:
            _handleJamLocationMarkerTap(context, location, ref);
            break;
          case LocationType.spottedJam:
            break;
          case LocationType.user:
            _handleUserLocationMarkerTap(context, location, ref);
            break;
        }
      },
    );
  }

  _handleNewJamLocationMapTap(
    BuildContext context,
    LatLng position,
    WidgetRef ref,
  ) {
    if (ref.read(showPutJamBottomSheetProvider)) return;

    ref.read(showPutJamBottomSheetProvider.notifier).state = true;
    ref.read(showBottomSheetProvider.notifier).state = true;

    showBottomSheet(
      context: context,
      builder: (ctx) => NewJamBottomSheet(
        position: position,
        onActionPressed: () {
          context.pushNamed(JamRoutes.createNew.name, extra: position);
        },
      ),
    );
  }

  _handleJamLocationMarkerTap(
    BuildContext context,
    LocationAbstactModel location,
    WidgetRef ref,
  ) {
    ref.read(showBottomSheetProvider.notifier).state = true;
    showBottomSheet(
      context: context,
      builder: (ctx) => JamBottomSheet(
        jamLocation: location as JamLocation,
        onActionPressed: () {
          Navigator.of(context).pop();
          ref.read(showBottomSheetProvider.notifier).state = false;
        },
      ),
    );
  }

  _handleUserLocationMarkerTap(
    BuildContext context,
    LocationAbstactModel location,
    WidgetRef ref,
  ) {
    showBottomSheet(
      context: context,
      builder: (ctx) => SendFriendInviteBottomSheet(
        userId: location.id,
        onInviteSent: () {
          Navigator.of(context).pop();
          ref.read(showBottomSheetProvider.notifier).state = false;
        },
      ),
    );
    ref.read(showBottomSheetProvider.notifier).state = true;
  }
}
