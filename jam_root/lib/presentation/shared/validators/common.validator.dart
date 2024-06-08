import 'package:jam_utils/jam_utils.dart';

class Validators {
  static String? emailValidator(String? value) =>
      value?.isValidEmail() ?? true ? null : 'Invalid email';

  static nonNullValidator(String? value) =>
      value.isNotNullOrEmpty ? null : 'Field is required';

  static String? nameValidator(String? value) => value.isNotNullOrEmpty
      ? value!.length.isMoreThan(3)
          ? null
          : 'Name must be at least 4 characters long'
      : 'Name is required';

  static String? passwordValidator(String? value) => value
              ?.isStrongPassword() ??
          true
      ? null
      : 'Password must be at least 6 characters long and contain at least one number and one uppercase letter or special character';
}
