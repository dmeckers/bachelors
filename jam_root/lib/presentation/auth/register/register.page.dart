import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';

import 'package:jam/presentation/presentation.dart';

class RegisterPage extends ConsumerWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = ref.watch(registerFormPageViewControllerProvider);
    final pages = ref.watch(registerFormPagesProvider);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const SimpleAppBar(title: 'Registration'),
      body: Layout(
        child: Stack(
          children: [
            const FancyCircles(),
            PageView(
              controller: pageController,
              children: pages,
            ),
          ],
        ),
      ),
    );
  }
}
