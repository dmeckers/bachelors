import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_ui/jam_ui.dart';
import 'package:jam_utils/jam_utils.dart';

class JamLocationPicker extends ConsumerWidget {
  const JamLocationPicker({super.key, this.jamModel});

  final JamModel? jamModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = jamModel == null
        ? ref.watch(freshJamViewModelStateProvider)
        : ref.watch(jamViewModelStateProvider(jamModel!));

    final coords = viewModel.location.isNotEmpty
        ? viewModel.location.extractCords()
        : null;

    return ShakesOnNoLongPress(
      child: ListTile(
        tileColor: context.jTheme.cardColor,
        title: Text(
            coords.isNull
                ? 'Select location here'
                : 'Lat: ${coords!.lat}\nLng: ${coords.lon}',
            style: context.jText.bodySmall),
        leading: const Icon(Icons.location_on),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PickLocationPage(
              initialPosition: viewModel.location.isNotEmpty
                  ? LatLng(coords!.lat, coords.lon)
                  : null,
              jamModel: jamModel,
            ),
          ),
        ),
      ),
    );
  }
}
