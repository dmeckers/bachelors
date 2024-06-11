import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_ui/widgets/jam_text_input_simple.dart';
import 'package:jam_utils/jam_utils.dart';

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
    // final formData = useRef<BaseJamFormModel?>(null);
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final debouncer = useDebouncer(duration: const Duration(milliseconds: 500));
    final formDataState = useState<BaseJamFormModel?>(null);

    ref.listen(getJamFormProvider(jamId: jamId), (prev, next) {
      if (next.hasValue) {
        formDataState.value = next.requireValue;
      }
    });

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const SimpleAppBar(title: 'Jam form'),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: formDataState.value.isNotNull
                  ? Form(
                      key: formKey,
                      child: ListView(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0),
                            child: Text(
                              formDataState.value!.title,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          ...formDataState.value!.elements.map(
                            (e) => switch (e.type) {
                              JamFormElementType.checkboxInput =>
                                const Text('checkbox'),
                              JamFormElementType.dateInput =>
                                const Text('date input'),
                              JamFormElementType.radioInput =>
                                const Text('radio input'),
                              JamFormElementType.textInput => _FormField(
                                  data: e,
                                  onChanged: (v) => debouncer(
                                    () => formDataState.value =
                                        formDataState.value!.copyWith(
                                      elements: [
                                        ...(formDataState.value?.elements.map(
                                              (el) => el.id == e.id
                                                  ? el.copyWith(value: v)
                                                  : el,
                                            ) ??
                                            []),
                                      ],
                                    ),
                                  ),
                                ),
                            },
                          ),
                        ],
                      ),
                    )
                  : const CircularProgressIndicator(),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () async {
                  if (formDataState.value!.elements.any(
                    (e) =>
                        e.isRequired && (e.value == null || e.value!.isEmpty),
                  )) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please fill in all required fields'),
                      ),
                    );
                    return;
                  }

                  final forms = ref.read(jamFormsServiceProvider);

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Submitting form...'),
                    ),
                  );

                  toJoin
                      ? await forms.submitFormAndJoin(
                          jamId: jamId,
                          creatorFcmToken: jamCreatorFcmToken,
                          form: formDataState.value!,
                        )
                      : await forms.submitFormAndSendRequest(
                          jamId: jamId,
                          creatorFcmToken: jamCreatorFcmToken,
                          form: formDataState.value!,
                        );

                  ScaffoldMessenger.maybeOf(context)?.showSnackBar(
                    const SnackBar(
                      content: Text('Form submitted'),
                    ),
                  );

                  context.popIfMounted();

                  // context.doIfMounted(
                  //   () => JSnackBar.show(
                  //     context,
                  //     JSnackbarData(
                  //       title: 'Form submitted',
                  //       type: SnackbarInfoType.success,
                  //       onTap: () => Navigator.of(context).pop(),
                  //     ),
                  //   ),
                  // );
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
