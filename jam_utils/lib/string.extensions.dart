extension CropTextWithTrailingEllipsis on String {
  String crop(int maxLength) =>
      length > maxLength ? '${substring(0, maxLength)}...' : this;
}

extension NullCheck on dynamic {
  bool get isNotNull => (this as dynamic) != null;
  bool get isNull => (this as dynamic) == null;
}

extension StringExtensions on String {
  String get firstTwoCapitalInitials {
    List<String> words = split(' ');
    String initials = '';

    if (words.length == 1) {
      return words[0][0].toUpperCase();
    }

    for (int i = 0; i < 2; i++) {
      initials += words[i][0].toUpperCase();
    }

    return initials;
  }

  bool get isLink {
    return startsWith('http://') || startsWith('https://');
  }

  String formatCoords() {
    final cords = split('(')[1].split(')')[0].split(',');

    return 'Lat: ${cords[0]}, Lng: ${cords[1]}';
  }

  ({double lat, double lon}) extractCords() {
    // final cords = split('(')[1].split(')')[0].split(',');
    final lat = split('Lat:')[1].split(', Lng:')[0].trim();
    final lon = split('Lng:')[1].trim();

    return (lat: double.parse(lat), lon: double.parse(lon));
  }

  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }

  String jamPostfix() {
    return toLowerCase().contains('jam') ? this : '$this Jam';
  }
}

extension EmailValidation on String {
  bool isValidEmail() {
    const pattern = r'^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,7}$';
    final regExp = RegExp(pattern);

    return regExp.hasMatch(this);
  }
}

extension NullableStringExtension on String? {
  bool get isEmptyOrNull {
    return this == null || (this?.isEmpty ?? true);
  }

  bool get isNotEmptyOrNull {
    return !isEmptyOrNull;
  }

  String? get nullIfEmpty {
    return isEmptyOrNull ? null : this;
  }
}

String? isStrongPassword(String value) {
  // Check if the length is at least 6 characters
  if (value.length < 6) {
    return 'Password is too short';
  }

  // Check if the string contains at least one digit or special symbol
  bool hasDigitOrSymbol = false;
  for (int i = 0; i < value.length; i++) {
    if (value.isDigit(value[i]) || value.isSpecialSymbol(value[i])) {
      hasDigitOrSymbol = true;
      break;
    }
  }

  return hasDigitOrSymbol
      ? null
      : 'Password must contain at least one digit or special symbol';
}

extension PasswordValidation on String {
  bool isStrongPassword() {
    // Check if the length is at least 6 characters
    if (length < 6) {
      return false;
    }

    // Check if the string contains at least one digit or special symbol
    bool hasDigitOrSymbol = false;
    for (int i = 0; i < length; i++) {
      if (isDigit(this[i]) || isSpecialSymbol(this[i])) {
        hasDigitOrSymbol = true;
        break;
      }
    }

    return hasDigitOrSymbol;
  }

  bool isDigit(String character) {
    return character.contains(RegExp(r'\d'));
  }

  bool isSpecialSymbol(String character) {
    return character.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  }
}
