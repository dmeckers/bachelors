import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_google_maps_webservices/places.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:geocoding/geocoding.dart' as geocoding;

import 'package:jam/config/config.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_ui/jam_ui.dart';
import 'package:jam_utils/jam_utils.dart';

class PickLocationPage extends HookConsumerWidget {
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
  Widget build(BuildContext context, WidgetRef ref) {
    final position = useState<LatLng?>(null);
    final mapStyle = useState<String?>(null);
    final controller = useState<Completer<GoogleMapController>>(
        Completer<GoogleMapController>());

    final searchResults = useState<List<Prediction>>([]);
    final showResults = useState(false);

    useEffect(() {
      void fetchInitialPosition() async {
        position.value = initialPosition ?? await requestLocation(ref);
      }

      fetchInitialPosition();
      return null;
    }, []);

    final places = ref.watch(placesProvider);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: context.jColor.secondary,
      appBar: const MapPageAppBar(),
      body: Column(
        children: [
          searchResults.value.isNotEmpty || showResults.value
              ? LayoutBuilder(builder: (context, constraints) {
                  return SizedBox(
                    height: min(constraints.maxHeight,
                        searchResults.value.length * 62.0),
                    child: ListView.separated(
                      separatorBuilder: (context, index) => const JamDivider(
                        color: Colors.black,
                      ),
                      itemCount: searchResults.value.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          onTap: () async {
                            // showResults.value = false;
                            final placeId = searchResults.value[index].placeId;
                            searchResults.value = [];

                            if (placeId.isEmptyOrNull) return;

                            final response =
                                await places.getDetailsByPlaceId(placeId!);

                            if (response.result.geometry.isNull) return;

                            controller.value.future.then(
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
                            searchResults.value[index].description ?? 'nothing',
                          ),
                        );
                      },
                    ),
                  );
                })
              : const SizedBox(),
          Expanded(
            child: Center(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    var maxWidth = constraints.biggest.width;
                    var maxHeight = constraints.biggest.height;

                    if (position.value == null) {
                      return const Center(
                          child: CircularProgressIndicator(
                        color: Colors.black,
                      ));
                    }

                    return Stack(
                      children: <Widget>[
                        SizedBox(
                          height: maxHeight,
                          width: maxWidth,
                          child: _buildMap(
                            selectedJamLocationNotifier: position,
                            controllerNotifier: controller,
                            mapStyleNotifier: mapStyle,
                          ),
                        ),
                        _buildLocationMarker(maxHeight, maxWidth),
                        _buildPickLocationButton(
                          context,
                          ref: ref,
                          selectedJamLocationNotifier: position,
                          maxHeight: maxHeight,
                          maxWidth: maxWidth,
                        ),
                        _buildGetCurrentPositionButton(
                          controllerNotifier: controller,
                          ref: ref,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<LatLng> requestLocation(WidgetRef ref) async =>
      (await ref.read(locationServiceProvider).getLocation()).toLatLng();

  Widget _buildPickLocationButton(
    BuildContext context, {
    required WidgetRef ref,
    required ValueNotifier<LatLng?> selectedJamLocationNotifier,
    required double maxHeight,
    required double maxWidth,
  }) {
    return Positioned(
      bottom: 30,
      right: 30,
      child: ElevatedButton(
        onPressed: () async {
          final selectedJamLocation = selectedJamLocationNotifier.value!;

          final placemark = (await geocoding.placemarkFromCoordinates(
            selectedJamLocation.latitude,
            selectedJamLocation.longitude,
          ))
              .firstOrNull;

          final locationName = placemark.isNotNull
              ? '${placemark!.street}, ${placemark.locality}'
              : '';

          final vm = jamModel.isNull
              ? freshJamViewModelStateProvider
              : jamViewModelStateProvider(jamModel!);

          final vmNotifier = ref.read(vm.notifier);

          vmNotifier.updateLocationName(locationName);
          vmNotifier.updateLocation('$selectedJamLocation'.formatCoords());

          context.doIfMounted(() => Navigator.pop(context));
        },
        child: const Text('Pick location'),
      ),
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
      ),
    );
  }

  GoogleMap _buildMap({
    required ValueNotifier<LatLng?> selectedJamLocationNotifier,
    required ValueNotifier<Completer<GoogleMapController>> controllerNotifier,
    required ValueNotifier<String?> mapStyleNotifier,
  }) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: selectedJamLocationNotifier.value!,
        zoom: initZoom,
      ),
      zoomControlsEnabled: false,
      cloudMapId: '5361fdbe18cb28e5',
      onMapCreated: (GoogleMapController controller) {
        controllerNotifier.value.complete(controller);
      },
      onCameraMove: (CameraPosition newPosition) {
        selectedJamLocationNotifier.value = newPosition.target;
      },
    );
  }

  Positioned _buildGetCurrentPositionButton({
    required ValueNotifier<Completer<GoogleMapController>> controllerNotifier,
    required WidgetRef ref,
  }) {
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
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: IconButton(
          onPressed: () async {
            final position = await requestLocation(ref);
            final GoogleMapController controller =
                await controllerNotifier.value.future;
            controller.animateCamera(
              CameraUpdate.newCameraPosition(
                CameraPosition(
                  target: LatLng(position.latitude, position.longitude),
                  zoom: initZoom,
                ),
              ),
            );
          },
          icon: const Icon(Icons.my_location),
        ),
      ),
    );
  }
}
