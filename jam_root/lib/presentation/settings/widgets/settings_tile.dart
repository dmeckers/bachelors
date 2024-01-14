import 'package:flutter/material.dart';
import 'package:jam_ui/jam_ui.dart';

class SettingsTile extends StatelessWidget {
  const SettingsTile(
      {super.key,
      this.leading,
      this.child,
      this.trailing,
      this.title,
      this.subtitle,
      this.onTap,
      this.shakable = true,
      this.danger = false});

  final bool shakable;
  final Widget? leading;
  final Widget? child;
  final Widget? trailing;
  final String? title;
  final String? subtitle;
  final VoidCallback? onTap;
  final bool danger;

  @override
  Widget build(BuildContext context) {
    final widget = ListTile(
      leading: leading,
      onTap: onTap,
      trailing: trailing,
      // contentPadding: subtitle == null ? const EdgeInsets.only(top: 5) : null,
      title: Padding(
        padding: subtitle == null
            ? const EdgeInsets.only(top: 10.0)
            : const EdgeInsets.all(0),
        child: Text(
          title ?? '',
          style: context.jText.bodyMedium
              ?.copyWith(color: danger ? Colors.red : null),
        ),
      ),
      subtitle: Text(
        subtitle ?? '',
        style: context.jText.bodySmall
            ?.copyWith(fontSize: 12, color: context.jColor.tertiary),
      ),
    );

    return shakable ? ShakesOnNoLongPress(child: widget) : widget;
  }
}
