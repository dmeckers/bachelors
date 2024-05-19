import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_google_maps_webservices/places.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jam/config/config.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/generated/l10n.dart';
import 'package:jam/presentation/map/widgets/widgets.dart';
import 'package:jam/presentation/shared/widgets/layout/divider.widget.dart';
import 'package:jam_ui/jam_ui.dart';
import 'package:jam_utils/jam_utils.dart';

final placesProvider = Provider<GoogleMapsPlaces>((ref) {
  return GoogleMapsPlaces(
      apiKey: dotenv.env[EnvironmentConstants.GOOGLE_MAPS_PLACES_API_KEY]);
});

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
        final loadedMapStyle =
            await rootBundle.loadString(EnvironmentConstants.MAP_STYLE_PATH);

        if (initialPosition != null) {
          mapStyle.value = loadedMapStyle;
          position.value = initialPosition;
          return;
        }

        final currentPosition = await _determinePosition();
        mapStyle.value = loadedMapStyle;
        position.value =
            LatLng(currentPosition.latitude, currentPosition.longitude);
      }

      fetchInitialPosition();
      return null;
    }, []);

    final places = ref.watch(placesProvider);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: context.jColor.secondary,
      appBar: AppBar(
        title: Text(
          'Set jam location',
          style: context.jText.bodyMedium,
        ),
        bottom: MapPlaceTopSearchBar(
          positionNotifier: position,
          searchResultsNotifier: searchResults,
          showResultsNotifier: showResults,
        ),
      ),
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
                            positionNotifier: position,
                            controllerNotifier: controller,
                            mapStyleNotifier: mapStyle,
                          ),
                        ),
                        _buildLocationMarker(maxHeight, maxWidth),
                        _buildPickLocationButton(
                          context,
                          ref: ref,
                          positionNotifier: position,
                          maxHeight: maxHeight,
                          maxWidth: maxWidth,
                        ),
                        _buildGetCurrentPositionButton(
                          controllerNotifier: controller,
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

  Widget _buildPickLocationButton(
    BuildContext context, {
    required WidgetRef ref,
    required ValueNotifier<LatLng?> positionNotifier,
    required double maxHeight,
    required double maxWidth,
  }) {
    return Positioned(
      bottom: 30,
      right: 30,
      child: ElevatedButton(
        onPressed: () {
          jamModel == null
              ? ref
                  .read(freshJamViewModelStateProvider.notifier)
                  .updateLocation('${positionNotifier.value}'.formatCoords())
              : ref
                  .read(jamViewModelStateProvider(jamModel!).notifier)
                  .updateLocation('${positionNotifier.value}'.formatCoords());
          Navigator.pop(context);
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
    required ValueNotifier<LatLng?> positionNotifier,
    required ValueNotifier<Completer<GoogleMapController>> controllerNotifier,
    required ValueNotifier<String?> mapStyleNotifier,
  }) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: positionNotifier.value!,
        zoom: initZoom,
      ),
      zoomControlsEnabled: false,
      cloudMapId: '5361fdbe18cb28e5',
      onMapCreated: (GoogleMapController controller) {
        controllerNotifier.value.complete(controller);
        // controller.setMapStyle(mapStyleNotifier.value!);
      },
      onCameraMove: (CameraPosition newPosition) {
        positionNotifier.value = newPosition.target;
      },
    );
  }

  Positioned _buildGetCurrentPositionButton({
    required ValueNotifier<Completer<GoogleMapController>> controllerNotifier,
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
            final position = await _determinePosition();
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
