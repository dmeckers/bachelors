import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/application/application.dart';
import 'package:jam/config/config.dart';
import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SupabaseAuthRepository
    with ProfileRepositoryProviders
    implements AuthRepositoryInterface {
  @override
  Stream<AppUser> authStateChanges$() {
    return Supabase.instance.client.auth.onAuthStateChange.map((e) {
      final isInitializingSession =
          e.event == AuthChangeEvent.initialSession && e.session != null;

      final isSigningOut = e.event == AuthChangeEvent.signedOut &&
          e.event != AuthChangeEvent.tokenRefreshed;

      if (e.event == AuthChangeEvent.tokenRefreshed ||
          e.event == AuthChangeEvent.userUpdated) {
        final user = e.session!.user;
        return AppUser.signedIn(
          uid: user.id,
          displayName: user.email!,
          email: user.email!,
          phone: user.phone!,
        );
      }

      if (isSigningOut) return const AppUser.signedOut();

      if (e.event == AuthChangeEvent.signedIn || isInitializingSession) {
        final user = e.session!.user;
        return AppUser.signedIn(
          uid: user.id,
          displayName: user.email!,
          email: user.email!,
          phone: user.phone!,
        );
      }

      return const AppUser.signedOut();
    });
  }

  @override
  Future<AppUser> login({
    required String email,
    required String password,
  }) async {
    try {
      final authResponse =
          await Supabase.instance.client.auth.signInWithPassword(
        password: password,
        email: email,
      );

      if (authResponse.user == null) {
        throw UnauthorizedException('Wrong credentials', StackTrace.current);
      }
      final userId = authResponse.user!.id;

      await supabase
          .from('profiles')
          .update({'is_online': true}).eq('id', supaUser!.id);

      return JUser(
        uid: userId,
        displayName: authResponse.user!.email!,
        email: authResponse.user!.email!,
        phone: authResponse.user!.phone!,
      );
    } catch (e, s) {
      debugPrint("$e , $s");
      throw UnauthorizedException('Wrong credentials', StackTrace.current);
    }
  }

  @override
  Future<void> logout() async {
    final connectivity = await Connectivity().checkConnectivity();

    if (connectivity == ConnectivityResult.none) {
      supabase.auth.signOut(scope: SignOutScope.local);
    }

    await supabase.from('profiles').update(
      {
        'is_online': false,
        'last_sign_in_at': DateTime.now().toString(),
      },
    ).eq('id', supaUser!.id);

    await Supabase.instance.client.auth.signOut();
  }

  @override
  Future<void> register({
    required String name,
    required String email,
    required String password,
    required List<String> vibes,
  }) async {
    try {
      await Supabase.instance.client.auth.signUp(
        email: email,
        password: password,
        emailRedirectTo: kIsWeb ? null : 'dmeckers://confirm-email-callback',
      );

      await supabase.rpc('post_vibes', params: {'vibe_ids': vibes});

      // await _generateAndSaveKeys();

      await supabase.from('profiles').update({
        'is_online': true,
        'full_name': name,
        'username': name,
      }).eq(
        'id',
        supaUser!.id,
      );

      // final ref = ProviderContainer();

      // await ref.read(userProfileRepository).getCurrentUserProfile();

      // ref.dispose();
    } on AuthException catch (exception) {
      handleAuthException(exception);
    }
  }

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

  void handleAuthException(dynamic exception) {
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

  @override
  Future thirdPartyLogin({required ThirdPartyProviders provider}) async {
    switch (provider) {
      case ThirdPartyProviders.google:
        loginWithGoogle();
        break;
      case ThirdPartyProviders.facebook:
        loginWithFacebook();
        break;
      case ThirdPartyProviders.twitter:
        loginWithTwitter();
        break;
    }
  }

  Future loginWithTwitter() async {
    await Supabase.instance.client.auth.signInWithOAuth(OAuthProvider.twitter);
  }

  Future loginWithFacebook() async {
    await Supabase.instance.client.auth.signInWithOAuth(OAuthProvider.facebook);
  }

  Future loginWithGoogle() async {
    final googleWebClientId =
        dotenv.env[EnvironmentConstants.GOOGLE_OAUTH_CLIENT_ID_WEB];

    final GoogleSignIn googleSignIn = GoogleSignIn(
      serverClientId: googleWebClientId,
    );
    final googleUser = await googleSignIn.signIn();
    final googleAuth = await googleUser!.authentication;
    final accessToken = googleAuth.accessToken;
    final idToken = googleAuth.idToken;

    if (accessToken == null) {
      throw 'No Access Token found.';
    }
    if (idToken == null) {
      throw 'No ID Token found.';
    }

    return Supabase.instance.client.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: accessToken,
    );
  }

  @override
  Future<void> updateUserPassword({required String password}) async {
    await supaAuth.updateUser(UserAttributes(password: password));
  }
}

final authRepositoryProvider = Provider<AuthRepositoryInterface>(
  (ref) => SupabaseAuthRepository(),
);

final authStatChangesProvider = StreamProvider<AppUser>(
  (ref) => ref.watch(authRepositoryProvider).authStateChanges$(),
);
