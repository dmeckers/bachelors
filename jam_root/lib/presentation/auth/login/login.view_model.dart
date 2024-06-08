import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/application/application.dart';
import 'package:jam/data/data.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_utils/jam_utils.dart';

part 'login.view_model.freezed.dart';

@freezed
class LoginPageModel with _$LoginPageModel {
  const factory LoginPageModel({
    required String email,
    required String password,
  }) = _LoginPageModel;

  const LoginPageModel._();

  bool isValid() => password.isNotEmptyOrNull && emailValidator(email).isNull;
}

class LoginPageModelStateNotifier extends StateNotifier<LoginPageModel> {
  LoginPageModelStateNotifier()
      : super(const LoginPageModel(password: '', email: ''));

  void updateEmail(String email) => state = state.copyWith(email: email);

  void updatePassword(String password) => state = state.copyWith(
        password: password,
      );

  Future<void> handleLogin({
    required String email,
    required String password,
  }) async {
    try {
      final ref = ProviderContainer();
      final authRepo = ref.read(authRepositoryProvider);
      await authRepo.login(email: email, password: password);
      ref.dispose();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> loginWithThirdPartyProvider({
    required ThirdPartyProviders provider,
  }) async {
    try {
      final ref = ProviderContainer();
      final authRepo = ref.read(authRepositoryProvider);
      await authRepo.thirdPartyLogin(provider: provider);
      ref.dispose();
    } catch (e) {
      rethrow;
    }
  }
}

final loginPageViewModelProvider = StateNotifierProvider.autoDispose<
    LoginPageModelStateNotifier, LoginPageModel>(
  (ref) => LoginPageModelStateNotifier(),
);
