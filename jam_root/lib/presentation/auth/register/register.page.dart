import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';

import 'package:jam/presentation/presentation.dart';
import 'package:jam_ui/jam_ui.dart';
import 'package:jam_utils/jam_utils.dart';

final registerFormKeyProvider = Provider((ref) => GlobalKey<FormState>());

class RegisterPage extends HookConsumerWidget {
  const RegisterPage({super.key});

  handleRegister(WidgetRef ref, RegisterModel registerModel) {
    if (registerModel.validate()) {
      ref
          .read(registerPageControllerProvider.notifier)
          .register(model: registerModel);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final l10n = S.of(context);
    final stepperCurrentStepState = useState<int>(0);
    final registerModel = ref.watch(registerModelStateNotifierProvider);

    ref.listen(
      registerPageControllerProvider,
      (_, state) => state.showSnackBarOnError(context),
    );

    final isValid = registerModel.validate();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const SimpleAppBar(title: 'Registration'),
      body: Layout(
        child: Stack(
          children: [
            const FancyCircles(),
            Form(
              key: ref.watch(registerFormKeyProvider),
              child: Stepper(
                controlsBuilder:
                    (BuildContext context, ControlsDetails details) {
                  return Row(
                    children: <Widget>[
                      if (stepperCurrentStepState.value != 0)
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: TextButton(
                            onPressed: details.onStepCancel,
                            style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                context.jColor.inversePrimary,
                              ),
                            ),
                            child: const Text('Back'),
                          ),
                        ),
                      if (stepperCurrentStepState.value != 2)
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, top: 10),
                          child: TextButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                context.jColor.inversePrimary,
                              ),
                            ),
                            onPressed: details.onStepContinue,
                            child: const Text('Next'),
                          ),
                        ),
                      if (stepperCurrentStepState.value == 2)
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, top: 10),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: isValid
                                  ? MaterialStatePropertyAll(
                                      context.jColor.inversePrimary,
                                    )
                                  : const MaterialStatePropertyAll(Colors.grey),
                            ),
                            onPressed: () => handleRegister(ref, registerModel),
                            child: const Text('Register'),
                          ),
                        ),
                    ],
                  );
                },
                elevation: 1,
                connectorColor: MaterialStateProperty.all(
                  const Color.fromARGB(255, 78, 146, 75),
                ),
                margin: EdgeInsets.zero,
                type: StepperType.horizontal,
                onStepTapped: (step) => stepperCurrentStepState.value = step,
                currentStep: stepperCurrentStepState.value,
                onStepCancel: () => stepperCurrentStepState.value > 0
                    ? stepperCurrentStepState.value--
                    : null,
                onStepContinue: () => stepperCurrentStepState.value < 2
                    ? stepperCurrentStepState.value++
                    : null,
                steps: [
                  Step(
                    title: Text(
                        stepperCurrentStepState.value == 0 ? 'Basic info' : '',
                        style: context.jText.bodySmall),
                    content: const BasicInfoStep(),
                  ),
                  Step(
                    title: Text(
                        stepperCurrentStepState.value == 1 ? 'Vibes info' : '',
                        style: context.jText.bodySmall),
                    content: const SelectVibe(),
                  ),
                  Step(
                    title: Text(
                      stepperCurrentStepState.value == 2
                          ? 'License agreements'
                          : '',
                      style: context.jText.bodySmall,
                    ),
                    content: const ReadLicenseWidget(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
