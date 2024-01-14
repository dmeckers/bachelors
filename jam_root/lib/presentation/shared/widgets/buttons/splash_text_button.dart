import 'package:flutter/material.dart';

class SplashTextButton extends StatelessWidget {
  const SplashTextButton({
    super.key,
    required this.text,
    required this.onTap,
    this.style,
    this.padding,
  });

  final String text;
  final void Function() onTap;
  final TextStyle? style;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: onTap,
        child: Padding(
          padding: padding ?? const EdgeInsets.all(8.0),
          child: Text(text, style: style),
        ),
      ),
    );
  }
}
