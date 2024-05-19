import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_google_maps_webservices/places.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/config/config.dart';

import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_ui/jam_ui.dart';
import 'package:jam_utils/jam_utils.dart';

final showBottomSheetProvider = StateProvider<bool>((ref) => false);
final showPutJamBottomSheetProvider = StateProvider<bool>((ref) => false);

class MapPage extends HookConsumerWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final positionNotifier = useState<LatLng?>(null);
    final searchResultsNotifier = useState<List<Prediction>>([]);
    final showResults = useState(false);
    final completer = useRef(Completer<GoogleMapController>());

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Set jam location',
          style: context.jText.bodyMedium,
        ),
        bottom: MapPlaceTopSearchBar(
          positionNotifier: positionNotifier,
          searchResultsNotifier: searchResultsNotifier,
          showResultsNotifier: showResults,
        ),
      ),
      body: Stack(
        children: [
          MapWidget(
            completer: completer,
            positionNotifier: positionNotifier,
          ),
          searchResultsNotifier.value.isNotEmpty || showResults.value
              ? LayoutBuilder(
                  builder: (ctx, constraints) => Container(
                    height: min(
                      constraints.maxHeight,
                      searchResultsNotifier.value.length * 62.0,
                    ),
                    width: 1000,
                    color: context.jColor.secondary,
                    child: ListView.separated(
                      separatorBuilder: (context, index) => const JamDivider(
                        color: Colors.black,
                      ),
                      itemCount: searchResultsNotifier.value.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          onTap: () async {
                            final placeId =
                                searchResultsNotifier.value[index].placeId;
                            searchResultsNotifier.value = [];

                            if (placeId.isEmptyOrNull) return;

                            final response = await ref
                                .watch(placesProvider)
                                .getDetailsByPlaceId(placeId!);

                            if (response.result.geometry.isNull) return;

                            completer.value.future.then(
                              (value) => value.animateCamera(
                                CameraUpdate.newLatLng(
                                  LatLng(response.result.geometry!.location.lat,
                                      response.result.geometry!.location.lng),
                                ),
                              ),
                            );
                          },
                          leading: const Icon(
                            Icons.location_on,
                            color: Colors.black,
                          ),
                          title: Text(
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                            searchResultsNotifier.value[index].description ??
                                'nothing',
                          ),
                        );
                      },
                    ),
                  ),
                )
              : const SizedBox(),
          _buildSomething(),
          _buildSomething2(),
          _buildGetCurrentPositionButton(),
          _buildMapFab(),
        ],
      ),
    );
  }

  _buildMapFab() {
    return const Positioned(
      bottom: 15,
      right: 15,
      child: SizedBox(
        width: 100,
        height: 100,
        child: ExpandableFab(
          distance: 20,
          children: [
            MapLegendItem(
              text: 'Other people',
              assetPath: ImagePathConstants.MAP_USER_MARKER_IMAGE_PATH,
            ),
            MapLegendItem(
              text: 'Other jams',
              assetPath: ImagePathConstants.MAP_JAM_MARKER_IMAGE_PATH,
            ),
            MapLegendItem(
              text: 'Your jams',
              assetPath: ImagePathConstants.MAP_USERS_JAM_MARKER_IMAGE_PATH,
            ),
            MapLegendItem(
              text: 'Friends',
              assetPath: ImagePathConstants.MAP_FRIEND_MARKER_IMAGE_PATH,
            ),
            MapLegendItem(
              text: 'You',
              assetPath: ImagePathConstants.MAP_CURRENT_USER_MARKER_IMAGE_PATH,
            ),
          ],
        ),
      ),
    );
  }

  Positioned _buildGetCurrentPositionButton(
      // Completer<GoogleMapController> controllerCompleter,
      ) {
    return Positioned(
      bottom: 15,
      left: 15,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: IconButton(
          onPressed: () async {
            // final position = await _determinePosition();
            // final GoogleMapController controller =
            //     await controllerCompleter.future;
            // controller.animateCamera(
            //   CameraUpdate.newCameraPosition(
            //     CameraPosition(
            //         target: LatLng(position.latitude!, position.longitude!),
            //         zoom: 14.4746),
            //   ),
            // );
          },
          icon: const Icon(Icons.my_location),
        ),
      ),
    );
  }

  _buildSomething() {
    return Positioned(
      bottom: -20,
      left: -10,
      child: Transform.rotate(
        angle: 0.3,
        child: Container(
          width: 150,
          height: 40,
          color: Colors.red,
        ),
      ),
    );
  }

  _buildSomething2() {
    return Positioned(
      bottom: -20,
      right: -10,
      child: Transform.rotate(
        angle: -0.3,
        child: Container(
          width: 150,
          height: 40,
          color: Colors.blue,
        ),
      ),
    );
  }

  // Future<LocationData> _determinePosition() async {
  //   return await Location.instance.getLocation();
  // }
}

class MapWidget extends HookConsumerWidget {
  const MapWidget({
    super.key,
    required this.completer,
    this.positionNotifier,
  });

  final ObjectRef<Completer<GoogleMapController>> completer;
  final ValueNotifier<LatLng?>? positionNotifier;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final location$ = ref.watch(locations$);
    // final completer = useRef(Completer<GoogleMapController>());

    return location$.maybeWhen(
      data: (data) {
        final position = LatLng(
          data.currentPosition.latitude!,
          data.currentPosition.longitude!,
        );

        positionNotifier?.value = position;

        final markers = useMemoized(() {
          return data.locations
              .map((e) => _mapToMarker(context, e, ref))
              .toSet();
        }, [data.locations]);

        final userMarker = useMemoized(() {
          return Marker(
            markerId: const MarkerId('currentPosition'),
            position: position,
            icon: JamMarker.getCurrentUserMarker(),
            infoWindow: const InfoWindow(title: 'Your location'),
          );
        }, [position]);

        return GoogleMap(
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
          },
          initialCameraPosition: CameraPosition(
            target: position,
            zoom: 14.4746,
          ),
          compassEnabled: false,
          cameraTargetBounds:
              CameraTargetBounds(PositionService.getBounds(position, 0.5)),
          minMaxZoomPreference: const MinMaxZoomPreference(10, 16),
          markers: markers..add(userMarker),
        );
      },
      orElse: () => const MapBackdrop(isLoading: true),
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

// ? LayoutBuilder(builder: (context, constraints) {
//                   return SizedBox(
//                     height: min(constraints.maxHeight,
//                         searchResultsNotifier.value.length * 62.0),
//                     child:
//                   );
//                 })
//               : const SizedBox()