import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';

final class CreateJamPage extends ConsumerWidget {
  const CreateJamPage({super.key, this.position});

  final LatLng? position;

  _setInitialPositionIfHasOne(WidgetRef ref, JamViewModel viewModel) {
    if (position == null) return;

    final formatted = 'Lat: ${position!.latitude}, Lng: ${position!.longitude}';

    if (viewModel.location == formatted) return;

    ref.read(freshJamViewModelStateProvider.notifier).updateLocation(formatted);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(freshJamViewModelStateProvider);
    final pages = ref.watch(pageListControllerProvider);
    final pageController = ref.watch(pageControllerProvider);

    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _setInitialPositionIfHasOne(ref, viewModel),
    );

    return Scaffold(
      appBar: const SimpleAppBar(title: 'New jam'),
      body: Stack(
        children: [
          AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: viewModel.image?.existsSync() ?? false ? 1 : 0,
            child: Container(
              decoration: BoxDecoration(
                image: viewModel.image?.existsSync() ?? false
                    ? DecorationImage(
                        opacity: 0.1,
                        image: FileImage(viewModel.image!),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
            ),
          ),
          PageView(
            controller: pageController,
            children: pages,
          ),
        ],
      ),
    );
  }
}
