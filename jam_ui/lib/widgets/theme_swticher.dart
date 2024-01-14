import 'package:flutter/material.dart';
import 'package:jam_theme/jam_theme.dart';

class ThemeSwitcher extends InheritedWidget {
  const ThemeSwitcher({super.key, required this.data, required super.child});

  final ThemeSwitcherWidgetState data;

  static ThemeSwitcherWidgetState of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<ThemeSwitcher>()!.data;

  @override
  bool updateShouldNotify(ThemeSwitcher oldWidget) => this != oldWidget;
}

class ThemeSwitcherWidget extends StatefulWidget {
  const ThemeSwitcherWidget({
    super.key,
    required this.initalTheme,
    required this.initialThemeMode,
    required this.child,
  });

  final JamTheme initalTheme;
  final ThemeMode initialThemeMode;
  final Widget child;

  @override
  State<ThemeSwitcherWidget> createState() => ThemeSwitcherWidgetState();
}

class ThemeSwitcherWidgetState extends State<ThemeSwitcherWidget> {
  late JamTheme themeData;
  late ThemeMode themeMode;

  @override
  void initState() {
    themeData = widget.initalTheme;
    themeMode = widget.initialThemeMode;
    super.initState();
  }

  void toggleThemeMode() => setState(
        () => themeMode =
            themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light,
      );

  void switchTheme(JamTheme theme) => setState(() => themeData = theme);

  @override
  Widget build(BuildContext context) =>
      ThemeSwitcher(data: this, child: widget.child);
}

extension ThemeExtension on BuildContext {
  ThemeData get jTheme => Theme.of(this).brightness == Brightness.light
      ? ThemeSwitcher.of(this).themeData.lightTheme
      : ThemeSwitcher.of(this).themeData.darkTheme;
  TextTheme get jText => Theme.of(this).brightness == Brightness.light
      ? ThemeSwitcher.of(this).themeData.lightTheme.textTheme
      : ThemeSwitcher.of(this).themeData.darkTheme.textTheme;
  ColorScheme get jColor => Theme.of(this).brightness == Brightness.light
      ? ThemeSwitcher.of(this).themeData.lightTheme.colorScheme
      : ThemeSwitcher.of(this).themeData.darkTheme.colorScheme;
}
