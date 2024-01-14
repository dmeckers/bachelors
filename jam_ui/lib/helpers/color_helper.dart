import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

mixin class ColorHelper {
  static Brightness colorBrightness(Color color) {
    return ThemeData.estimateBrightnessForColor(color);
  }

  static Color colorContrast(Color color) {
    Brightness colorBrightness = ThemeData.estimateBrightnessForColor(color);
    return colorBrightness == Brightness.dark ? Colors.white : Colors.black;
  }

  static Future<Color> getDominantColor(String imageUrl) async {
    PaletteGenerator paletteGenerator;
    try {
      paletteGenerator = await PaletteGenerator.fromImageProvider(
        NetworkImage(imageUrl),
      );
    } catch (e) {
      paletteGenerator = await PaletteGenerator.fromImageProvider(
        const AssetImage('assets/images/dunno.webp'),
      );
    }

    return paletteGenerator.dominantColor?.color ?? Colors.white;
  }
}
