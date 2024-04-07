import 'package:flutter/material.dart';

import 'package:jam/config/config.dart';
import 'package:jam/domain/domain.dart';

class JamVibeChips extends StatelessWidget {
  const JamVibeChips({super.key, required this.jam});

  final JamModel jam;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Wrap(
          alignment: WrapAlignment.start,
          spacing: 10,
          children: jam.relatedVibes
              .map(
                (e) => Chip(
                  //todo replace with vibe icon
                  avatar: const CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: Icon(
                      Icons.cookie_outlined,
                      color: Colors.white,
                    ),
                  ),
                  label: Text(e.name),
                  shape: const StadiumBorder(),
                  padding: const EdgeInsets.all(2),
                  backgroundColor: CHIP_COLORS[
                      jam.relatedVibes.indexOf(e) % CHIP_COLORS.length],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
