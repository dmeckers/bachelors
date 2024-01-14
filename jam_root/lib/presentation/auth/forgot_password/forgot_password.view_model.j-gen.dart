// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgot_password.view_model.dart';

// **************************************************************************
// ViewModelGenerator
// **************************************************************************

// ***************************************************************************
// Author: Dmitry Mecker https://github.com/dmeckers
// ***************************************************************************

final class ForgotPasswordViewModel {
  final JamBaseFormModel emailFormModel;

  const ForgotPasswordViewModel({
    required this.emailFormModel,
  });

  factory ForgotPasswordViewModel.generate() {
    return ForgotPasswordViewModel(
        emailFormModel: JamBaseFormModel.generate(
            labelText: 'Email',
            validator: (value) {
              if ((value as String).isEmpty) {
                return 'Email cannot be empty';
              }

              if (!RegExp(
                      r'^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,7}$')
                  .hasMatch(value)) {
                return 'Invalid email format';
              }

              return null;
            }));
  }

  factory ForgotPasswordViewModel.fromModel(ForgotPasswordModel model) {
    return ForgotPasswordViewModel(
      emailFormModel: JamBaseFormModel.generate(
          labelText: 'Email',
          initValue: model.email,
          validator: (value) {
            if ((value as String).isEmpty) {
              return 'Email cannot be empty';
            }

            if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,7}$')
                .hasMatch(value)) {
              return 'Invalid email format';
            }

            return null;
          }),
    );
  }

  ForgotPasswordViewModel copyWith({
    JamBaseFormModel? emailFormModel,
  }) {
    return ForgotPasswordViewModel(
      emailFormModel: emailFormModel ?? this.emailFormModel,
    );
  }

  void dispose() {
    emailFormModel.dispose();
  }

  ForgotPasswordModel castToModel() {
    return ForgotPasswordModel(
      email: emailFormModel.controller!.text,
    );
  }
}
