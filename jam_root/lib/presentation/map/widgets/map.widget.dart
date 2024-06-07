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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapState = ref.watch(mapStateViewModelProvider);
    final mapStateNotifier = ref.read(mapStateViewModelProvider.notifier);

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
        onTap: (_) async {
          ref.read(mapPageLocationsStateProvider).removeTempMarker();
          final shouldHideBottomSheet =
              mapState.showBottomSheet || mapState.showPutJamBottomSheet;
          if (!shouldHideBottomSheet) {
            return;
          }
          Navigator.pop(context);
          mapStateNotifier.setShowBottomSheet(false);
          mapStateNotifier.setShowPutJamBottomSheet(false);
        },
        onMapCreated: (controller) {
          mapStateNotifier.setGoogleMapsController(controller);
          controller.animateCamera(
            CameraUpdate.newLatLng(mapState.userCurrentLocation!),
          );
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
            data: (data) => presenter(data),
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
    final mapState = ref.read(mapStateViewModelProvider);
    final mapStateNotifier = ref.read(mapStateViewModelProvider.notifier);

    ref.read(mapPageLocationsStateProvider).addTempMarker(
          lat: position.latitude,
          lon: position.longitude,
        );

    mapState.googleMapsController?.animateCamera(
      CameraUpdate.newLatLngZoom(position, 18),
    );

    if (mapState.showPutJamBottomSheet) return;

    mapStateNotifier.setShowBottomSheet(true);
    mapStateNotifier.setShowPutJamBottomSheet(true);

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
    // final locationItemsMarkers = useMemoized(
    //   () => data.locations.map((e) => _mapToMarker(context, e, ref)),
    //   [data.locations],
    // );
    final locationItemsMarkers = data.locations.map(
      (e) => _mapToMarker(context, e, ref),
    );
    // final userMarker = useMemoized(
    //   () => Marker(
    //     markerId: const MarkerId('currentPosition'),
    //     position: data.currentPosition,
    //     icon: JamMarker.getCurrentUserMarker(),
    //     infoWindow: const InfoWindow(title: 'Your location'),
    //   ),
    //   [data.currentPosition],
    // );
    final userMarker = Marker(
      markerId: const MarkerId('currentPosition'),
      position: data.currentPosition,
      icon: JamMarker.getCurrentUserMarker(),
      infoWindow: const InfoWindow(title: 'Your location'),
    );

    final focusedPoint = data.focusedLocationPoint;

    // final spotJamMarker = useMemoized(
    //   () => focusedPoint.isNotNull
    //       ? Marker(
    //           markerId: MarkerId(focusedPoint!.id as String),
    //           position: LatLng(
    //             focusedPoint.latitude,
    //             focusedPoint.longitude,
    //           ),
    //           icon: focusedPoint.marker ??
    //               BitmapDescriptor.defaultMarkerWithHue(0),
    //           infoWindow: InfoWindow(
    //             title: data.focusedLocationPoint?.name ?? 'Spot Jam',
    //           ),
    //         )
    //       : null,
    //   [data.focusedLocationPoint],
    // );
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
      if (spotJamMarker != null) spotJamMarker
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
    final mapStateNotifier = ref.read(mapStateViewModelProvider.notifier);

    mapStateNotifier.setShowPutJamBottomSheet(true);
    showBottomSheet(
      context: context,
      builder: (ctx) => JamBottomSheet(
        jamLocation: location as JamLocation,
        onActionPressed: () {
          Navigator.of(context).pop();
          mapStateNotifier.setShowPutJamBottomSheet(false);
        },
      ),
    );
  }

  static _handleUserLocationMarkerTap(
    BuildContext context,
    LocationAbstactModel location,
    WidgetRef ref,
  ) {
    final mapStateNotifier = ref.read(mapStateViewModelProvider.notifier);

    showBottomSheet(
      context: context,
      builder: (ctx) => SendFriendInviteBottomSheet(
        userId: location.id,
        onInviteSent: () {
          Navigator.of(context).pop();
          mapStateNotifier.setShowBottomSheet(false);
        },
      ),
    );
    mapStateNotifier.setShowBottomSheet(false);
  }
}
