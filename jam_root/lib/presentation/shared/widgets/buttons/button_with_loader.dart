import 'package:flutter/material.dart';

import 'package:jam_ui/jam_ui.dart';

class ButtonWithLoader extends StatefulWidget {
  const ButtonWithLoader({
    super.key,
    required this.text,
    required this.onPressed,
    this.size,
    this.elevation,
    this.color,
    this.textStyle,
    this.gradient,
    this.withSuccessGradient,
  });

  final String text;
  final dynamic Function() onPressed;
  final Size? size;
  final double? elevation;
  final Color? color;
  final TextStyle? textStyle;
  final Gradient? gradient;
  final bool? withSuccessGradient;

  @override
  State<ButtonWithLoader> createState() => _ButtonWithLoaderState();
}

class _ButtonWithLoaderState extends State<ButtonWithLoader> {
  bool loading = false;

  final successGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    transform: const GradientRotation(2.35619),
    colors: [
      Colors.green.shade900,
      Colors.green.shade700,
    ],
  );

  @override
  Widget build(BuildContext context) {
    onPressed() async {
      if (loading) return;
      setState(() => loading = true);
      try {
        await widget.onPressed();
      } finally {
        if (mounted) setState(() => loading = false);
      }
    }

    return widget.gradient != null || widget.withSuccessGradient == true
        ? SizedBox(
            height: widget.size?.height ?? 50,
            width: widget.size?.width ?? 150,
            child: Material(
              borderRadius: BorderRadius.circular(26),
              elevation: widget.elevation ?? 5,
              child: GestureDetector(
                onTap: onPressed,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: widget.gradient ?? successGradient,
                    borderRadius: BorderRadius.circular(26),
                  ),
                  child: Center(
                    child: loading
                        ? const CircularProgressIndicator.adaptive()
                        : Text(
                            widget.text,
                            style: widget.textStyle ??
                                context.jText.bodyMedium
                                    ?.copyWith(fontWeight: FontWeight.bold),
                            maxLines: 1,
                          ),
                  ),
                ),
              ),
            ),
          )
        : SizedBox(
            height: widget.size?.height ?? 50,
            width: widget.size?.width ?? 150,
            child: ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(26),
                ),
                backgroundColor: widget.color ?? context.jColor.secondary,
                shadowColor: context.jColor.shadow,
                foregroundColor: widget.color ?? context.jColor.onSecondary,
                elevation: widget.elevation ?? 5,
              ),
              child: loading
                  ? const CircularProgressIndicator.adaptive()
                  : Text(
                      widget.text,
                      style: widget.textStyle ??
                          context.jText.bodyMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                      maxLines: 1,
                    ),
            ),
          );
  }
}
