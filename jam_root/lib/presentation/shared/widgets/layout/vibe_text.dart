import 'package:flutter/material.dart';

import 'package:jam/config/config.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam_theme/jam_theme.dart';
import 'package:jam_utils/jam_utils.dart';

class VText extends StatelessWidget {
  const VText({super.key, required this.vibe});

  final VibeModel vibe;

  @override
  Widget build(BuildContext context) {
    final vibeColor = CHIP_COLORS[vibe.id % CHIP_COLORS.length];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      color: vibeColor,
      child: Text(
        vibe.name.capitalize(),
        style: TextStyle(
          color: Colors.black,
          fontFamily: rubickFamily,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
