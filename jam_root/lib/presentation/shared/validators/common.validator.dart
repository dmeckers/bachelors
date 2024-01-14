import 'package:jam_utils/jam_utils.dart';

emailValidator(String? value) {
  return value!.isValidEmail() ? null : 'Invalid email';
}

fullNameValidator(String? value) {
  return value!.isNotEmpty
      ? value.length > 3
          ? null
          : 'Full name must be at least 4 characters long'
      : 'Full name is required';
}

passwordValidator(String? value) {
  return (value as String).isStrongPassword()
      ? null
      : 'Password must be at least 6 characters long and contain at least one number and one uppercase letter or special character';
}
