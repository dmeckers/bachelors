import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jam/application/application.dart';
import 'package:jam/config/config.dart';
import 'package:jam/generated/l10n.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_ui/jam_ui.dart';
import 'package:jam_utils/jam_utils.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key});

  static const GREETINGS_SUBTITLE = [
    'Hang out with right vibes',
    'Welcome to the club',
    'Knock around with those who get you',
    'Find your tribe',
  ];

  static const GREETINGS = [
    'Welcome',
    'Ready to jam?',
    'Dive in',
    'Get started',
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginPageModel = useLoginPageModel();
    final subtitle = useState('');
    final title = useState('');

    ref.listen(
      loginPageControllerProvider,
      (_, state) => state.showSnackBarOnError(context),
    );

    useEffect(() {
      final random = Random();
      subtitle.value = GREETINGS_SUBTITLE[random.nextInt(GREETINGS.length)];
      title.value = GREETINGS[random.nextInt(GREETINGS_SUBTITLE.length)];
      return null;
    }, []);

    return Scaffold(
      body: SingleChildScrollView(
        child: Layout(
          child: Column(
            children: [
              const LoginHero(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.7,
                child: Form(
                  key: loginPageModel.formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        title.value,
                        style: context.jText.displayMedium,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        subtitle.value,
                        style: context.jText.headlineMedium,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 7.0, horizontal: 16),
                        child: JTextFormInput(
                          viewModel: loginPageModel.emailFormModel,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 16),
                        child: JTextFormInput(
                          viewModel: loginPageModel.passwordFormModel,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      _buildButton(context, ref, loginPageModel),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            S.of(context).dontHaveAccount,
                            style: context.jText.bodySmall,
                          ),
                          SplashTextButton(
                            text: S.of(context).createAccount,
                            style: context.jText.headlineSmall,
                            padding: const EdgeInsets.only(left: 5),
                            onTap: () => context.pushNamed(
                              GuestRoutes.register.name,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text(
                        S.of(context).orSignInWith,
                        style: context.jText.bodySmall,
                      ),
                      const SizedBox(height: 10),
                      _buildThirdPartyIconLoginButtons(ref),
                      const Spacer(),
                      SplashTextButton(
                        text: S.of(context).forgotPassword,
                        style: context.jText.headlineLarge,
                        onTap: () =>
                            context.pushNamed(GuestRoutes.forgotPassword.name),
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ButtonWithLoader _buildButton(
    BuildContext context,
    WidgetRef ref,
    LoginPageModel loginPageModel,
  ) {
    return ButtonWithLoader(
      onPressed: () async => await _handlePressLoginButton(
        context,
        ref,
        loginPageModel,
      ),
      size: Size(MediaQuery.of(context).size.width * 0.7, 50),
      withSuccessGradient: true,
      text: S.of(context).login,
    );
  }

  Row _buildThirdPartyIconLoginButtons(WidgetRef ref) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: ThirdPartyProviders.values
          .toList()
          .mapWithIndex(
            (index, provider, position) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: GestureDetector(
                onTap: () => ref
                    .read(loginPageControllerProvider.notifier)
                    .loginWithThirdPartyProvider(provider: provider),
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage(
                    ImagePathConstants.thirdPartyLogos[provider]!,
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  _handlePressLoginButton(
    BuildContext context,
    WidgetRef ref,
    LoginPageModel loginPageModel,
  ) async {
    if (!loginPageModel.validate()) return;

    ref.read(loginPageControllerProvider.notifier).login(
          email: loginPageModel.emailFormModel.controller!.text,
          password: loginPageModel.passwordFormModel.controller!.text,
        );
  }
}
