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

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(bottom: 20), // Add padding to the bottom
      child: Row(
        children: chips.asMap().entries.map((entry) {
          final chip = entry.value;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: AnimatedBuilder(
              animation: controller,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0, (controller.value - 0.5) * 10),
                  child: chip,
                );
              },
            ),
          );
        }).toList(),
      ),
    );
  }
}
