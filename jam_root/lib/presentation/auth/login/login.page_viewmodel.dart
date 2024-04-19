import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:jam/generated/l10n.dart';
import 'package:jam_ui/jam_ui.dart';
import 'package:jam_utils/jam_utils.dart';

LoginPageModel useLoginPageModel() {
  return use(const _LoginPageModelHook());
}

class _LoginPageModelHook extends Hook<LoginPageModel> {
  const _LoginPageModelHook();

  @override
  _LoginPageModelHookState createState() => _LoginPageModelHookState();
}

class _LoginPageModelHookState
    extends HookState<LoginPageModel, _LoginPageModelHook> {
  late LoginPageModel model;

  @override
  void initHook() {
    super.initHook();
    model = LoginPageModel.generate(context);
  }

  @override
  LoginPageModel build(BuildContext context) {
    return model;
  }

  @override
  void dispose() {
    model.dispose();
    super.dispose();
  }
}

class LoginPageModel {
  JamBaseFormModel passwordFormModel;
  JamBaseFormModel emailFormModel;

  late bool? passwordVisibility;

  final formKey = GlobalKey<FormState>();

  LoginPageModel({
    required this.passwordFormModel,
    required this.emailFormModel,
  });

  factory LoginPageModel.generate(BuildContext context) {
    return LoginPageModel(
      emailFormModel: JamBaseFormModel.generate(
          labelText: S.of(context).email,
          validator: (value) =>
              (value as String).isValidEmail() ? null : S.of(context).invalidEmail),
      passwordFormModel: JamBaseFormModel.generate(
          labelText: S.of(context).password,
          validator: (value) =>
              (value as String).isNotEmpty ? null : S.of(context).passwordCannotBeEmpty),
    );
  }

  bool validate() {
    return emailFormModel.controller!.text.isValidEmail() &&
        passwordFormModel.controller!.text.isNotEmpty;
  }

  void dispose() {
    passwordFormModel.dispose();
    emailFormModel.dispose();
  }
}
