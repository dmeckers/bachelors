import 'package:annotations/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jam_ui/view_models/base_form_model.dart';

part 'reset_password.view_model.freezed.dart';
part 'reset_password.view_model.j-gen.dart';

@ViewModelAnnotation(withHook: true)
@freezed
class ResetPasswordModel with _$ResetPasswordModel {
  const factory ResetPasswordModel({
    required String password,
    required String confirmPassword,
  }) = _ResetPasswordModel;
}
