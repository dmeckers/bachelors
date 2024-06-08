import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_utils/jam_utils.dart';

part 'forgot_password.view_model.freezed.dart';

@freezed
class ForgotPasswordModel with _$ForgotPasswordModel {
  const factory ForgotPasswordModel({
    required String email,
  }) = _ForgotPasswordModel;

  const ForgotPasswordModel._();

  bool isValid() => validator(email).isNull;

  ValidationFunction get validator => Validators.emailValidator;
}

class ForgotPasswordModelStateNotifier
    extends StateNotifier<ForgotPasswordModel> {
  ForgotPasswordModelStateNotifier()
      : super(const ForgotPasswordModel(email: ''));

  void updateEmail(String email) {
    state = state.copyWith(email: email);
  }
}

final forgotPasswordViewModelProvider = StateNotifierProvider.autoDispose<
    ForgotPasswordModelStateNotifier, ForgotPasswordModel>(
  (ref) => ForgotPasswordModelStateNotifier(),
);
