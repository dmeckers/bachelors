import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jam/config/config.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';

final class CreateJamPage extends ConsumerWidget {
  const CreateJamPage({super.key, this.position});

  final LatLng? position;

  String? _canSubmit(JamViewModel viewModel) {
    final isFilled = viewModel.nameFormModel.isValid &&
        viewModel.descriptionFormModel.isValid &&
        viewModel.locationNameFormModel.isValid &&
        viewModel.location.isNotEmpty &&
        viewModel.date != null;

    final formValidation = viewModel.joinType.isWithForm
        ? viewModel.formModel != null &&
            viewModel.formModel!.elements.isNotEmpty
        : true;

    if (!isFilled) {
      return 'Mandatory fields are unfilled';
    }

    if (!formValidation) {
      return 'No registration form created';
    }

    if (viewModel.relatedVibes.isEmpty) {
      return 'No related vibes selected';
    }

    return null;
  }

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
      appBar: const SimpleAppBar(title: ''),
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
          Column(
            children: [
              Expanded(
                child: PageView(
                  controller: pageController,
                  children: pages,
                ),
              ),
              _buildSubmitButton(viewModel, context, ref),
              const SizedBox(height: 30),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSubmitButton(
    JamViewModel viewModel,
    BuildContext context,
    WidgetRef ref,
  ) {
    final validationErrors = _canSubmit(viewModel);
    // final kamoji = badKamojis[viewModel.hashCode % badKamojis.length];
    return ElevatedButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
        ),
        backgroundColor: MaterialStateProperty.all(
          validationErrors == null ? Colors.black : Colors.grey,
        ),
      ),
      onPressed: () => _handleSubmitJam(
        context,
        viewModel,
        ref,
        validationErrors == null,
      ),
      child: Text(
        validationErrors ?? 'Let\'s jam \u{1F525}',
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  static const badKamojis = [
    '(」°ロ°)」',
    '(ノ°益°)ノ',
    '(╥﹏╥)',
    '¯\\_(ツ)_/¯',
    'ლ(ಠ_ಠ ლ)',
  ];

  _handleSubmitJam(
    BuildContext context,
    JamViewModel viewModel,
    WidgetRef ref,
    bool canSubmit,
  ) async {
    if (!canSubmit) return;

    await ref.read(
      createJamProvider(jam: viewModel.castToModel().backfilled).future,
    );

    await ref.read(jamsStateProvider).refetch();

    if (!context.mounted) return;

    showDialog(
      context: context,
      builder: (ctx) => OkPopup(
        imagePath: ImagePathConstants.HAPPY_JAM_IMAGE_PATH,
        title: 'Jam created',
        onOkPressed: () => Navigator.of(context).pop(),
      ),
    );
  }
}
