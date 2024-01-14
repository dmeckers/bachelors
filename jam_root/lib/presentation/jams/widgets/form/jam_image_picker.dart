import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_ui/jam_ui.dart';
import 'package:jam_utils/jam_utils.dart';

class JamImagePicker extends ConsumerWidget {
  const JamImagePicker({super.key, this.jamModel});

  final JamModel? jamModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final [image as File?, backgroundUrl as String?, dropBackground as bool] =
        jamModel == null
            ? ref.watch(freshJamViewModelStateProvider.select((value) =>
                [value.image, value.backgroundUrl, value.dropBackground]))
            : ref.watch(jamViewModelStateProvider(jamModel!).select((value) =>
                [value.image, value.backgroundUrl, value.dropBackground]));

    final isImageSelected = image?.existsSync() ?? false;
    final hasBackgrounUrl = !backgroundUrl.isEmptyOrNull;

    return ShakesOnNoLongPress(
      child: ListTile(
        tileColor: context.jTheme.cardColor,
        contentPadding: EdgeInsets.zero,
        trailing: isImageSelected || (hasBackgrounUrl && !dropBackground)
            ? IconButton(
                onPressed: () => _handleRemoveImage(ref),
                icon: const Icon(Icons.cancel_outlined),
              )
            : null,
        title: Text(
          isImageSelected || (hasBackgrounUrl && !dropBackground)
              ? 'Changed your mind?'
              : 'Because you can',
          style: context.jText.bodySmall,
        ),
        leading: const Icon(Icons.image),
        onTap: () => showBottomSheet<XFile?>(
          context: context,
          builder: (ctx) => PickImageBottomSheet(
            onImagePicked: (image) => _handleImagePicked(
              image,
              ref,
            ),
          ),
        ),
      ),
    );
  }

  _handleImagePicked(XFile? image, WidgetRef ref) {
    if (jamModel.isNull) {
      return ref
          .read(freshJamViewModelStateProvider.notifier)
          .updateImage(image != null ? File(image.path) : null);
    }

    final notifier = ref.read(jamViewModelStateProvider(jamModel!).notifier);
    notifier.updateImage(image != null ? File(image.path) : null);
  }

  _handleRemoveImage(WidgetRef ref) {
    if (jamModel.isNull) {
      return ref
          .read(freshJamViewModelStateProvider.notifier)
          .updateImage(null);
    }

    final notifier = ref.read(jamViewModelStateProvider(jamModel!).notifier);

    notifier.updateImage(null);
    notifier.updateDropBackground(true);
  }
}
