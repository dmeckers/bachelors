import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/config/constants/image_paths.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';

class JamFormBuilderFab extends ConsumerWidget {
  const JamFormBuilderFab({super.key, required this.jamModel});

  final JamModel? jamModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final notifier = jamModel == null
        ? ref.read(freshFormElementsProvider.notifier)
        : ref.read(
            formsElementsProvider(jamModel!.formModel?.elements).notifier);

    final formsElements = jamModel == null
        ? ref.watch(freshFormElementsProvider)
        : ref.watch(formsElementsProvider(jamModel!.formModel?.elements));

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (child, animation) =>
          FadeTransition(opacity: animation, child: child),
      child: ref.watch(showFormBuilderFabProvider)
          ? ExpandableFab(
              key: expandibleFabKey,
              distance: 20,
              buttonIcon: Icons.build,
              children: [
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (ctx) {
                        return FixedInputDialog(
                          rules: (v) =>
                              v.isNotEmpty ? null : 'Field name is required',
                          onConfirm: (value) async {
                            notifier.state = [
                              ...formsElements,
                              JamFormElementData(
                                id: formsElements.length,
                                type: JamFormElementType.textInput,
                                isRequired: false,
                                label: value,
                                value: null,
                                order: formsElements.length,
                              ),
                            ];
                          },
                          title: 'What is the name of this field?',
                        );
                      },
                    );
                  },
                  child: Row(
                    children: [
                      Container(
                        width: 130,
                        height: 40,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 2),
                          color: Colors.black,
                        ),
                        child: Text(
                          JamFormElementType.textInput.displayText,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Material(
                        shape: const CircleBorder(),
                        clipBehavior: Clip.antiAlias,
                        color: theme.colorScheme.secondary,
                        elevation: 4,
                        child: SizedBox(
                          width: 40,
                          height: 40,
                          child: Image.asset(ImagePathConstants
                              .MAP_USERS_JAM_MARKER_IMAGE_PATH),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          : const SizedBox(),
    );
  }
}
