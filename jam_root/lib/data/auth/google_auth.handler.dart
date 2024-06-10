import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:jam/config/config.dart';
import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/shared/services/geo_packer.dart';
import 'package:jam_utils/jam_utils.dart';
import 'package:location/location.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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

    if (accessToken.isNull) {
      throw 'No Access T0oken found.';
    }

    if (idToken.isNull) {
      throw 'No ID Token found.';
    }

    final authResponse = await supaAuth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken!,
      accessToken: accessToken,
    );

    if (authResponse.user.isNull) {
      throw 'No user found.';
    }

    final user = authResponse.user!;

    await _upsertAndCacheUserProfile(
      metadata: user.userMetadata,
      userId: user.id,
    );

    return authResponse;
  }

  static Future<void> _upsertAndCacheUserProfile({
    required Json? metadata,
    required String userId,
  }) async {
    final response = await supabase.rpc(
      'upsert_google_user',
      params: {
        'id': userId,
        'full_name': metadata!['full_name'],
        'username': metadata['name'],
        'avatar': metadata['picture'],
      },
    ) as Dynamics;

    const nestedKeys = ['vibes', 'friends', 'jams'];
    final rawData = response.first['data'] as Json;
    final userInfo = rawData['user_info'] as Json;

    final json = nestedKeys.fold(
      userInfo,
      (acc, key) => acc..addAll({key: rawData[key]}),
    );

    await Storer().hivePut<UserProfileModel>(UserProfileModel.fromJson(json));
    await _requestAndCacheLocation();
  }

  static Future<void> _requestAndCacheLocation() async {
    await localDatabase.put(
      'LOCATION',
      GeoPacker.toLatLngStringFromData(data: await Location().getLocation()),
    );
  }
}
