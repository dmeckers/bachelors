import 'dart:math';
import 'dart:ui';

Color generateRandomColor() {
  final random = Random();
  final red = random.nextInt(256);
  final green = random.nextInt(256);
  final blue = random.nextInt(256);
  return Color.fromARGB(255, red, green, blue);
}
