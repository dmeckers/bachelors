import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/generated/l10n.dart';

import 'package:jam/presentation/presentation.dart';
import 'package:jam_ui/jam_ui.dart';

class BasicInfoStep extends HookConsumerWidget {
  const BasicInfoStep({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final registerModel = ref.watch(registerModelProvider);

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(height: 20),
          JTextFormInput(viewModel: registerModel.fullNameModel),
          const SizedBox(height: 18),
          JTextFormInput(viewModel: registerModel.emailModel),
          const SizedBox(height: 18),
          JTextFormInput(viewModel: registerModel.passwordModel),
          const SizedBox(height: 18),
          JTextFormInput(
            viewModel: registerModel.confirmPasswordModel,
            overrideValidate: () =>
                registerModel.confirmPasswordModel.controller!.text ==
                        registerModel.passwordModel.controller!.text
                    ? null
                    : S.of(context).passwordsDoNotMatch,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
