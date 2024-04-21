// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password.view_model.dart';

// **************************************************************************
// ViewModelGenerator
// **************************************************************************

// ***************************************************************************
// Author: Dmitry Mecker https://github.com/dmeckers
// ***************************************************************************

final class ResetPasswordViewModel {
  final JamBaseFormModel passwordFormModel;
  final JamBaseFormModel confirmPasswordFormModel;
  final bool passwordVisibility;

  const ResetPasswordViewModel({
    this.passwordVisibility = false,
    required this.passwordFormModel,
    required this.confirmPasswordFormModel,
  });

  factory ResetPasswordViewModel.generate() {
    return ResetPasswordViewModel(
        passwordFormModel: JamBaseFormModel.generate(
            labelText: 'Password',
            validator: (value) {
              if ((value as String).isEmpty) {
                return 'Password cannot be empty';
              }
              if ((value as String).length < 6) {
                return 'password must be at least 6 characters long';
              }

              return null;
            }),
        confirmPasswordFormModel: JamBaseFormModel.generate(
            labelText: 'Confirm Password',
            validator: (value) {
              if ((value as String).isEmpty) {
                return 'Confirm Password cannot be empty';
              }

              return null;
            }));
  }

  factory ResetPasswordViewModel.fromModel(ResetPasswordModel model) {
    return ResetPasswordViewModel(
      passwordFormModel: JamBaseFormModel.generate(
          labelText: 'Password',
          initValue: model.password,
          validator: (value) {
            if ((value as String).isEmpty) {
              return 'Password cannot be empty';
            }
            if ((value as String).length < 6) {
              return 'password must be at least 6 characters long';
            }

            return null;
          }),
      confirmPasswordFormModel: JamBaseFormModel.generate(
          labelText: 'Confirm Password',
          initValue: model.confirmPassword,
          validator: (value) {
            if ((value as String).isEmpty) {
              return 'Confirm Password cannot be empty';
            }

            return null;
          }),
    );
  }

  ResetPasswordViewModel copyWith({
    JamBaseFormModel? passwordFormModel,
    JamBaseFormModel? confirmPasswordFormModel,
  }) {
    return ResetPasswordViewModel(
      passwordFormModel: passwordFormModel ?? this.passwordFormModel,
      confirmPasswordFormModel:
          confirmPasswordFormModel ?? this.confirmPasswordFormModel,
    );
  }

  void dispose() {
    passwordFormModel.dispose();
    confirmPasswordFormModel.dispose();
  }

  ResetPasswordModel castToModel() {
    return ResetPasswordModel(
      password: passwordFormModel.controller!.text,
      confirmPassword: confirmPasswordFormModel.controller!.text,
    );
  }
}

ResetPasswordViewModel useResetPasswordViewModel() {
  return use(const _ResetPasswordViewModelHook());
}

class _ResetPasswordViewModelHook extends Hook<ResetPasswordViewModel> {
  const _ResetPasswordViewModelHook();
  @override
  _ResetPasswordViewModelHookState createState() =>
      _ResetPasswordViewModelHookState();
}

class _ResetPasswordViewModelHookState
    extends HookState<ResetPasswordViewModel, _ResetPasswordViewModelHook> {
  late ResetPasswordViewModel model;
  @override
  void initHook() {
    super.initHook();
    model = ResetPasswordViewModel.generate();
  }

  @override
  ResetPasswordViewModel build(BuildContext context) {
    return model;
  }

  @override
  void dispose() {
    model.dispose();
    super.dispose();
  }
}
