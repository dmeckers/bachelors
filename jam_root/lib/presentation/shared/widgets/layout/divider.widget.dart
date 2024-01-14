import 'package:flutter/material.dart';
import 'package:jam_ui/jam_ui.dart';

class JamDivider extends StatelessWidget {
  const JamDivider({super.key, this.indent, this.endIndent, this.color});

  final double? indent;
  final double? endIndent;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 0.5,
      indent: indent ?? 20,
      endIndent: endIndent ?? 20,
      color: color ?? context.jColor.primary.withOpacity(0.2),
    );
  }
}
