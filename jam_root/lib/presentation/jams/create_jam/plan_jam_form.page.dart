import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jam/config/config.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_theme/jam_theme.dart';
import 'package:jam_ui/jam_ui.dart';
import 'package:jam_utils/jam_utils.dart';

class PlanJamFormPage extends HookConsumerWidget {
  const PlanJamFormPage({super.key, this.jam});

  final JamModel? jam;
  static const OPACITY_VISIBLE = 1.0;
  static const OPACITY_INVISIBLE = 0.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showExtraInfo = useState(false);
    final viewModel = jam.isNull
        ? ref.watch(freshJamViewModelStateProvider)
        : ref.watch(jamViewModelStateProvider(jam!));

    final useQrState = useState(false);

    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Text(
                  'JAM PLANNING',
                  textAlign: TextAlign.right,
                  style: context.jText.displayMedium
                      ?.copyWith(fontFamily: rubickFamily),
                ),
                const SizedBox(height: 60),
                _buildSectionTitle('What is the name?'),
                _buildFormInput(
                  viewModel.nameFormModel,
                  leadingIcon: Icons.title,
                ),
                _buildSectionTitle('When will it happen?'),
                JamDatePicker(jamModel: jam),
                const SizedBox(height: 20),
                _buildSectionTitle('Where can i find this?'),
                JamLocationPicker(jamModel: jam),
                const SizedBox(height: 20),
                _buildSectionTitle('How can i join?'),
                ShakesOnNoLongPress(
                  child: ListTile(
                    tileColor: context.jTheme.cardColor,
                    title: Text(
                      viewModel.joinType.title,
                      style: context.jText.bodySmall,
                    ),
                    leading: const Icon(Icons.link),
                    onTap: () => showDialog(
                        context: context,
                        builder: (ctx) => const JamJoinTypePickerDialog()),
                  ),
                ),
                const SizedBox(height: 20),
                if (viewModel.joinType ==
                        JamJoinTypeEnum.freetoJoinAfterFormAndApprove ||
                    viewModel.joinType == JamJoinTypeEnum.freeToJoinAfterForm)
                  _buildSectionTitle('What will be form for registration?'),
                if (viewModel.joinType ==
                        JamJoinTypeEnum.freetoJoinAfterFormAndApprove ||
                    viewModel.joinType == JamJoinTypeEnum.freeToJoinAfterForm)
                  JamFormBuilderTile(
                    jam: jam,
                  ),
                SizedBox(
                  height: 130,
                  child: Stack(
                    children: [
                      _buildWatchingJamJar(),
                      Row(
                        children: [
                          _buildSectionTitle(
                            'Extra information',
                            rightPadding: 20,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: InkWell(
                              onTap: () =>
                                  showExtraInfo.value = !showExtraInfo.value,
                              child: Ink(
                                width: 120,
                                color: Colors.black,
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  showExtraInfo.value
                                      ? 'Show less'
                                      : 'Show more',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: showExtraInfo.value,
                  child: Column(
                    children: [
                      _buildEnableQrs(viewModel, useQrState),
                      _buildFormInputHeading(context, 'Name of the place'),
                      _buildFormInput(viewModel.locationNameFormModel),
                      _buildFormInputHeading(context, 'Extra information'),
                      _buildFormInput(viewModel.extraInformationFormModel),
                      _buildFormInputHeading(context, 'Background image'),
                      JamImagePicker(jamModel: jam),
                    ],
                  ),
                ),
                if (jam.isNotNull)
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: _buildSubmitUpdateButton(viewModel, context, ref),
                  )
                else
                  _buildSubmitButton(viewModel, context, ref),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _buildEnableQrs(
    JamViewModel viewModel,
    ValueNotifier<bool> useQrState,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Row(
        children: [
          const Text(
            'Use QR codes for check-in',
            style: TextStyle(fontSize: 14),
          ),
          const SizedBox(width: 10),
          Switch.adaptive(
            value: useQrState.value,
            onChanged: (v) => useQrState.value = v,
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(
    String title, {
    double leftPadding = 0,
    double topPadding = 0,
    double bottomPadding = 0,
    double rightPadding = 0,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        left: leftPadding,
        top: topPadding,
        bottom: bottomPadding,
        right: rightPadding,
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(title),
      ),
    );
  }

  Widget _buildFormInputHeading(BuildContext context, String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: context.jText.headlineMedium,
      ),
    );
  }

  Widget _buildFormInput(
    JamBaseFormModel model, {
    double topPadding = 15.0,
    double bottomPadding = 25.0,
    IconData? leadingIcon,
  }) {
    return Padding(
      padding: EdgeInsets.only(top: topPadding, bottom: bottomPadding),
      child: JTextFormInput(
        viewModel: model,
        leadingIcon: leadingIcon,
      ),
    );
  }

  ElevatedButton _buildSubmitUpdateButton(
    JamViewModel viewModel,
    BuildContext context,
    WidgetRef ref,
  ) {
    final canSubmit = _canSubmit(viewModel);

    return ElevatedButton(
      onPressed: () {
        if (!canSubmit) return;
        _handleUpdateJam(context, viewModel, ref);
      },
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(
          canSubmit ? Colors.black : Colors.grey,
        ),
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
        ),
      ),
      child: const Text(
        'Update jam details \u{1F525}',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  void _handleUpdateJam(
    BuildContext context,
    JamViewModel viewModel,
    WidgetRef ref,
  ) async {
    final model = viewModel.castToModel();
    await ref.read(updateJamProvider(jam: model).future);
    ref.read(jamsStateProvider).updateJam(model);
    ref.invalidate(jamDetailsStateProvider(model.id!));

    if (!context.mounted) return;
    showDialog(
      context: context,
      builder: (ctx) => OkPopup(
        imagePath: ImagePathConstants.HAPPY_JAM_IMAGE_PATH,
        title: 'Jam updated sucessfully',
        onOkPressed: () => Navigator.of(context).pop(),
      ),
    );
  }

  Positioned _buildWatchingJamJar() {
    return Positioned(
      top: -30,
      right: 80,
      child: Container(
        width: 120,
        height: 120,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.contain,
            image: AssetImage(
              ImagePathConstants.PIPIN_JAM_IMAGE_PATH,
            ),
          ),
        ),
      ),
    );
  }

  String? _canSubmit2(JamViewModel viewModel) {
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

  Widget _buildSubmitButton(
    JamViewModel viewModel,
    BuildContext context,
    WidgetRef ref,
  ) {
    final validationErrors = _canSubmit2(viewModel);
    // final kamoji = badKamojis[viewModel.hashCode % badKamojis.length];
    return ElevatedButton(
      style: ButtonStyle(
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
        ),
        backgroundColor: WidgetStateProperty.all(
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

bool _canSubmit(JamViewModel viewModel) {
  final condition = viewModel.nameFormModel.isValid &&
      viewModel.descriptionFormModel.isValid &&
      viewModel.locationNameFormModel.isValid &&
      viewModel.location.isNotEmpty &&
      viewModel.date != null &&
      viewModel.relatedVibes.isNotEmpty;

  return viewModel.joinType == JamJoinTypeEnum.freeToJoinAfterForm ||
          viewModel.joinType == JamJoinTypeEnum.freetoJoinAfterFormAndApprove
      ? condition && viewModel.formModel != null
      : condition;
}
