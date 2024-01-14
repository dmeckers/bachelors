import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final whiteThemeBase = TextStyle(
    decoration: TextDecoration.none,
    fontFamily: GoogleFonts.ubuntu().fontFamily,
    color: Colors.white);

TextTheme appMaterialWhiteTheme = TextTheme(
  displayLarge: whiteThemeBase.copyWith(
    debugLabel: 'White Ubuntu displayLarge',
  ),
  displayMedium: whiteThemeBase.copyWith(
    debugLabel: 'White Ubuntu displayMedium',
  ),
  displaySmall: whiteThemeBase.copyWith(
    debugLabel: 'White Ubuntu displaySmall',
  ),
  headlineLarge: whiteThemeBase.copyWith(
    debugLabel: 'White Ubuntu headlineLarge',
  ),
  headlineMedium: whiteThemeBase.copyWith(
    debugLabel: 'White Ubuntu headlineMedium',
  ),
  headlineSmall: whiteThemeBase.copyWith(
    debugLabel: 'White Ubuntu headlineSmall',
  ),
  titleLarge: whiteThemeBase.copyWith(
    debugLabel: 'White Ubuntu titleLarge',
  ),
  titleMedium: whiteThemeBase.copyWith(
    debugLabel: 'White Ubuntu titleMedium',
  ),
  titleSmall: whiteThemeBase.copyWith(
    debugLabel: 'White Ubuntu titleSmall',
  ),
  bodyLarge: whiteThemeBase.copyWith(
    debugLabel: 'White Ubuntu bodyLarge',
  ),
  bodyMedium: whiteThemeBase.copyWith(
    debugLabel: 'White Ubuntu bodyMedium',
  ),
  bodySmall: whiteThemeBase.copyWith(
    debugLabel: 'White Ubuntu bodySmall',
  ),
  labelLarge: whiteThemeBase.copyWith(
    debugLabel: 'White Ubuntu labelLarge',
  ),
  labelMedium: whiteThemeBase.copyWith(
    debugLabel: 'White Ubuntu labelMedium',
  ),
  labelSmall: whiteThemeBase.copyWith(
    debugLabel: 'White Ubuntu labelSmall',
  ),
);
