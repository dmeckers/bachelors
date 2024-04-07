import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:jam/presentation/routing/routing.dart';
import 'package:jam/presentation/shared/shared.dart';
import 'package:jam_ui/jam_ui.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key, required this.state});

  final GoRouterState state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "${state.uri} does not exists",
              style: TextStyle(color: context.jColor.error),
            ),
            const SizedBox(height: 20),
            ButtonWithLoader(
              text: 'Go to home',
              onPressed: () => context.goNamed(HomeRoutes.home.name),
            )
          ],
        ),
      ),
    );
  }
}
