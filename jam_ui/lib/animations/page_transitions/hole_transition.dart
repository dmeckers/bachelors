import 'dart:ui';

import 'package:flutter/material.dart';

class HoleMaterialPageRoute extends MaterialPageRoute {
  HoleMaterialPageRoute({required super.builder});

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return ClipPath(
      clipper: HoleClipper(animation),
      child: child,
    );
  }
}

class HoleClipper extends CustomClipper<Path> {
  HoleClipper(this.animation);

  final Animation<double> animation;
  late final curve = CurvedAnimation(
    parent: animation,
    curve: Curves.easeOut,
    reverseCurve: Curves.easeIn,
  );

  @override
  Path getClip(Size size) {
    final center = size.center(Offset(size.width, size.height));
    final radius = lerpDouble(0, center.distance, curve.value)!;
    final oval = Rect.fromCircle(center: center, radius: radius);
    return Path()..addOval(oval);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
