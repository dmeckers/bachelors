import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_utils/jam_utils.dart';

class MapWidget extends HookConsumerWidget {
  const MapWidget({super.key});

  invalidateStateOnLoad(WidgetRef ref) {
    useEffect(() {
      ref.invalidate(mapWidgetStateControllerProvider);

      return null;
    }, []);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapStateController = ref.watch(mapWidgetStateControllerProvider);
    invalidateStateOnLoad(ref);
    return asyncWrapped(
      ref: ref,
      presenter: (data) => GoogleMap(
        zoomControlsEnabled: false,
        cloudMapId: '5361fdbe18cb28e5',
        onLongPress: (LatLng position) async =>
            await _handleNewJamLocationMapTap(
          context,
          position,
          ref,
        ),
        onTap: (position) async {
          if (mapStateController.state.value.showBottomSheet) {
            mapStateController.setShowBottomSheet(false);
            Navigator.pop(context);
          }
        },
        onMapCreated: (controller) {
          mapStateController.setGoogleMapsController(controller);
          if (mapStateController.mapData$.currentPosition.isNotNull) {
            controller.animateCamera(
              CameraUpdate.newLatLng(
                mapStateController.mapData$.currentPosition,
              ),
            );
          }
        },
        initialCameraPosition: const CameraPosition(
          target: LatLng(51.5074, 0.1278),
          zoom: 14.4746,
        ),
        compassEnabled: false,
        cameraTargetBounds: CameraTargetBounds(
          PositionService.getBounds(data.currentPosition, 0.5),
        ),
        minMaxZoomPreference: const MinMaxZoomPreference(10, 16),
        markers: _MapMarkersHelper.getMarkers(context, ref, data),
      ),
    );
  }

  Widget asyncWrapped({
    required Widget Function(MapData) presenter,
    required WidgetRef ref,
  }) =>
      ref.watch(locations$).when(
            data: (data) => presenter(data.mapData),
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

  _handleNewJamLocationMapTap(
    BuildContext context,
    LatLng position,
    WidgetRef ref,
  ) {
    final mapStateController = ref.read(mapWidgetStateControllerProvider);

    mapStateController.addTempMarker(
      lat: position.latitude,
      lon: position.longitude,
    );

    mapStateController.data.googleMapsController?.animateCamera(
      CameraUpdate.newLatLngZoom(position, 18),
    );

    if (mapStateController.data.showBottomSheet) return;

    mapStateController.setShowBottomSheet(true);

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
}

class _MapMarkersHelper {
  static Set<Marker> getMarkers(
    BuildContext context,
    WidgetRef ref,
    MapData data,
  ) {
    final locationItemsMarkers = data.locations.map(
      (e) => _mapToMarker(context, e, ref),
    );

    final userMarker = Marker(
      markerId: const MarkerId('currentPosition'),
      position: data.currentPosition,
      icon: JamMarker.getCurrentUserMarker(),
      infoWindow: const InfoWindow(title: 'Your location'),
    );

    final focusedPoint = data.focusedLocationPoint;

    final spotJamMarker = focusedPoint.isNotNull
        ? Marker(
            markerId: MarkerId(focusedPoint!.id as String),
            position: LatLng(
              focusedPoint.latitude,
              focusedPoint.longitude,
            ),
            icon:
                focusedPoint.marker ?? BitmapDescriptor.defaultMarkerWithHue(0),
            infoWindow: InfoWindow(
              title: data.focusedLocationPoint?.name ?? 'Spot Jam',
            ),
          )
        : null;

    return {
      ...locationItemsMarkers,
      userMarker,
      if (spotJamMarker.isNotNull) spotJamMarker!
    };
  }

  static Marker _mapToMarker(
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

  static _handleJamLocationMarkerTap(
    BuildContext context,
    LocationAbstactModel location,
    WidgetRef ref,
  ) {
    final mapStateController = ref.read(mapWidgetStateControllerProvider);

    mapStateController.setShowBottomSheet(true);
    showBottomSheet(
      context: context,
      builder: (ctx) => JamBottomSheet(
        jamLocation: location as JamLocation,
        onActionPressed: () {
          Navigator.of(context).pop();
          mapStateController.setShowBottomSheet(false);
        },
      ),
    );
  }

  static _handleUserLocationMarkerTap(
    BuildContext context,
    LocationAbstactModel location,
    WidgetRef ref,
  ) {
    final mapStateController = ref.read(mapWidgetStateControllerProvider);
    mapStateController.setShowBottomSheet(true);

    showBottomSheet(
      context: context,
      builder: (ctx) => SendFriendInviteBottomSheet(
        userId: location.id,
        onInviteSent: () {
          Navigator.of(context).pop();
          mapStateController.setShowBottomSheet(false);
        },
      ),
    );
  }
}
