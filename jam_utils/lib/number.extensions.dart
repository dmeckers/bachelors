extension NumberExtensions on num {
  bool isBetween(num minValue, num maxValue) =>
      this >= minValue && this <= maxValue;

  isMoreThan(num value) => this > value;

  isLessThan(num value) => this < value;
}
