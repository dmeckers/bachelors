import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_ui/jam_ui.dart';
import 'package:jam_utils/jam_utils.dart';

class JamFormBuilderTile extends ConsumerWidget {
  const JamFormBuilderTile({super.key, this.jam});

  final JamModel? jam;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = jam.isNull
        ? ref.watch(freshJamViewModelStateProvider)
        : ref.watch(jamViewModelStateProvider(jam!));

    final notifier = jam == null
        ? ref.read(freshFormElementsProvider.notifier)
        : ref.read(formsElementsProvider(jam!.formModel?.elements).notifier);

    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
        bottom: 20,
        right: 20,
      ),
      child: ShakesOnNoLongPress(
        child: ListTile(
          tileColor: context.jTheme.cardColor,
          title: Text(
            viewModel.formModel != null &&
                    viewModel.formModel!.elements.isNotEmpty
                ? 'Edit registration form'
                : 'Create a registration form',
            style: context.jText.bodySmall,
          ),
          trailing: viewModel.formModel != null &&
                  viewModel.formModel!.elements.isNotEmpty
              ? IconButton(
                  onPressed: () => showDialog(
                      context: context,
                      builder: (ctx) {
                        return DestructiveDialog(
                          onConfirm: (confirm) {
                            if (jam == null) {
                              ref
                                  .read(freshJamViewModelStateProvider.notifier)
                                  .updateFormModel(
                                    viewModel.formModel?.copyWith(elements: []),
                                  );
                            }
                            if (jam != null) {
                              ref
                                  .read(
                                      jamViewModelStateProvider(jam!).notifier)
                                  .updateFormModel(
                                    viewModel.formModel?.copyWith(elements: []),
                                  );
                            }
                            notifier.state = [];
                          },
                          title: 'Delete form',
                          subtitle:
                              'Are you sure you want to delete this form?',
                        );
                      }),
                  icon: const Icon(Icons.delete),
                )
              : null,
          leading: const Icon(Icons.quiz_outlined),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const JamFormBuilderPage(),
            ),
          ),
        ),
      ),
    );
  }
}
