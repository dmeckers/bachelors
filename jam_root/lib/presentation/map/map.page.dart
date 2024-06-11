import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/data/data.dart';

import 'package:jam/presentation/presentation.dart';
import 'package:location/location.dart';

class MapPage extends HookConsumerWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gugu = useState<GoogleMapController?>(null);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const MapPageAppBar(),
      body: Stack(
        children: [
          MapWidget(
            giveMeFuckingController: (ctrl) {
              gugu.value = ctrl;
            },
          ),
          const MapPageSearchResultList(),
          _buildSomething(),
          _buildSomething(isLeft: false),
          _buildGetCurrentPositionButton(ref, gugu.value),
          _buildMapFab(),
        ],
      ),
    );
  }

  _buildMapFab() {
    final legends = JamMarkerType.values
        .map<Widget>(
          (type) =>
              MapLegendItem(text: type.legendText, assetPath: type.assetPath),
        )
        .toList();

    return Positioned(
      bottom: 15,
      right: 15,
      child: SizedBox(
        width: 100,
        height: 100,
        child: ExpandableFab(
          distance: 20,
          children: legends,
        ),
      ),
    );
  }

  Positioned _buildGetCurrentPositionButton(
    WidgetRef ref,
    GoogleMapController? gugu,
  ) =>
      Positioned(
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
              final mapState = ref.read(mapWidgetStateControllerProvider);
              final position = mapState.mapData$?.currentPosition ??
                  (await Location.instance.getLocation()).toLatLng();

              gugu?.animateCamera(
                CameraUpdate.newCameraPosition(
                  CameraPosition(
                    target: position,
                    zoom: 14.4746,
                  ),
                ),
              );
            },
            icon: const Icon(
              Icons.my_location,
              color: Colors.black,
            ),
          ),
        ),
      );

  _buildSomething({bool isLeft = true}) => Positioned(
        bottom: -20,
        left: isLeft ? -10 : null,
        right: isLeft ? null : -10,
        child: Transform.rotate(
          angle: isLeft ? 0.3 : -0.3,
          child: Container(
            width: 150,
            height: 40,
            color: isLeft ? Colors.red : Colors.blue,
          ),
        ),
      );
}
