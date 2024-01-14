import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/data/map/marker_fetcher.mixin.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({super.key, required this.mapData, required this.style});
  final MapData mapData;
  final String style;
  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  late final LatLng position;

  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    position = LatLng(
      widget.mapData.currentPosition.latitude,
      widget.mapData.currentPosition.longitude,
    );
    _markers.addAll(
      widget.mapData.locations.map((e) => _mapToMarker(context, e)).toSet()
        ..add(
          Marker(
            markerId: const MarkerId('currentPosition'),
            position: LatLng(
              widget.mapData.currentPosition.latitude,
              widget.mapData.currentPosition.longitude,
            ),
            icon: JamMarker.getCurrentUserMarker(),
            infoWindow: const InfoWindow(title: 'Your location'),
          ),
        ),
    );
  }

  PersistentBottomSheetController<dynamic>? inviteBottomSheetController;
  PersistentBottomSheetController<dynamic>? jamBottomSheetController;
  PersistentBottomSheetController<dynamic>? newJamBottomSheetController;
  final Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (ctx, ref, c) {
        return Stack(
          children: [
            GoogleMap(
              zoomControlsEnabled: false,
              onLongPress: (LatLng position) async {
                if (inviteBottomSheetController == null &&
                    jamBottomSheetController == null &&
                    newJamBottomSheetController == null) {
                  setState(() {
                    _markers.add(
                      Marker(
                        markerId: const MarkerId('temp'),
                        position: position,
                        icon: JamMarker.getUserJamMarker(),
                      ),
                    );
                  });

                  _handleNewJamLocationMapTap(context, position);
                }
              },
              onTap: (_) async {
                inviteBottomSheetController?.close();
                inviteBottomSheetController = null;
                jamBottomSheetController?.close();
                jamBottomSheetController = null;
                newJamBottomSheetController?.close();
                newJamBottomSheetController = null;

                setState(() {
                  _markers.removeWhere(
                    (element) => element.markerId.value == 'temp',
                  );
                });
              },
              initialCameraPosition: CameraPosition(
                target: position,
                zoom: 14.4746,
              ),
              compassEnabled: false,
              cameraTargetBounds:
                  CameraTargetBounds(PositionService.getBounds(position, 0.5)),
              minMaxZoomPreference: const MinMaxZoomPreference(10, 16),
              markers: _markers,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
                controller.setMapStyle(widget.style);
              },
            ),
          ],
        );
      },
    );
  }

  Marker _mapToMarker(BuildContext context, LocationAbstactModel location) {
    return Marker(
      markerId: MarkerId(location.id.toString()),
      position: LatLng(location.latitude, location.longitude),
      infoWindow: InfoWindow(title: location.name),
      icon: location.marker ?? BitmapDescriptor.defaultMarkerWithHue(0),
      onTap: () => location.type == LocationType.jam
          ? _handleJamLocationMarkerTap(context, location)
          : _handleUserLocationMarkerTap(context, location),
    );
  }

  _handleNewJamLocationMapTap(
    BuildContext context,
    LatLng position,
  ) {
    newJamBottomSheetController = showBottomSheet(
      context: context,
      builder: (ctx) => NewJamBottomSheet(
        position: position,
        onActionPressed: () {
          setState(() {
            _markers.removeWhere(
              (element) => element.markerId.value == 'temp',
            );
          });
          newJamBottomSheetController?.close();
          newJamBottomSheetController = null;
          context.pushNamed(JamRoutes.createNew.name, extra: position);
        },
      ),
    );
  }

  _handleJamLocationMarkerTap(
    BuildContext context,
    LocationAbstactModel location,
  ) {
    jamBottomSheetController = showBottomSheet(
      context: context,
      builder: (ctx) => JamBottomSheet(
        jamLocation: location as JamLocation,
        onActionPressed: () => jamBottomSheetController?.close(),
      ),
    );
  }

  _handleUserLocationMarkerTap(
    BuildContext context,
    LocationAbstactModel location,
  ) {
    inviteBottomSheetController = showBottomSheet(
      context: context,
      builder: (ctx) => SendFriendInviteDialog(
        userId: location.id,
        onInviteSent: () => inviteBottomSheetController?.close(),
      ),
    );
  }
}
