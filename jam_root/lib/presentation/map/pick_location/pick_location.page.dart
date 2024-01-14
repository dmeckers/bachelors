import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/config/config.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam_ui/jam_ui.dart';
import 'package:jam_utils/jam_utils.dart';

class PickLocationPage extends StatefulWidget {
  static const DEFAULT_ZOOM = 14.4746;

  final double initZoom;
  final LatLng? initialPosition;
  final JamModel? jamModel;

  const PickLocationPage({
    super.key,
    this.initZoom = DEFAULT_ZOOM,
    this.initialPosition,
    this.jamModel,
  });

  @override
  State<PickLocationPage> createState() => _PickLocationPageState();
}

class _PickLocationPageState extends State<PickLocationPage> {
  LatLng? position;
  late String mapStyle;

  final Completer<GoogleMapController> _controller = Completer();
  @override
  void initState() {
    super.initState();
    _fetchInitialPosition();
  }

  Future<void> _fetchInitialPosition() async {
    final loadedMapStyle =
        await rootBundle.loadString(EnvironmentConstants.MAP_STYLE_PATH);

    if (widget.initialPosition != null) {
      setState(() {
        mapStyle = loadedMapStyle;
        position = widget.initialPosition;
      });
      return;
    }

    try {
      final currentPosition = await _determinePosition();
      setState(() {
        mapStyle = loadedMapStyle;
        position = LatLng(currentPosition.latitude, currentPosition.longitude);
      });
    } catch (error) {
      // Who cares
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.jColor.secondary,
      appBar: AppBar(
        title: Text(
          'Pick location',
          style: context.jText.bodyMedium,
        ),
      ),
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: LayoutBuilder(
            builder: (context, constraints) {
              var maxWidth = constraints.biggest.width;
              var maxHeight = constraints.biggest.height;

              if (position == null) {
                return const Center(child: CircularProgressIndicator());
              }

              return Stack(
                children: <Widget>[
                  SizedBox(
                    height: maxHeight,
                    width: maxWidth,
                    child: _buildMap(),
                  ),
                  _buildLocationMarker(maxHeight, maxWidth),
                  _buildPickLocationButton(maxHeight, maxWidth),
                  _buildGetCurrentPositionButton(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Consumer _buildPickLocationButton(double maxHeight, double maxWidth) {
    return Consumer(
      builder: (context, ref, child) {
        return Positioned(
          bottom: 30,
          right: 30,
          child: ElevatedButton(
            onPressed: () {
              widget.jamModel == null
                  ? ref
                      .read(freshJamViewModelStateProvider.notifier)
                      .updateLocation(
                        position.toString().formatCoords(),
                      )
                  : ref
                      .read(
                          jamViewModelStateProvider(widget.jamModel!).notifier)
                      .updateLocation(
                        position.toString().formatCoords(),
                      );
              Navigator.pop(context);
            },
            child: const Text('Pick location'),
          ),
        );
      },
    );
  }

  Positioned _buildLocationMarker(double maxHeight, double maxWidth) {
    return Positioned(
        bottom: maxHeight / 2,
        right: (maxWidth - 30) / 2,
        child: Container(
          width: 50,
          height: 50,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                ImagePathConstants.MAP_CURRENT_USER_MARKER_IMAGE_PATH,
              ),
            ),
          ),
        ));
  }

  GoogleMap _buildMap() {
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: position!,
        zoom: widget.initZoom,
      ),
      zoomControlsEnabled: false,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
        controller.setMapStyle(mapStyle);
      },
      onCameraMove: (CameraPosition newPosition) {
        setState(() {
          position = newPosition.target;
        });
      },
    );
  }

  Positioned _buildGetCurrentPositionButton() {
    return Positioned(
      bottom: 30,
      left: 30,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,

              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: IconButton(
          onPressed: () async {
            final position = await _determinePosition();
            final GoogleMapController controller = await _controller.future;
            controller.animateCamera(
              CameraUpdate.newCameraPosition(
                CameraPosition(
                  target: LatLng(position.latitude, position.longitude),
                  zoom: widget.initZoom,
                ),
              ),
            );
          },
          icon: const Icon(Icons.my_location),
        ),
      ),
    );
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }
}
