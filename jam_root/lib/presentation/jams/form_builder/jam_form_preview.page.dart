import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_ui/widgets/widgets.dart';
import 'package:jam_utils/jam_utils.dart';

class JamFormPreviewPage extends ConsumerWidget {
  const JamFormPreviewPage({super.key, required this.jamModel});

  final JamModel? jamModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formElements = jamModel == null
        ? ref.watch(freshFormElementsProvider)
        : ref.watch(formsElementsProvider(jamModel!.formModel?.elements));
    final formTitle = jamModel == null
        ? ref.watch(formformTitle('Registration form'))
        : ref.watch(formformTitle(jamModel!.formModel!.title));

    return Scaffold(
      appBar: const SimpleAppBar(
        title: 'Form preview',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(formTitle),
                ...formElements.map(
                  (e) => switch (e.type) {
                    JamFormElementType.checkboxInput => const Text('checkbox'),
                    JamFormElementType.dateInput => const Text('date input'),
                    JamFormElementType.radioInput => const Text('radio input'),
                    JamFormElementType.textInput => _FormField(data: e),
                  },
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () => context.pop(),
                child: const Text('Go back to the builder'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _FormField extends HookConsumerWidget {
  const _FormField({required this.data});

  final JamFormElementData data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      child: JInputSimple(
        labelText:
            '${data.label?.capitalize()}${data.isRequired ? ' (mandatory)' : ''}',
      ),
    );
  }
}
