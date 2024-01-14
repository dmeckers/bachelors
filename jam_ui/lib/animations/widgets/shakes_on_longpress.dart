import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ShakesOnNoLongPress extends HookWidget {
  const ShakesOnNoLongPress({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final animationController =
        useAnimationController(duration: const Duration(milliseconds: 100));
    final animation =
        Tween<double>(begin: 0, end: 1).animate(animationController);

    startAnimation() {
      HapticFeedback.vibrate();
      animationController.reset();
      animationController.repeat(reverse: true);
      Future.delayed(
        const Duration(milliseconds: 300),
        () => animationController.stop(),
      );
    }

    return GestureDetector(
      onLongPress: startAnimation,
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, _) => Transform.translate(
          offset: Offset(animation.value * 1, 0),
          child: child,
        ),
      ),
    );
  }
}
