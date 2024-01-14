import 'package:jam/application/auth/auth.dart';
import 'package:jam/domain/user/auth/auth.model.dart';

abstract interface class AuthRepositoryInterface {
  Future<AppUser> login({required String email, required String password});

  Future<void> updateUserPassword({required String password});

  Future<dynamic> thirdPartyLogin({required ThirdPartyProviders provider});

  Stream<AppUser> authStateChanges$();

  Future<dynamic> register({
    required String email,
    required String name,
    required String password,
    required List<String> vibes,
  });

  Future<void> logout();
}
