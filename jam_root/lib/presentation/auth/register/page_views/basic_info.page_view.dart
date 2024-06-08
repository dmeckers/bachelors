import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jam/presentation/presentation.dart';
import 'package:jam_theme/jam_theme.dart';

class BasicInfoStep extends HookConsumerWidget {
  const BasicInfoStep({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final registerModel = ref.watch(registerModelStateNotifierProvider);
    final buttonText = registerModel.canProceedToVibes
        ? 'Select vibes \u{1F449}'
        : 'Theese field should be filled \u{261D}';

    final vmNotifier = ref.read(registerModelStateNotifierProvider.notifier);

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                'Credentials form',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: rubickFamily,
                ),
              ),
            ),
            const SizedBox(height: 20),
            JFormTextInput(
              labelText: 'Name',
              leadingIcon: Icons.person,
              validator: nameValidator,
              onChange: vmNotifier.updateFullName,
            ),
            const SizedBox(height: 18),
            JFormTextInput(
              inputType: JFormTextInputType.email,
              labelText: 'Email',
              leadingIcon: Icons.email,
              validator: emailValidator,
              onChange: vmNotifier.updateEmail,
            ),
            const SizedBox(height: 18),
            JFormTextInput(
              inputType: JFormTextInputType.password,
              onChange: vmNotifier.updatePassword,
              labelText: 'Password',
              leadingIcon: Icons.lock,
              validator: passwordValidator,
            ),
            const SizedBox(height: 18),
            JFormTextInput(
              inputType: JFormTextInputType.password,
              labelText: 'Confirm password',
              leadingIcon: Icons.lock,
              validator: (value) => registerModel.password == value
                  ? null
                  : 'Passwords do not match',
              onChange: vmNotifier.updateFullName,
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 50.0),
              child: ElevatedButton(
                onPressed: () {
                  registerModel.doIfValid(
                    () {
                      ref
                          .read(registerFormPagesProvider.notifier)
                          .addPage(const SelectVibe());

                      ref.read(registerFormPageViewControllerProvider).nextPage(
                            duration: const Duration(milliseconds: 100),
                            curve: Curves.bounceInOut,
                          );
                    },
                  );
                },
                child: Text(buttonText),
              ),
            )
          ],
        ),
      ),
    );
  }
}
