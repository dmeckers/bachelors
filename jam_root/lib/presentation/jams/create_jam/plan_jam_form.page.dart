import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jam/config/config.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/jams/state/jams_state.dart';
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

    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              Text(
                'JAM PLANNING',
                textAlign: TextAlign.right,
                style: context.jText.displayMedium
                    ?.copyWith(fontFamily: rubickFamily),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              _buildSectionTitle('When will it happen?'),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 20, right: 20),
                child: JamDatePicker(jamModel: jam),
              ),
              _buildSectionTitle(
                'Where can i find this?',
                topPadding: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 20, right: 20),
                child: JamLocationPicker(jamModel: jam),
              ),
              _buildSectionTitle(
                'How can i join?',
                bottomPadding: 20,
                topPadding: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                  bottom: 20,
                  right: 20,
                ),
                child: ShakesOnNoLongPress(
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
              ),
              if (viewModel.joinType ==
                      JamJoinTypeEnum.freetoJoinAfterFormAndApprove ||
                  viewModel.joinType == JamJoinTypeEnum.freeToJoinAfterForm)
                _buildSectionTitle(
                  'What will be form for registration?',
                  bottomPadding: 20,
                ),
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
                          'Add some extra info?',
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
                                showExtraInfo.value ? 'Nah' : 'Yes please!',
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
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 28.0,
                    left: 38,
                    right: 38,
                    bottom: 10,
                  ),
                  child: Column(
                    children: [
                      _buildFormInputHeading(context, 'You can give it a name'),
                      _buildFormInput(viewModel.nameFormModel),
                      _buildFormInputHeading(context, 'Or name the the spot'),
                      _buildFormInput(viewModel.locationNameFormModel),
                      _buildFormInputHeading(context, 'Perhaps some comments?'),
                      _buildFormInput(viewModel.extraInformationFormModel),
                      _buildFormInputHeading(context, 'Background image'),
                      JamImagePicker(jamModel: jam),
                    ],
                  ),
                ),
              ),
              if (jam.isNotNull)
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: _buildSubmitUpdateButton(viewModel, context, ref),
                )
            ],
          ),
        )
      ],
    );
  }

  Widget _buildSectionTitle(
    String title, {
    double leftPadding = 38.0,
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
  }) {
    return Padding(
      padding: EdgeInsets.only(top: topPadding, bottom: bottomPadding),
      child: JTextFormInput(viewModel: model),
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
        backgroundColor: MaterialStateProperty.all(
          canSubmit ? Colors.black : Colors.grey,
        ),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
        ),
      ),
      child: const Text(
        '٩( ᐛ )و Update jam details',
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
      top: -32,
      right: 50,
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
