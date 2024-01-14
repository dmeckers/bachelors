import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class FloatingPadding extends HookWidget {
  const FloatingPadding({
    super.key,
    required this.child,
    this.duration,
    this.isRight,
    this.isLeft,
    this.isTop,
    this.isBottom,
    this.offset,
  });

  final bool? isRight;
  final bool? isLeft;
  final bool? isTop;
  final bool? isBottom;
  final double? offset;

  final Widget child;
  final Duration? duration;

  @override
  Widget build(BuildContext context) {
    final animationController = useAnimationController(
        duration: duration ?? const Duration(seconds: 2));

    final animateOffset = useAnimation(
        Tween(begin: 0.0, end: offset ?? 50.0).animate(animationController));

    return AnimatedBuilder(
      animation: animationController,
      builder: (context, _) {
        return Padding(
          padding: EdgeInsets.only(
            left: (isLeft ?? false) ? animateOffset : 0,
            right: (isRight ?? false) ? animateOffset : 0,
            bottom: (isBottom ?? false) ? animateOffset : 0,
            top: (isTop ?? false) ? animateOffset : 0,
          ),
          child: child,
        );
      },
    );
  }
}
