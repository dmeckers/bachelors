extension NumberExtensions on num {
  bool isBetween(num minValue, num maxValue) {
    return this >= minValue && this <= maxValue;
  }
}
