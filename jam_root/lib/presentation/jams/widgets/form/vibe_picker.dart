import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jam/domain/jams/jam.model.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_ui/jam_ui.dart';
import 'package:jam_utils/jam_utils.dart';

class VibePickerWidget extends ConsumerWidget {
  const VibePickerWidget({super.key, this.jamModel});

  final JamModel? jamModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = jamModel == null
        ? ref.watch(freshJamViewModelStateProvider)
        : ref.watch(jamViewModelStateProvider(jamModel!));

    final vibes = ref.watch(userVibesControllerProvider);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: viewModel.image?.existsSync() ?? false ? 200 : 100,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: viewModel.image?.existsSync() ?? false
            ? DecorationImage(
                image: FileImage(viewModel.image!),
                fit: BoxFit.cover,
              )
            : null,
      ),
      child: Stack(children: [
        Positioned(
          right: 10,
          top: 0,
          child: AnimatedOpacity(
            opacity: viewModel.image?.existsSync() ?? false ? 1 : 0,
            duration: const Duration(milliseconds: 300),
            child: IconButton(
              icon: const CircleAvatar(
                radius: 15,
                child: Icon(size: 20, Icons.close_rounded, color: Colors.black),
              ),
              onPressed: () => ref
                  .read(freshJamViewModelStateProvider.notifier)
                  .updateImage(null),
            ),
          ),
        ),
        AnimatedPositioned(
          duration: const Duration(milliseconds: 300),
          left: viewModel.image?.existsSync() ?? false
              ? 10
              : MediaQuery.of(context).size.width / 2 - 36,
          top: viewModel.image?.existsSync() ?? false ? 60 : 20,
          child: GestureDetector(
            onTap: () => showModalBottomSheet(
              context: context,
              builder: (context) => const VibeSelectorBottomSheet(),
            ),
            child: CircleAvatar(
              radius: 30,
              backgroundColor: context.jColor.primary,
              child: const Icon(
                Icons.music_note,
                size: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
        AnimatedPositioned(
          duration: const Duration(milliseconds: 300),
          top: viewModel.image?.existsSync() ?? false ? 80 : 85,
          left: viewModel.image?.existsSync() ?? false
              ? 80
              : MediaQuery.of(context).size.width / 4,
          child: vibes.maybeWhen(
            data: (data) => Text(
              _getJamTitle(viewModel, data),
              style: context.jText.headlineSmall,
            ),
            orElse: () => const SizedBox(),
          ),
        ),
      ]),
    );
  }

  String _getJamTitle(JamViewModel viewModel, VibesCollection data) => viewModel
          .relatedVibes.isEmpty
      ? 'Select vibe describing your jam'
      : "${viewModel.relatedVibes.mapWithIndex((i, e, p) => p == ItemPositionInList.first ? e.name : e.name.toLowerCase()).join(' ,')} vibe${viewModel.relatedVibes.length > 1 ? 's' : ''} jam";
}
