import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_utils/jam_utils.dart';

enum JamFormElementType {
  dateInput,
  radioInput,
  checkboxInput,
  textInput;

  String get displayText {
    return switch (this) {
      JamFormElementType.dateInput => 'Date input',
      JamFormElementType.radioInput => 'Radio input',
      JamFormElementType.checkboxInput => 'Checkbox input',
      JamFormElementType.textInput => 'Text input',
    };
  }
}

final freshFormElementsProvider =
    StateProvider<List<JamFormElementData>>((ref) => []);

final formsElementsProvider =
    StateProvider.family<List<JamFormElementData>, List<JamFormElementData>?>(
        (ref, formElements) => formElements ?? []);

final showFormBuilderFabProvider = StateProvider<bool>((ref) => true);
final formformTitle = StateProvider.family<String, String?>(
    (ref, defaultTitle) => defaultTitle ?? 'Registration form');

class JamFormBuilderPage extends HookConsumerWidget {
  const JamFormBuilderPage({super.key, this.jamModel});

  final JamModel? jamModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final toCreate = jamModel.isNull;

    final formElements = jamModel.isNull
        ? ref.watch(freshFormElementsProvider)
        : ref.watch(formsElementsProvider(jamModel!.formModel?.elements));

    final formTitle = jamModel.isNull
        ? ref.watch(formformTitle('Registration form'))
        : ref.watch(formformTitle(jamModel!.formModel!.title));

    return Scaffold(
      appBar: const SimpleAppBar(
        title: 'Form builder',
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: TextInputWithCursor(
              initialValue: 'Registration form',
              onChanged: (v) => ref
                  .read(formformTitle(toCreate
                          ? 'Registration form'
                          : jamModel!.formModel!.title)
                      .notifier)
                  .state = v,
            ),
          ),
          Expanded(
            child: ReorderableListView.builder(
              itemBuilder: (ctx, i) {
                return ReorderableDelayedDragStartListener(
                  index: i,
                  key: ValueKey(formElements[i].id),
                  child: switch (formElements[i].type) {
                    JamFormElementType.checkboxInput => const Text('checkbox'),
                    JamFormElementType.dateInput => const Text('date input'),
                    JamFormElementType.radioInput => const Text('radio input'),
                    JamFormElementType.textInput => TextInputElementTile(
                        data: formElements[i],
                        jamModel: jamModel,
                      ),
                  },
                );
              },
              itemCount: formElements.length,
              onReorder: (oldIndex, newIndex) {
                if (oldIndex < newIndex) {
                  newIndex -= 1;
                }
                final JamFormElementData item = formElements.removeAt(oldIndex);
                formElements.insert(newIndex, item);
              },
            ),
          ),
          if (formElements.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.yellow),
                ),
                child: const Text(
                  'Preview form',
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => JamFormPreviewPage(
                      jamModel: jamModel,
                    ),
                  ),
                ),
              ),
            ),
          if (formElements.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                ),
                child: Text(
                  toCreate ? 'Save form' : 'Update form',
                  style: const TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  final formModel = JamJoinRequestModel(
                    elements: formElements,
                    title: formTitle,
                  );

                  if (toCreate) {
                    ref
                        .read(freshJamViewModelStateProvider.notifier)
                        .updateFormModel(formModel);
                  }

                  if (!toCreate) {
                    ref
                        .read(jamViewModelStateProvider(jamModel!).notifier)
                        .updateFormModel(formModel);

                    ref.read(jamRepositoryProvider).updateJamForm(
                          jamId: jamModel!.id!,
                          form: formModel,
                        );
                  }
                  JSnackBar.show(context, description: 'Form updated');
                  context.pop();
                },
              ),
            ),
        ],
      ),
      floatingActionButton: JamFormBuilderFab(
        jamModel: jamModel,
      ),
    );
  }
}
