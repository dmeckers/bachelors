import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/generated/l10n.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';

import 'package:jam/domain/domain.dart';
import 'package:jam_ui/jam_ui.dart';
import 'package:jam_utils/jam_utils.dart';

class JamDatePicker extends ConsumerWidget {
  const JamDatePicker({super.key, this.jamModel});

  final JamModel? jamModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = jamModel == null
        ? ref.watch(freshJamViewModelStateProvider)
        : ref.watch(jamViewModelStateProvider(jamModel!));

    return ShakesOnNoLongPress(
      child: ListTile(
        tileColor: context.jTheme.cardColor,
        title: Text(
          viewModel.date == null
              ? S.of(context).selectDateHere
              : viewModel.date!.format(S.of(context).ddmmyyyyHhmm),
          style: context.jText.bodySmall,
        ),
        leading: const Icon(Icons.calendar_today),
        onTap: () async {
          final dateTime = await showOmniDateTimePicker(
            context: context,
            initialDate: viewModel.date == null
                ? DateTime.now().add(
                    const Duration(days: 1),
                  )
                : viewModel.date!,
            firstDate: DateTime.now().add(const Duration(days: 1)),
            lastDate: DateTime.now().add(const Duration(days: 366)),
            isShowSeconds: false,
            borderRadius: const BorderRadius.all(Radius.circular(0)),
            constraints: const BoxConstraints(
              maxHeight: 650,
              maxWidth: 350,
            ),
          );

          _handleUpdateDate(dateTime, ref);
        },
      ),
    );
  }

  _handleUpdateDate(DateTime? dateTime, WidgetRef ref) {
    if (dateTime == null) return;

    jamModel == null
        ? ref.read(freshJamViewModelStateProvider.notifier).updateDate(dateTime)
        : ref
            .read(jamViewModelStateProvider(jamModel!).notifier)
            .updateDate(dateTime);
  }
}
