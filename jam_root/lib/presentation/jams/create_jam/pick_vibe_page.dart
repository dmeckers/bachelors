import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jam/data/vibes/powersync_vibes_service.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/generated/l10n.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_theme/jam_theme.dart';
import 'package:jam_ui/jam_ui.dart';

class PickVibePage extends HookConsumerWidget {
  const PickVibePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vibes = ref.watch(getVibesProvider);
    final viewModel = ref.watch(freshJamViewModelStateProvider);

    return Column(
      children: [
        Text(
          S.of(context).daVibez,
          textAlign: TextAlign.right,
          style:
              context.jText.displayMedium?.copyWith(fontFamily: rubickFamily),
        ),
        Text(S.of(context).pickAtLeastOne),
        const SizedBox(height: 20),
        Center(
          child: vibes.maybeWhen(
            data: (data) => SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: Column(
                children: [
                  Padding(
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
                  const Spacer(),
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (ctx, i) {
                        final isSelected =
                            viewModel.relatedVibes.contains(data[i]);
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
                  const SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
            orElse: () => Text(S.of(context).loading),
          ),
        ),
      ],
    );
  }
}
