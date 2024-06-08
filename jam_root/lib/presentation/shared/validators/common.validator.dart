import 'package:jam_utils/jam_utils.dart';

String? emailValidator(String? value) {
  return value!.isValidEmail() ? null : 'Invalid email';
}

String? nameValidator(String? value) {
  return value.isNotNullOrEmpty
      ? value!.length.isMoreThan(3)
          ? null
          : 'Name must be at least 4 characters long'
      : 'Name is required';
}

String? passwordValidator(String? value) {
  return value?.isStrongPassword() ?? true
      ? null
      : 'Password must be at least 6 characters long and contain at least one number and one uppercase letter or special character';
}
