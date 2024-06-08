import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_utils/jam_utils.dart';

part 'reset_password.view_model.freezed.dart';

@freezed
class ResetPasswordModel with _$ResetPasswordModel {
  const factory ResetPasswordModel({
    required String password,
    required String confirmPassword,
  }) = _ResetPasswordModel;

  const ResetPasswordModel._();

  String? Function(String? value) get validator =>
      (String? value) => password != confirmPassword
          ? 'Passwords do not match'
          : passwordValidator(password).isNotNull
              ? passwordValidator(password)
              : passwordValidator(confirmPassword);

  bool isValid() =>
      password == confirmPassword &&
      passwordValidator(password).isNull &&
      passwordValidator(confirmPassword).isNull;
}

class ResetPasswordModelStateNotifier
    extends StateNotifier<ResetPasswordModel> {
  ResetPasswordModelStateNotifier()
      : super(const ResetPasswordModel(password: '', confirmPassword: ''));

  void updatePassword(String password) {
    state = state.copyWith(password: password);
  }

  void updateConfirmPassword(String confirmPassword) {
    state = state.copyWith(confirmPassword: confirmPassword);
  }
}

final resetPasswordViewModelProvider =
    StateNotifierProvider<ResetPasswordModelStateNotifier, ResetPasswordModel>(
  (ref) => ResetPasswordModelStateNotifier(),
);
