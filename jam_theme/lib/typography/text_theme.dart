import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final textBase = TextStyle(
    fontWeight: FontWeight.w400,
    inherit: false,
    color: Colors.black,
    decoration: TextDecoration.none,
    textBaseline: TextBaseline.ideographic,
    fontFamily: GoogleFonts.ubuntu().fontFamily);

final textTheme = TextTheme(
  bodyLarge: textBase.copyWith(debugLabel: 'bodyLarge', fontSize: 22),
  bodyMedium: textBase.copyWith(
      debugLabel: 'bodyMedium', fontSize: 18, fontWeight: FontWeight.w400),
  bodySmall: textBase.copyWith(
      debugLabel: 'bodySmall', fontSize: 14, fontWeight: FontWeight.w400),
  titleLarge: textBase.copyWith(
      debugLabel: 'titleLarge', fontSize: 42, fontWeight: FontWeight.w500),
  titleMedium: textBase.copyWith(
      debugLabel: 'titleMedium', fontSize: 38, fontWeight: FontWeight.w500),
  titleSmall: textBase.copyWith(
      debugLabel: 'titleSmall', fontSize: 24, fontWeight: FontWeight.w500),
  displayLarge: textBase.copyWith(
      debugLabel: 'displayLarge', fontSize: 42, fontWeight: FontWeight.w100),
  displayMedium: textBase.copyWith(
      fontFamily: GoogleFonts.cambo().fontFamily,
      debugLabel: 'displayMedium',
      fontSize: 38,
      fontWeight: FontWeight.w100),
  displaySmall: textBase.copyWith(
      debugLabel: 'displaySmall', fontSize: 24, fontWeight: FontWeight.w100),
  labelSmall: textBase.copyWith(
      debugLabel: 'labelSmall', fontSize: 11, fontWeight: FontWeight.w500),
  labelMedium: textBase.copyWith(
      debugLabel: 'labelMedium', fontSize: 13, fontWeight: FontWeight.w500),
  labelLarge: textBase.copyWith(
      debugLabel: 'labelLarge', fontSize: 15, fontWeight: FontWeight.w500),
  headlineSmall: textBase.copyWith(
      debugLabel: 'headlineSmall', fontSize: 12, fontWeight: FontWeight.w700),
  headlineMedium: textBase.copyWith(
      debugLabel: 'headlineMedium', fontSize: 14, fontWeight: FontWeight.w700),
  headlineLarge: textBase.copyWith(
      debugLabel: 'headlineLarge', fontSize: 16, fontWeight: FontWeight.w700),
);
final textThemeWhite = TextTheme(
  bodyLarge: textBase.copyWith(
      debugLabel: 'bodyLarge', fontSize: 22, color: Colors.white),
  bodyMedium: textBase.copyWith(
    debugLabel: 'bodyMedium',
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  ),
  bodySmall: textBase.copyWith(
    debugLabel: 'bodySmall',
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  ),
  titleLarge: textBase.copyWith(
    debugLabel: 'titleLarge',
    fontSize: 42,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  ),
  titleMedium: textBase.copyWith(
    debugLabel: 'titleMedium',
    fontSize: 38,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  ),
  titleSmall: textBase.copyWith(
    debugLabel: 'titleSmall',
    fontSize: 24,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  ),
  displayLarge: textBase.copyWith(
    debugLabel: 'displayLarge',
    fontSize: 42,
    fontWeight: FontWeight.w100,
    color: Colors.white,
  ),
  displayMedium: textBase.copyWith(
    fontFamily: GoogleFonts.cambo().fontFamily,
    debugLabel: 'displayMedium',
    fontSize: 38,
    fontWeight: FontWeight.w100,
    color: Colors.white,
  ),
  displaySmall: textBase.copyWith(
    debugLabel: 'displaySmall',
    fontSize: 24,
    fontWeight: FontWeight.w100,
    color: Colors.white,
  ),
  labelSmall: textBase.copyWith(
    debugLabel: 'labelSmall',
    fontSize: 11,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  ),
  labelMedium: textBase.copyWith(
    debugLabel: 'labelMedium',
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  ),
  labelLarge: textBase.copyWith(
    debugLabel: 'labelLarge',
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  ),
  headlineSmall: textBase.copyWith(
    debugLabel: 'headlineSmall',
    fontSize: 12,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  ),
  headlineMedium: textBase.copyWith(
    debugLabel: 'headlineMedium',
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  ),
  headlineLarge: textBase.copyWith(
    debugLabel: 'headlineLarge',
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  ),
);
