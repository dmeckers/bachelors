import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_utils/jam_utils.dart';
import 'package:location/location.dart';

final gmc = StateProvider<GoogleMapController?>((ref) => null);

class MapWidget extends HookConsumerWidget {
  const MapWidget({super.key, required this.giveMeFuckingController});

  final Function(GoogleMapController controller) giveMeFuckingController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gugu = useState<GoogleMapController?>(null);
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
        onTap: (position) async =>
            await onMapTap(context, position, ref, gugu.value),
        onMapCreated: (controller) async {
          gugu.value = controller;
          giveMeFuckingController(controller);
          final location = (await Location.instance.getLocation()).toLatLng();
          controller.animateCamera(
            CameraUpdate.newLatLngZoom(location, 20),
          );
        },
        initialCameraPosition: const CameraPosition(
          target: LatLng(51.5074, 0.1278),
          zoom: 14.4746,
        ),
        compassEnabled: false,
        cameraTargetBounds: CameraTargetBounds(
          GeoPacker.getBounds(data.currentPosition, 0.5),
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

  onMapTap(
    BuildContext context,
    LatLng position,
    WidgetRef ref,
    GoogleMapController? gugu,
  ) async {
    final mapStateController = ref.watch(mapWidgetStateControllerProvider);
    mapStateController.setPlacesSearchResults(const []);

    if (!mapStateController.state.value.showBottomSheet) {
      gugu?.animateCamera(
        CameraUpdate.newLatLngZoom(position, 18),
      );
      return await _handleNewJamLocationMapTap(
        context,
        position,
        ref,
      );
    }

    mapStateController.hideBottomSheetAndTempMarkers();
    Navigator.pop(context);
  }

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

    if (mapStateController.data?.showBottomSheet ?? true) return;

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

    final searchedPlaceMarker = data.searchedPlaceLocation.isNotNull
        ? Marker(
            markerId: const MarkerId('currentPosition'),
            position: LatLng(
              data.searchedPlaceLocation!.latitude,
              data.searchedPlaceLocation!.longitude,
            ),
            icon: BitmapDescriptor.defaultMarkerWithHue(0),
            infoWindow: InfoWindow(
              title: data.searchedPlaceLocation!.name.split(',').first,
            ),
          )
        : null;
    // final   data. = Marker(markerId: const MarkerId)

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
      if (spotJamMarker.isNotNull) spotJamMarker!,
      if (searchedPlaceMarker.isNotNull) searchedPlaceMarker!
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
      infoWindow: InfoWindow(
          title: '${location.name}${switch (location.type) {
        LocationType.jam => ' (Jam)',
        LocationType.user => ' (User)',
        LocationType.spottedJam => '',
        LocationType.placeSearchResult => ' (Place)',
      }}'),
      icon: location.marker ?? BitmapDescriptor.defaultMarkerWithHue(0),
      onTap: () {
        final handler = switch (location.type) {
          LocationType.jam => _handleJamLocationMarkerTap,
          LocationType.user => _handleUserLocationMarkerTap,
          LocationType.spottedJam => null,
          LocationType.placeSearchResult => null,
        };
        handler?.call(context, location, ref);
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
