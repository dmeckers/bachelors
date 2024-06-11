import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_google_maps_webservices/places.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_ui/jam_ui.dart';
import 'package:jam_utils/jam_utils.dart';

class MapPageSearchResultList extends ConsumerWidget {
  const MapPageSearchResultList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchedPlaces = ref.watch<List<Prediction>>(
      locations$.select(
        (vm) => vm.maybeWhen(
          orElse: () => const [],
          data: (data) => data.placesSearchResults,
        ),
      ),
    );

    return LayoutBuilder(
      builder: (ctx, constraints) => Container(
        height: min(
          constraints.maxHeight,
          searchedPlaces.length * 62.0,
        ),
        width: 1000,
        color: context.jColor.secondary,
        child: ListView.separated(
          separatorBuilder: (context, index) => const JamDivider(
            color: Colors.black,
          ),
          itemCount: searchedPlaces.length,
          itemBuilder: (context, index) => ListTile(
            onTap: () async {
              final mapWidgetController =
                  ref.read(mapWidgetStateControllerProvider);

              final gmC = ref.read(gmc);
              final placeId = searchedPlaces[index].placeId;

              mapWidgetController.setPlacesSearchResults(const []);

              if (placeId.isEmptyOrNull) return;

              final response =
                  await ref.watch(placesProvider).getDetailsByPlaceId(placeId!);
              final placeGeometry = response.result.geometry;

              if (placeGeometry.isNull) return;

              mapWidgetController.addPlaceSearchResultMarker(
                lat: placeGeometry!.location.lat,
                lon: placeGeometry.location.lng,
                placeName: searchedPlaces[index].description ?? 'nothing',
              );

              gmC?.animateCamera(
                CameraUpdate.newLatLngZoom(
                  LatLng(
                    response.result.geometry!.location.lat,
                    response.result.geometry!.location.lng,
                  ),
                  25,
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
              searchedPlaces[index].description ?? 'nothing',
            ),
          ),
        ),
      ),
    );
  }
}
