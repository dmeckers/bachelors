import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:jam/config/config.dart';
import 'package:jam/generated/l10n.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_ui/jam_ui.dart';

class ForgotPasswordPage extends HookWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = useState(ForgotPasswordViewModel.generate());

    return Scaffold(
      appBar: SimpleAppBar(title: S.of(context).passwordRecovery),
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
                    S.of(context).enterYourEmailAddressAndWeWillSendYouA,
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
                  text: S.of(context).sendEmail,
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
  ) {
    if (!viewModel.value.emailFormModel.isValid) {
      return;
    }
    JSnackBar.show(
      context,
      description: S.of(context).LinkPassResetSentYourEmail,
      type: SnackbarInfoType.success,
    );
  }
}
