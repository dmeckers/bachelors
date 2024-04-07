import 'package:annotations/annotations.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:jam_ui/view_models/base_form_model.dart';

part 'forgot_password.view_model.j-gen.dart';
part 'forgot_password.view_model.freezed.dart';

@jvmodel
@freezed
class ForgotPasswordModel with _$ForgotPasswordModel {
  const factory ForgotPasswordModel({
    required String email,
  }) = _ForgotPasswordModel;
}
