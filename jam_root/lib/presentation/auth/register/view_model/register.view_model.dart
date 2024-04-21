import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_ui/jam_ui.dart';

part 'register.view_model.freezed.dart';

@freezed
class RegisterModel with _$RegisterModel {
  const factory RegisterModel({
    required JamBaseFormModel emailModel,
    required JamBaseFormModel fullNameModel,
    required JamBaseFormModel passwordModel,
    required JamBaseFormModel confirmPasswordModel,
    @Default(false) bool agreeWithTerms,
    required List<VibeModel> vibes,
  }) = _RegisterModel;

  const RegisterModel._();

  bool validate() {
    return emailModel.controller!.text.isNotEmpty &&
        fullNameModel.controller!.text.isNotEmpty &&
        passwordModel.controller!.text.isNotEmpty &&
        confirmPasswordModel.controller!.text.isNotEmpty &&
        passwordModel.controller!.text ==
            confirmPasswordModel.controller!.text &&
        vibes.isNotEmpty &&
        agreeWithTerms;
  }
}

final registerModelProvider = Provider<RegisterModel>((ref) {
  return RegisterModel(
    emailModel: JamBaseFormModel.generate(
        labelText: 'Email', validator: emailValidator),
    fullNameModel: JamBaseFormModel.generate(
        labelText: 'Full name', validator: fullNameValidator),
    passwordModel: JamBaseFormModel.generate(
        labelText: 'Password',
        obscureFieldText: true,
        validator: passwordValidator),
    confirmPasswordModel: JamBaseFormModel.generate(
      labelText: 'Confirm password',
      obscureFieldText: true,
    ),
    vibes: [],
  );
});

class RegisterModelStateNotifier extends StateNotifier<RegisterModel> {
  RegisterModelStateNotifier(super.state);

  void addVibes(VibeModel vibe) {
    state = state.copyWith(vibes: [...state.vibes, vibe]);
  }

  void removeVibe(VibeModel vibe) {
    state = state.copyWith(
        vibes: state.vibes.where((element) => element != vibe).toList());
  }

  void updateAgreeWithTerms(bool value) {
    state = state.copyWith(agreeWithTerms: value);
  }
}

final registerModelStateNotifierProvider = StateNotifierProvider.autoDispose<
    RegisterModelStateNotifier, RegisterModel>(
  (ref) => RegisterModelStateNotifier(
    ref.watch(registerModelProvider),
  ),
);
