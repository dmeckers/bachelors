import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:jam/application/application.dart';
import 'package:jam/config/config.dart';
import 'package:jam/data/data.dart';

part 'login.page_controller.g.dart';

@riverpod
class LoginPageController extends _$LoginPageController {
  @override
  FutureOr<void> build() {
    // no op
  }

  Future<void> login({required String email, required String password}) async {
    final authRepo = ref.read(authRepositoryProvider);
    state = const AsyncLoading();
    try {
      await authRepo.login(email: email, password: password);
    } catch (e, s) {
      state = AsyncValue.error(e, s);
    }
  }

  Future<void> loginWithThirdPartyProvider({
    required ThirdPartyProviders provider,
  }) async {
    final authRepo = ref.read(authRepositoryProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(
        () => authRepo.thirdPartyLogin(provider: provider));
  }
}

@riverpod
Future<Strings> loginBackgrounds(LoginBackgroundsRef ref) =>
    ref.read(authMediaServiceProvider).getLoginBackgrounds();
