import 'package:flutter/material.dart';
import 'package:jam_ui/jam_ui.dart';

class BoxLayout extends StatelessWidget {
  const BoxLayout({super.key, required this.child, this.backgroundImage});

  final Widget child;
  final String? backgroundImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: context.jTheme.scaffoldBackgroundColor,
        image: backgroundImage != null
            ? DecorationImage(
                image: Image.asset(backgroundImage!).image, fit: BoxFit.cover)
            : null,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: child,
      ),
    );
  }
}
