import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final materialBlackThemeBase = TextStyle(
  color: Colors.white70,
  decoration: TextDecoration.none,
  fontFamily: GoogleFonts.ubuntu().fontFamily,
);

TextTheme appMaterialBlackTheme = TextTheme(
  displayLarge: materialBlackThemeBase.copyWith(
    debugLabel: 'Black Ubuntu displayLarge',
  ),
  displayMedium: materialBlackThemeBase.copyWith(
    debugLabel: 'Black Ubuntu displayMedium',
  ),
  displaySmall: materialBlackThemeBase.copyWith(
    debugLabel: 'Black Ubuntu displaySmall',
  ),
  headlineLarge: materialBlackThemeBase.copyWith(
    debugLabel: 'Black Ubuntu headlineLarge',
  ),
  headlineMedium: materialBlackThemeBase.copyWith(
    debugLabel: 'Black Ubuntu headlineMedium',
  ),
  headlineSmall: materialBlackThemeBase.copyWith(
    debugLabel: 'Black Ubuntu headlineSmall',
    color: Colors.white70,
  ),
  titleLarge: materialBlackThemeBase.copyWith(
    debugLabel: 'Black Ubuntu titleLarge',
    color: Colors.white70,
  ),
  titleMedium: materialBlackThemeBase.copyWith(
    debugLabel: 'Black Ubuntu titleMedium',
    color: Colors.white70,
  ),
  titleSmall: materialBlackThemeBase.copyWith(
    debugLabel: 'Black Ubuntu titleSmall',
    color: Colors.black,
  ),
  bodyLarge: materialBlackThemeBase.copyWith(
    debugLabel: 'Black Ubuntu bodyLarge',
    color: Colors.white70,
  ),
  bodyMedium: materialBlackThemeBase.copyWith(
    debugLabel: 'Black Ubuntu bodyMedium',
    color: Colors.white70,
    fontFamily: GoogleFonts.cambo().fontFamily,
  ),
  bodySmall: materialBlackThemeBase.copyWith(
    debugLabel: 'Black Ubuntu bodySmall',
  ),
  labelLarge: materialBlackThemeBase.copyWith(
    debugLabel: 'Black Ubuntu labelLarge',
    color: Colors.white70,
  ),
  labelMedium: materialBlackThemeBase.copyWith(
    debugLabel: 'Black Ubuntu labelMedium',
    color: Colors.black,
  ),
  labelSmall: materialBlackThemeBase.copyWith(
    debugLabel: 'Black Ubuntu labelSmall',
    color: Colors.black,
  ),
);
