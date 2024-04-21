import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:jam/domain/user/profile/profile.model.dart';

part 'auth.model.freezed.dart';
part 'auth.model.g.dart';

enum JUserAuthState { authenticated, signedOut, passwordRecovery }

@freezed
abstract class AppUser with _$AppUser {
  const factory AppUser.signedIn({
    required String uid,
    required String displayName,
    required String email,
    required String phone,
    @Default('') String token,
    @Default(null) DateTime? lastSignIn,
    @Default(null) UserProfileModel? userProfile,
  }) = JUser;

  const AppUser._();

  const factory AppUser.signedOut() = SignedOut;

  const factory AppUser.passwordRecovery() = PasswordRecovery;

  JUserAuthState get authState => switch (this) {
        JUser() => JUserAuthState.authenticated,
        SignedOut() => JUserAuthState.signedOut,
        PasswordRecovery() => JUserAuthState.passwordRecovery,
        _ => throw UnimplementedError(),
      };

  bool get isPsswordRecovery => this is PasswordRecovery;

  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);
}
