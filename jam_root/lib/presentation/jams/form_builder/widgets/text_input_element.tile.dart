import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';

class TextInputElementTile extends HookConsumerWidget {
  const TextInputElementTile(
      {super.key, required this.data, required this.jamModel});

  final JamFormElementData data;
  final JamModel? jamModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final data useState(data);
    final lockIcon =
        data.isRequired ? Icons.error_outline_rounded : Icons.circle_outlined;
    final mandatoryText = data.isRequired ? 'Mandatory' : 'Not mandatory';

    final tController = useTextEditingController();
    final isEditTileMode = useState(false);

    final formsElements = jamModel == null
        ? ref.watch(freshFormElementsProvider)
        : ref.watch(formsElementsProvider(jamModel!.formModel?.elements));

    final notifier = jamModel == null
        ? ref.read(freshFormElementsProvider.notifier)
        : ref.read(
            formsElementsProvider(jamModel!.formModel?.elements).notifier);

    return ExpansionTile(
      key: ValueKey(data.id),
      leading: const Icon(Icons.text_fields_rounded),
      // onTap: () {},
      trailing: const Icon(Icons.more_vert),
      title: Text(data.label ?? 'Text field nr ${data.id + 1}'),
      children: [
        ListTile(
          title: isEditTileMode.value
              ? Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: tController,
                        style: const TextStyle(fontSize: 12),
                        decoration: const InputDecoration(
                          labelText: 'Field name',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        if (tController.text.trim().isEmpty) return;
                        notifier.state = formsElements
                            .map((e) => e.id == data.id
                                ? data.copyWith(label: tController.text)
                                : e)
                            .toList();
                        isEditTileMode.value = false;
                      },
                      icon: Icon(
                        Icons.check,
                        color: Colors.green[400],
                      ),
                    ),
                    IconButton(
                      onPressed: () => isEditTileMode.value = false,
                      icon: Icon(
                        FontAwesomeIcons.xmark,
                        color: Colors.yellow[400],
                      ),
                    )
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton.icon(
                        onPressed: () {
                          // showDialog(
                          //     context: context,
                          //     builder: (ctx) {
                          //       return FixedInputDialog(
                          //         rules: (v) =>
                          //             v.isNotEmpty ? null : 'Field name is required',
                          //         initialValue: data.label,
                          //         onConfirm: (value) async {
                          //           notifier.state = formsElements
                          //               .map((e) => e.id == data.id
                          //                   ? data.copyWith(label: value)
                          //                   : e)
                          //               .toList();
                          //         },
                          //         title: 'What is the name of this field?',
                          //       );
                          //     },
                          //   );
                          isEditTileMode.value = !isEditTileMode.value;
                        },
                        icon: const Icon(Icons.edit),
                        label: const Text(
                          'Edit',
                          style: TextStyle(fontSize: 12),
                        )),
                    TextButton.icon(
                      onPressed: () => notifier.state = formsElements
                          .map((e) => e.id == data.id
                              ? data.copyWith(isRequired: !data.isRequired)
                              : e)
                          .toList(),
                      icon: Icon(
                        lockIcon,
                      ),
                      label: Text(
                        mandatoryText,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () => notifier.state =
                          formsElements.where((e) => e.id != data.id).toList(),
                      icon: const Icon(
                        Icons.remove_circle_outline,
                        color: Colors.red,
                      ),
                      label: const Text(
                        'Remove field',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ],
                ),
        )
      ],
    );
  }
}
