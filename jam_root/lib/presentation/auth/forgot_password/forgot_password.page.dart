import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:jam/config/config.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_ui/jam_ui.dart';
import 'package:jam_utils/jam_utils.dart';

class ForgotPasswordPage extends HookWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = useState(ForgotPasswordViewModel.generate());

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
                  child: JTextFormInput(
                    viewModel: viewModel.value.emailFormModel,
                  ),
                ),
                const SizedBox(height: 30),
                const SizedBox(height: 30),
                ButtonWithLoader(
                  size: const Size(200, 50),
                  onPressed: () => _handleSendResetPasswordLink(
                    context,
                    viewModel,
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
    ValueNotifier<ForgotPasswordViewModel> viewModel,
  ) async {
    final vm = viewModel.value.emailFormModel;
    if (!vm.isValid) {
      return;
    }

    try {
      await supabase.auth.resetPasswordForEmail(
        vm.controller!.text,
        redirectTo: EnvironmentConstants.PASSWORD_RESET_MAGIC_LINK,
      );
    } catch (e) {
      context.doIfMounted(
        () => JSnackBar.show(
          context,
          description: 'Failed to send password reset link',
          type: SnackbarInfoType.error,
        ),
      );
    }

    context.doIfMounted(
      () => JSnackBar.show(
        context,
        description: 'Link for password reset sent to your email',
        type: SnackbarInfoType.success,
      ),
    );
  }
}
