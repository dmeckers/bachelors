import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:jam/application/application.dart';
import 'package:jam/config/config.dart';
import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';

class SupabaseAuthRepository
    with ProfileRepositoryProviders
    implements AuthRepositoryInterface {
  @override
  Stream<AppUser> authStateChanges$() {
    return Supabase.instance.client.auth.onAuthStateChange.map((e) {
      AppUser createSignedInUser() {
        final user = e.session!.user;
        return AppUser.signedIn(
          uid: user.id,
          displayName: user.email!,
          email: user.email!,
          phone: user.phone!,
        );
      }

      return switch (e.event) {
        AuthChangeEvent.passwordRecovery => const AppUser.passwordRecovery(),
        AuthChangeEvent.tokenRefreshed ||
        AuthChangeEvent.userUpdated ||
        AuthChangeEvent.signedIn =>
          createSignedInUser(),
        AuthChangeEvent.signedOut => const AppUser.signedOut(),
        AuthChangeEvent.initialSession =>
          e.session != null ? createSignedInUser() : const AppUser.signedOut(),
        _ => const AppUser.signedOut(),
      };
    });
  }

  @override
  Future<AppUser> login({
    required String email,
    required String password,
  }) async {
    final authResponse = await supaAuth.signInWithPassword(
      password: password,
      email: email,
    );

    final userId = authResponse.user!.id;
    final ref = ProviderContainer();
    final user = await ref
        .read(ProfileRepositoryProviders().userProfileRepository)
        .getCurrentUserProfile();

    await localDatabase.put(
      HiveConstants.LOCAL_DB_USER_PROFILE_KEY,
      user,
    );

    return JUser(
      uid: userId,
      displayName: authResponse.user!.email!,
      email: authResponse.user!.email!,
      phone: authResponse.user!.phone!,
    );
  }

  @override
  Future<void> logout() async {
    final connectivity = await Connectivity().checkConnectivity();
    final updateOnline = supabase.from('profiles').update(
      {
        'is_online': false,
        'last_sign_in_at': '${DateTime.now()}',
      },
    ).eq('id', supaUser!.id);

    return connectivity == ConnectivityResult.none
        ? supabase.auth.signOut(scope: SignOutScope.local)
        : Future.wait([updateOnline, supaAuth.signOut()]);
  }

  @override
  Future<void> register({
    required String name,
    required String email,
    required String password,
    required List<VibeModel> vibes,
  }) async {
    try {
      final authResponse = await Supabase.instance.client.auth.signUp(
        email: email,
        password: password,
        emailRedirectTo: kIsWeb ? null : 'dmeckers://confirm-email-callback',
      );

      final updateProfileData = supabase.from('profiles').update({
        'is_online': true,
        'full_name': name,
        'username': name,
      }).eq(
        'id',
        supaUser!.id,
      );

      final userId = authResponse.user?.id;

      final putUserInHive = localDatabase.put(
        HiveConstants.LOCAL_DB_USER_PROFILE_KEY,
        UserProfileModel(
          id: userId ?? '',
          lastActiveAt: DateTime.now(),
          username: name,
          fullName: name,
          vibes: vibes,
        ),
      );

      await Future.wait([
        supabase.rpc('post_vibes', params: {
          'vibe_ids': [...vibes.map((e) => '${e.id}')]
        }),
        updateProfileData,
        putUserInHive
      ]);
    } on AuthException catch (exception) {
      switch (int.parse(exception.statusCode!)) {
        case 429:
          throw const RateLimitException();
        case 400:
          {
            if (exception.message == 'User already registered') {
              throw const EmailUsedException();
            }
          }
        case 500:
          throw const ServerException();
        default:
          throw UnauthorizedException('Wrong credentials', StackTrace.current);
      }
    }
  }

  @override
  Future thirdPartyLogin({required ThirdPartyProviders provider}) async {
    await localDatabase.clear();
    final cb = switch (provider) {
      ThirdPartyProviders.google => GoogleAuthHandler.login,
      ThirdPartyProviders.facebook => loginWithFacebook,
      ThirdPartyProviders.twitter => loginWithTwitter,
    };
    await cb();
  }

  Future loginWithTwitter() async => await supaAuth.signInWithOAuth(
        OAuthProvider.twitter,
      );

  Future loginWithFacebook() async => await supaAuth.signInWithOAuth(
        OAuthProvider.facebook,
      );

  @override
  Future<void> updateUserPassword({required String password}) async =>
      await supaAuth.updateUser(
        UserAttributes(password: password),
      );
}

final authRepositoryProvider = Provider<AuthRepositoryInterface>(
  (ref) => SupabaseAuthRepository(),
);

final authStatChangesProvider = StreamProvider<AppUser>(
  (ref) => ref.watch(authRepositoryProvider).authStateChanges$(),
);


  // _generateAndSaveKeys() async {
  //   // final container = ProviderContainer();
  //   // final encrypter = container.read(encrypterProvider);
  //   // final keys = await encrypter.generateKeys();

  //   // await supabase.from('user_secrets').insert({
  //   //   'id': supaUser!.id,
  //   //   'secret': keys.privateKey,
  //   // });

  //   // await supabase.from('profiles').update({'public_key': keys.publicKey}).eq(
  //   //   'id',
  //   //   supaUser!.id,
  //   // );

  //   // await SecureStorage.instance.write(key: 'secret', value: keys.privateKey);
  // }