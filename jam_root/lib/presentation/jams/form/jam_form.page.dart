import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_ui/widgets/jam_text_input_simple.dart';

class JamFormPage extends HookConsumerWidget {
  const JamFormPage({
    super.key,
    required this.jamId,
    required this.jamCreatorFcmToken,
    this.toJoin = false,
  });

  final String? jamCreatorFcmToken;
  final int jamId;
  final bool toJoin;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formData = useRef<BaseJamFormModel?>(null);
    final formKey = useMemoized(() => GlobalKey<FormState>());

    return Scaffold(
      appBar: const SimpleAppBar(title: 'Jam form'),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ref.watch(getJamFormProvider(jamId: jamId)).when(
                    data: (data) {
                      formData.value = data;
                      return Form(
                        key: formKey,
                        child: ListView(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 20.0),
                              child: Text(
                                data.title,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            ...data.elements.map(
                              (e) => switch (e.type) {
                                JamFormElementType.checkboxInput =>
                                  const Text('checkbox'),
                                JamFormElementType.dateInput =>
                                  const Text('date input'),
                                JamFormElementType.radioInput =>
                                  const Text('radio input'),
                                JamFormElementType.textInput => _FormField(
                                    data: e,
                                    onChanged: (v) => formData.value!.copyWith(
                                      elements: [
                                        ...(formData.value?.elements.map(
                                              (el) => el.id == e.id
                                                  ? el.copyWith(value: v)
                                                  : el,
                                            ) ??
                                            []),
                                      ],
                                    ),
                                  ),
                              },
                            ),
                          ],
                        ),
                      );
                    },
                    error: (e, s) => const JamErrorBox(
                      errorMessage: 'Whoops! Something went wrong.',
                    ),
                    loading: () => const SizedBox(),
                  ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () async {
                  if (!formKey.currentState!.validate()) {
                    return;
                  }

                  formKey.currentState!.save();

                  toJoin
                      ? await ref
                          .read(jamFormsServiceProvider)
                          .submitFormAndJoin(
                            jamId: jamId,
                            creatorFcmToken: jamCreatorFcmToken,
                            form: formData.value!,
                          )
                      : await ref
                          .read(jamFormsServiceProvider)
                          .submitFormAndSendRequest(
                            jamId: jamId,
                            creatorFcmToken: jamCreatorFcmToken,
                            form: formData.value!,
                          );

                  if (!context.mounted) return;

                  Navigator.of(context).pop();

                  JSnackBar.show(
                    context,
                    title: 'Form submitted',
                    type: SnackbarInfoType.success,
                  );
                },
                child: const Text('Submit'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _FormField extends HookConsumerWidget {
  const _FormField({required this.data, required this.onChanged});

  final JamFormElementData data;
  final Function(String value) onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showRequiredError = useState(false);
    final textController = useTextEditingController();

    useEffect(() {
      textController.text = data.value ?? '';
      return null;
    }, const []);

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      child: Column(
        children: [
          JInputSimple(
            controller: textController,
            onChanged: (v) {
              showRequiredError.value = data.isRequired && v.isEmpty;
              onChanged(v);
            },
            labelText: '${data.label}${data.isRequired ? ' (mandatory)' : ''}',
          ),
          if (showRequiredError.value)
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: SizedBox(
                height: 30,
                width: double.infinity,
                child: Text(
                  textAlign: TextAlign.start,
                  'This field is required',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.redAccent,
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
