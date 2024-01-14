import 'package:flutter/material.dart';
import 'package:jam_ui/jam_ui.dart';

class Layout extends StatelessWidget {
  const Layout({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            context.jTheme.primaryColor,
            context.jTheme.primaryColor.withOpacity(0.7),
          ],
        ),
      ),
      child: child,
    );
  }
}
