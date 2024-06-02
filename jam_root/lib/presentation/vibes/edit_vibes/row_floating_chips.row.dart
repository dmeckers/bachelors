import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class RowFloatingChips extends HookWidget {
  final List chips;
  final double chipWidth;
  final double chipHeight;
  final void Function(dynamic chip)? onChipTap;

  const RowFloatingChips({
    super.key,
    required this.chips,
    this.onChipTap,
    this.chipWidth = 100.0,
    this.chipHeight = 100.0,
  });

  @override
  Widget build(BuildContext context) {
    final controller =
        useAnimationController(duration: const Duration(seconds: 2))
          ..repeat(reverse: true);

    final random = Random();

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(bottom: 20), // Add padding to the bottom
      child: Row(
        children: chips.asMap().entries.map((entry) {
          final chipIndex = entry.key;
          final chip = entry.value;

          final dx =
              chipIndex * chipWidth + random.nextDouble() * (chipWidth - 50);

          return AnimatedBuilder(
            animation: controller,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(dx, (controller.value - 0.5) * 20),
                child: chip,
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
