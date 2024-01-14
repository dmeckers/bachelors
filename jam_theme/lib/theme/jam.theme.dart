import 'package:flutter/material.dart';
import 'package:jam_theme/colors/colors.dart';
import 'package:jam_theme/typography/typography.dart';
import 'package:shared_preferences/shared_preferences.dart';

const kThemeModeKey = '__theme_mode__';
const kThemeKey = '__theme__';
const kCustomThemeKey = '__custom_theme__';
SharedPreferences? _preferences;

enum SupportedThemes {
  defaultTheme('Default theme'),
  monaTheme('Mona theme'),
  cobraTheme('Cobra theme'),
  customColorTheme('Custom theme');

  final String displayName;

  const SupportedThemes(this.displayName);
}

abstract class JamTheme {
  static Future initialize() async =>
      _preferences = await SharedPreferences.getInstance();

  abstract final ThemeData lightTheme;
  abstract final ThemeData darkTheme;
  abstract final SupportedThemes themeInfo;

  static ThemeMode get themeMode {
    final themeIndex = _preferences?.getInt(kThemeModeKey);

    return themeIndex == null
        ? ThemeMode.system
        : themeIndex == 1
            ? ThemeMode.dark
            : ThemeMode.light;
  }

  static void setThemeMode({
    required ThemeMode mode,
    required SupportedThemes theme,
    Color? color,
  }) {
    assert(theme == SupportedThemes.customColorTheme ? color != null : true);
    _preferences?.setInt(kThemeModeKey, mode.index);
    _preferences?.setString(kThemeKey, theme.name);
    if (theme == SupportedThemes.customColorTheme) {
      _preferences?.setString(
          kCustomThemeKey, '${color!.red} ${color.green} ${color.blue}');
    }
  }

  static void setThemeModeOnly(ThemeMode mode) =>
      _preferences?.setInt(kThemeModeKey, mode.index);

  static void saveThemeMode(ThemeMode mode, SupportedThemes theme) =>
      mode == ThemeMode.system
          ? _preferences?.remove(kThemeModeKey)
          : setThemeMode(mode: mode, theme: theme);

  static JamTheme of(BuildContext context) {
    final themeName = _preferences?.getString(kThemeKey);
    final theme = themeName == null
        ? SupportedThemes.defaultTheme
        : SupportedThemes.values
            .where((element) => element.name == themeName)
            .first;

    return switch (theme) {
      SupportedThemes.defaultTheme => JamDefaultTheme(),
      SupportedThemes.monaTheme => JamMonaTheme(),
      SupportedThemes.cobraTheme => JamCobraTheme(),
      SupportedThemes.customColorTheme => JamCustomColorTheme(),
    };
  }
}

class JamCustomColorTheme extends JamTheme {
  @override
  ThemeData get darkTheme {
    final customColor = _preferences?.getString(kCustomThemeKey)?.split(' ');
    final color = Color.fromRGBO(int.parse(customColor!.first),
        int.parse(customColor[1]), int.parse(customColor.last), 1);
    return ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: color, brightness: Brightness.dark),
        textTheme: textThemeWhite,
        // appBarTheme: AppBarTheme(
        //   backgroundColor: Colors.red,
        //   color: Colors.red,
        //   foregroundColor: Colors.red,
        //   shadowColor: Colors.amber,
        //   surfaceTintColor: Colors.amber,
        // ),
        typography: Typography.material2021(
          englishLike: appMaterialEnglishLikeTheme,
          dense: appMaterialTallTheme,
          tall: appMaterialTallTheme,
          black: appMaterialWhiteTheme,
          white: appMaterialBlackTheme,
        ));
  }

  @override
  ThemeData get lightTheme {
    final customColor = _preferences?.getString(kCustomThemeKey)?.split(' ');
    final color = Color.fromRGBO(int.parse(customColor!.first),
        int.parse(customColor[1]), int.parse(customColor.last), 1);

    return ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: color,
          brightness: Brightness.light,
        ),
        textTheme: textTheme,
        // appBarTheme: AppBarTheme(
        //   backgroundColor: Colors.red,
        //   color: Colors.red,
        //   foregroundColor: Colors.red,
        //   shadowColor: Colors.amber,
        //   surfaceTintColor: Colors.amber,
        // ),
        typography: Typography.material2021(
          englishLike: appMaterialEnglishLikeTheme,
          dense: appMaterialTallTheme,
          tall: appMaterialTallTheme,
          black: appMaterialBlackTheme,
          white: appMaterialWhiteTheme,
        ));
  }

  @override
  SupportedThemes get themeInfo => SupportedThemes.customColorTheme;

  bool? get isDefined => _preferences?.containsKey(kCustomThemeKey);

  Color? get color {
    final colorString = _preferences?.getString(kCustomThemeKey)?.split(' ');
    return Color.fromRGBO(int.parse(colorString!.first),
        int.parse(colorString[1]), int.parse(colorString.last), 1);
  }
}

class JamDefaultTheme extends JamTheme {
  @override
  ThemeData get lightTheme => ThemeData(
      colorScheme: lightScheme,
      textTheme: textTheme,
      typography: Typography.material2021(
        englishLike: appMaterialEnglishLikeTheme,
        dense: appMaterialTallTheme,
        tall: appMaterialTallTheme,
        black: appMaterialBlackTheme,
        white: appMaterialWhiteTheme,
      ));

  @override
  ThemeData get darkTheme => ThemeData(
      colorScheme: darkScheme,
      textTheme: textTheme,
      typography: Typography.material2021(
        englishLike: appMaterialEnglishLikeTheme,
        dense: appMaterialTallTheme,
        tall: appMaterialTallTheme,
        black: appMaterialBlackTheme,
        white: appMaterialWhiteTheme,
      ));

  @override
  SupportedThemes get themeInfo => SupportedThemes.defaultTheme;
}

class JamMonaTheme extends JamTheme {
  @override
  ThemeData get lightTheme => ThemeData(
      colorScheme: lightScheme,
      textTheme: textTheme,
      typography: Typography.material2021(
        englishLike: appMaterialEnglishLikeTheme,
        dense: appMaterialTallTheme,
        tall: appMaterialTallTheme,
        black: appMaterialBlackTheme,
        white: appMaterialWhiteTheme,
      ));

  @override
  ThemeData get darkTheme => ThemeData(
      colorScheme: darkScheme,
      textTheme: textTheme,
      typography: Typography.material2021(
        englishLike: appMaterialEnglishLikeTheme,
        dense: appMaterialTallTheme,
        tall: appMaterialTallTheme,
        black: appMaterialBlackTheme,
        white: appMaterialWhiteTheme,
      ));

  @override
  SupportedThemes get themeInfo => SupportedThemes.monaTheme;
}

class JamCobraTheme extends JamTheme {
  @override
  ThemeData get lightTheme => ThemeData(
      colorScheme: cobraLightScheme,
      textTheme: textTheme,
      typography: Typography.material2021(
        englishLike: appMaterialEnglishLikeTheme,
        dense: appMaterialTallTheme,
        tall: appMaterialTallTheme,
        black: appMaterialBlackTheme,
        white: appMaterialWhiteTheme,
      ));

  @override
  ThemeData get darkTheme => ThemeData(
      colorScheme: cobraDarkScheme,
      textTheme: textTheme,
      typography: Typography.material2021(
        englishLike: appMaterialEnglishLikeTheme,
        dense: appMaterialTallTheme,
        tall: appMaterialTallTheme,
        black: appMaterialBlackTheme,
        white: appMaterialWhiteTheme,
      ));

  @override
  SupportedThemes get themeInfo => SupportedThemes.cobraTheme;
}
