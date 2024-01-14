import 'package:flutter/material.dart';

class OnlineBubble extends StatelessWidget {
  const OnlineBubble({super.key, this.radius});

  final double? radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (radius ?? 20) * 0.5,
      height: (radius ?? 20) * 0.5,
      decoration: BoxDecoration(
        color: Colors.green,
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white,
          width: (radius ?? 20) / 10,
        ),
      ),
    );
  }
}
