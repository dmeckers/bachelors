import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_ui/jam_ui.dart';
import 'package:jam_utils/jam_utils.dart';

class MapPageSearchResultList extends ConsumerWidget {
  const MapPageSearchResultList({
    super.key,
    required this.completer,
  });

  final ObjectRef<Completer<GoogleMapController>> completer;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchedPlaces = ref.watch(placesSearchResultsProvider);

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
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () async {
                final placeId = searchedPlaces[index].placeId;

                ref.read(placesSearchResultsProvider.notifier).state = [];

                if (placeId.isEmptyOrNull) return;

                final response = await ref
                    .watch(placesProvider)
                    .getDetailsByPlaceId(placeId!);

                if (response.result.geometry.isNull) return;

                // completer.value.future.then(
                //   (value) => value.animateCamera(
                //     CameraUpdate.newLatLng(
                //       LatLng(
                //         response.result.geometry!.location.lat,
                //         response.result.geometry!.location.lng,
                //       ),
                //     ),
                //   ),
                // );
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
            );
          },
        ),
      ),
    );
  }
}
