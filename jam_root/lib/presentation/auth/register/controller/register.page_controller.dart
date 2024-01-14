import 'package:jam/data/data.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'register.page_controller.g.dart';

@riverpod
class RegisterPageController extends _$RegisterPageController {
  @override
  FutureOr<void> build() {
    // no op
  }

  Future<void> register({required RegisterModel model}) async {
    final authRepo = ref.watch(authRepositoryProvider);
    state = const AsyncLoading();
    try {
      await authRepo.register(
        name: model.fullNameModel.controller!.text,
        email: model.emailModel.controller!.text,
        password: model.passwordModel.controller!.text,
        vibes: model.vibes.map((e) => e.id.toString()).toList(),
      );
      ref.invalidate(registerModelStateNotifierProvider);
    } catch (e, s) {
      state = AsyncError(e, s);
    }
  }
}
