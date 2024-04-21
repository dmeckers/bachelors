import 'package:flutter/material.dart';
import 'package:jam_ui/jam_ui.dart';

class FancyCircles extends StatelessWidget {
  const FancyCircles({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      bottom: 0,
      child: SizedBox(
        width: 200,
        height: 200,
        child: Stack(
          children: [
            Positioned(
              right: 0,
              bottom: -100,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: context.jTheme.primaryColorDark.withOpacity(0.5),
                ),
              ),
            ),
            Positioned(
              right: -80,
              bottom: -20,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: context.jTheme.primaryColorLight.withOpacity(0.5),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
