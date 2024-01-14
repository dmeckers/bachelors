import 'package:flutter/material.dart';

const lightPrimaryColor = Color.fromARGB(255, 62, 108, 66);
const lightOnPrimary = Color.fromARGB(255, 112, 182, 139);
const lightSecondary = Color.fromARGB(255, 48, 77, 48);
const lightOnSecondary = Color.fromARGB(255, 40, 53, 40);
const lightError = Color.fromARGB(255, 166, 74, 53);
const lightOnError = Color.fromARGB(255, 247, 198, 187);
const lightBackground = Color.fromARGB(255, 182, 196, 182);
const lightSurface = Color.fromARGB(255, 218, 240, 217);
const lightOnBackground = Color.fromARGB(255, 17, 18, 17);
const lightOnSurface = Color.fromARGB(255, 40, 41, 37);

const ColorScheme lightScheme = ColorScheme.light(
    primary: lightPrimaryColor,
    onPrimary: lightOnPrimary,
    // tertiary: Colors.red,
    // primaryContainer: Colors.red,
    // inversePrimary: Colors.red,
    // inverseSurface: Colors.red,
    // onInverseSurface: Colors.red,
    // onPrimaryContainer: Colors.red,
    // onSecondaryContainer: Colors.red,
    // onTertiary: Colors.red,
    // outline: Colors.red,
    // onTertiaryContainer: Colors.red,
    // secondaryContainer: Colors.red,
    // outlineVariant: Colors.red,
    // errorContainer: Colors.red,
    // scrim: Colors.red,
    // onErrorContainer: Colors.red,
    // shadow: Colors.red,
    // surfaceVariant: Colors.red,
    // tertiaryContainer: Colors.red,
    // surfaceTint: Colors.red,
    // // brightness: Brightness.dark,
    // onSurfaceVariant: Colors.red,
    secondary: lightSecondary,
    onSecondary: lightOnSecondary,
    error: lightError,
    onError: lightOnError,
    background: lightBackground,
    onBackground: lightOnBackground,
    surface: lightSurface,
    onSurface: lightOnSurface);

const darkPrimaryColor = Color.fromARGB(0, 219, 224, 226);
const darkOnPrimary = Color(0x00557177);
const darkSecondary = Color(0x00413171);
const darkOnSecondary = Color(0x0053457C);
const darkError = Color(0x00C02D2D);
const darkOnError = Color(0x00e06666);
const darkBackground = Color(0x00E2E7E8);
const darkSurface = Color(0x00B6C2C5);
const darkOnBackground = Color(0x00b4a7d6);
const darkOnSurface = Color(0x0093c47d);

const ColorScheme darkScheme = ColorScheme.dark(
    primary: darkPrimaryColor,
    onPrimary: darkOnPrimary,
    secondary: darkSecondary,
    onSecondary: darkOnSecondary,
    error: darkError,
    onError: darkOnError,
    background: darkBackground,
    onBackground: darkOnBackground,
    surface: darkSurface,
    onSurface: darkOnSurface);
