import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jam/config/aliases/models.dart';
import 'package:jam/data/vibes/powersync_vibes_service.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_theme/jam_theme.dart';
import 'package:jam_ui/jam_ui.dart';

class PickVibePage extends HookConsumerWidget {
  const PickVibePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vibes = ref.watch(getVibesProvider);
    final viewModel = ref.watch(freshJamViewModelStateProvider);

    return PopScope(
      onPopInvoked: (_) {
        ref.read(pageListControllerProvider.notifier).reset();
      },
      child: Scaffold(
        body: SafeArea(
            child: Column(
          children: [
            _buildTitle(context),
            const Text('Pick at least one'),
            const SizedBox(height: 20),
            Center(
              child: vibes.maybeWhen(
                data: (data) => SizedBox(
                  height: MediaQuery.of(context).size.height * 0.75,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildTags(viewModel),
                      _buildSelectors(viewModel, data, ref),
                      Flexible(
                        flex: 1,
                        child: _buildButton(ref: ref, viewModel: viewModel),
                      )
                    ],
                  ),
                ),
                orElse: () => const Text('loading'),
              ),
            ),
          ],
        )),
      ),
    );
  }

  ElevatedButton _buildButton({
    required JamViewModel viewModel,
    required WidgetRef ref,
  }) {
    final nothingSelected = viewModel.relatedVibes.isEmpty;
    final buttonText =
        nothingSelected ? 'Pick at least one \u{261D}' : 'Continue \u{1F449}';
    return ElevatedButton(
        onPressed: () {
          if (nothingSelected) return;

          ref
              .read(pageListControllerProvider.notifier)
              .addPage(const PlanJamFormPage());
          ref.read(pageControllerProvider).animateToPage(2,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut);
        },
        child: Text(buttonText));
  }

  _buildSelectors(JamViewModel viewModel, Vibes data, WidgetRef ref) {
    return Flexible(
      flex: 10,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, i) {
                final isSelected = viewModel.relatedVibes.contains(data[i]);
                return VibeContainer(
                  isSelected: isSelected,
                  onTap: () => isSelected
                      ? ref
                          .read(freshJamViewModelStateProvider.notifier)
                          .removeRelatedVibes(data[i])
                      : ref
                          .read(freshJamViewModelStateProvider.notifier)
                          .addRelatedVibes(data[i]),
                  vibe: data[i],
                );
              },
              itemCount: data.length,
            ),
          ),
        ],
      ),
    );
  }

  _buildTags(JamViewModel viewModel) {
    return Flexible(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Wrap(
          children: viewModel.relatedVibes
              .map(
                (e) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: VText(vibe: e),
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  SizedBox _buildTitle(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Text(
        'TOPICS & VIBES',
        textAlign: TextAlign.center,
        style: context.jText.displayMedium?.copyWith(fontFamily: rubickFamily),
      ),
    );
  }
}
