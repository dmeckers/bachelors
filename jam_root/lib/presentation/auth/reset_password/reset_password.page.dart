import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/data/data.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_theme/jam_theme.dart';
import 'package:jam_ui/jam_ui.dart';

class ResetPasswordPage extends HookConsumerWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = useResetPasswordViewModel();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Reset Password',
                style: context.jText.displayMedium
                    ?.copyWith(fontFamily: rubickFamily),
              ),
              const SizedBox(height: 40),
              JTextFormInput(viewModel: viewModel.passwordFormModel),
              const SizedBox(height: 20),
              JTextFormInput(
                viewModel: viewModel.confirmPasswordFormModel,
                overrideValidate: () =>
                    viewModel.confirmPasswordFormModel.controller!.text ==
                            viewModel.passwordFormModel.controller!.text
                        ? null
                        : 'Passwords do not match',
              ),
              const SizedBox(height: 40),
              ButtonWithLoader(
                text: 'Reset Password',
                size: const Size(200, 50),
                onPressed: () async {
                  final uglyValidate =
                      (viewModel.confirmPasswordFormModel.validate() == null &&
                          viewModel.passwordFormModel.validate() == null);

                  if (!uglyValidate) return;

                  await ref.read(authRepositoryProvider).updateUserPassword(
                        password: viewModel.castToModel().password,
                      );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
