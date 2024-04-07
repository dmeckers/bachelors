import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_ui/jam_ui.dart';

class VibeSelectorBottomSheet extends ConsumerWidget {
  const VibeSelectorBottomSheet({super.key, this.jamModel});

  final JamModel? jamModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final relatedVibes = jamModel == null
        ? ref.watch(
            freshJamViewModelStateProvider
                .select((value) => value.relatedVibes),
          )
        : ref.watch(
            jamViewModelStateProvider(jamModel!)
                .select((value) => value.relatedVibes),
          );

    final userVibes = ref.watch(userVibesControllerProvider);

    return Container(
      color: context.jColor.surface,
      height: 300,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.only(left: 28, right: 28, top: 28),
        child: Column(
          children: [
            Text(
              'Select jam vibes',
              style:
                  context.jText.headlineMedium!.copyWith(color: Colors.black),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: userVibes.maybeWhen(
                data: (data) => ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) => Container(
                    color: relatedVibes.contains(data[index])
                        ? context.jColor.primary
                        : context.jColor.onPrimaryContainer,
                    child: ListTile(
                      leading: relatedVibes.contains(data[index])
                          ? const Icon(Icons.check)
                          : const Icon(Icons.add),
                      onTap: () {
                        _handleVibeSelectToggle(
                          relatedVibes,
                          data,
                          index,
                          ref,
                        );
                      },
                      title: Text(data[index].name),
                    ),
                  ),
                ),
                orElse: () => const SizedBox(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleVibeSelectToggle(
    List<VibeModel> relatedVibes,
    List<VibeModel> data,
    int index,
    WidgetRef ref,
  ) {
    if (relatedVibes.contains(data[index])) {
      if (jamModel == null) {
        return ref
            .read(freshJamViewModelStateProvider.notifier)
            .removeRelatedVibes(data[index]);
      }

      return ref
          .read(jamViewModelStateProvider(jamModel!).notifier)
          .removeRelatedVibes(data[index]);
    }

    if (jamModel == null) {
      return ref
          .read(freshJamViewModelStateProvider.notifier)
          .addRelatedVibes(data[index]);
    }

    ref
        .read(jamViewModelStateProvider(jamModel!).notifier)
        .addRelatedVibes(data[index]);
  }
}
