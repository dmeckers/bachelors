import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jam/config/config.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_ui/jam_ui.dart';
import 'package:jam_utils/jam_utils.dart';

class ForgotPasswordPage extends HookConsumerWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final forgotPasswordVm = ref.watch(forgotPasswordViewModelProvider);
    final forgotPasswordVmNotifier =
        ref.read(forgotPasswordViewModelProvider.notifier);

    return Scaffold(
      appBar: const SimpleAppBar(title: 'Password Recovery'),
      body: SingleChildScrollView(
        child: Layout(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        ImagePathConstants.RECOVER_PASSWORD_EMAIL_IMAGE_PATH,
                      ),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'Enter your email address and we will send you a link to reset your password.',
                    style: context.jText.bodyMedium,
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: JFormTextInput(
                    inputType: JFormTextInputType.email,
                    labelText: 'Email',
                    leadingIcon: Icons.email,
                    onChange: forgotPasswordVmNotifier.updateEmail,
                    validator: forgotPasswordVm.validator,
                  ),
                ),
                const SizedBox(height: 30),
                const SizedBox(height: 30),
                ButtonWithLoader(
                  size: const Size(200, 50),
                  onPressed: () => _handleSendResetPasswordLink(
                    context,
                    forgotPasswordVm,
                  ),
                  text: 'Send email',
                  withSuccessGradient: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _handleSendResetPasswordLink(
    BuildContext context,
    ForgotPasswordModel viewModel,
  ) async {
    if (!viewModel.isValid()) {
      return;
    }

    try {
      await supabase.auth.resetPasswordForEmail(
        viewModel.email,
        redirectTo: EnvironmentConstants.PASSWORD_RESET_MAGIC_LINK,
      );
    } catch (e) {
      context.doIfMounted(
        () => JSnackBar.show(
          context,
          const JSnackbarData(
            description: 'Failed to send password reset link',
            type: SnackbarInfoType.error,
          ),
        ),
      );
    }

    context.doIfMounted(
      () => JSnackBar.show(
        context,
        const JSnackbarData(
          description: 'Link for password reset sent to your email',
          type: SnackbarInfoType.success,
        ),
      ),
    );
  }
}
