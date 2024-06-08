import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:jam/config/config.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// TODO TUT LOGIN I REGISTER MIXANULISJ BLJAT
class GoogleAuthHandler {
  static Future<AuthResponse> login() async {
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

    final authResponse = await supaAuth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: accessToken,
    );

    final metadata = authResponse.user?.userMetadata;

    if (metadata != null) {
      await supabase.from('profiles').update({
        'full_name': metadata['full_name'],
        'username': metadata['name'],
        'is_online': true,
        'avatar': metadata['picture'],
      }).eq('id', authResponse.user!.id);
    }

    // await hotQuickFix();

    return authResponse;
  }
}
