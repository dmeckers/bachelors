import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/data/data.dart';

import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_utils/jam_utils.dart';

part 'register.view_model.freezed.dart';

@freezed
class RegisterModel with _$RegisterModel {
  const factory RegisterModel({
    @Default('') String email,
    @Default('') String fullName,
    @Default('') String password,
    @Default('') String confirmPassword,
    @Default(false) bool agreeWithTerms,
    @Default([]) List<VibeModel> vibes,
  }) = _RegisterModel;

  const RegisterModel._();

  get isValid =>
      canProceedToVibes &&
      password == confirmPassword &&
      vibes.isNotNullOrEmpty &&
      agreeWithTerms;

  get canProceedToVibes =>
      emailValidator(email).isNull &&
      nameValidator(fullName).isNull &&
      passwordValidator(password).isNull &&
      passwordValidator(confirmPassword).isNull;

  doIfValid(void Function() callback) {
    if (isValid) {
      callback();
    }
  }
}

class RegisterModelStateNotifier extends StateNotifier<RegisterModel> {
  RegisterModelStateNotifier(super.state);

  void addVibes(VibeModel vibe) => state = state.copyWith(
        vibes: [...state.vibes, vibe],
      );

  void updateEmail(String value) => state = state.copyWith(
        email: state.email,
      );

  void updateFullName(String value) => state = state.copyWith(
        fullName: state.fullName,
      );

  void updatePassword(String value) => state = state.copyWith(
        password: state.password,
      );

  void updateConfirmPassword(String value) =>
      state = state.copyWith(confirmPassword: state.confirmPassword);

  void removeVibe(VibeModel vibe) => state = state.copyWith(
        vibes: [...state.vibes.where((v) => v != vibe)],
      );

  void updateAgreeWithTerms(bool value) => state = state.copyWith(
        agreeWithTerms: value,
      );

  Future<void> handleRegister({required RegisterModel model}) async {
    try {
      final ref = ProviderContainer();
      final authRepo = ref.read(authRepositoryProvider);

      await authRepo.register(
        name: model.fullName,
        email: model.email,
        password: model.password,
        vibes: model.vibes,
      );
    } catch (_) {
      rethrow;
    }
  }
}

final registerModelStateNotifierProvider = StateNotifierProvider.autoDispose<
    RegisterModelStateNotifier, RegisterModel>(
  (ref) => RegisterModelStateNotifier(const RegisterModel()),
);
