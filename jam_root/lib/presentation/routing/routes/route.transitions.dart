import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:jam_ui/jam_ui.dart';

class GoRouteTransitions {
  static GoRoute getCustomTransition({
    required String path,
    required Widget Function(BuildContext, GoRouterState) pageBuilder,
    required Widget Function(
      BuildContext,
      Animation<double>,
      Animation<double>,
      Widget,
    ) transitionsBuilder,
    int? duration,
    String? name,
  }) {
    return GoRoute(
      path: path,
      name: name,
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        key: state.pageKey,
        transitionDuration: Duration(milliseconds: duration ?? 300),
        child: pageBuilder(context, state),
        transitionsBuilder: transitionsBuilder,
      ),
    );
  }

  static GoRoute holeClipperGoRouterTransition({
    required String path,
    required Widget Function(BuildContext, GoRouterState) pageBuilder,
    String? name,
  }) {
    return getCustomTransition(
      path: path,
      pageBuilder: pageBuilder,
      name: name,
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          ClipPath(
        clipper: HoleClipper(animation),
        child: child,
      ),
    );
  }
}
