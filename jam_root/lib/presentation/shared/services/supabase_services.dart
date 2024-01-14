import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:jam/config/config.dart';
import 'package:jam/data/data.dart';
import 'package:jam/presentation/presentation.dart';

class SupabaseServices {
  static const GET_USER_FRIENDS = 'get_user_friends';

  static Future<void> _intializeFcmTokenListener() async {
    await FirebaseMessaging.instance.requestPermission();
    final fcmToken = await FirebaseMessaging.instance.getToken();

    if (fcmToken == null) return;

    await _setFcmToken(fcmToken);

    FirebaseMessaging.instance.onTokenRefresh.listen(
      (fcmToken) async {
        await _setFcmToken(fcmToken);
      },
    );
  }

  static _setFcmToken(String fcmToken) async {
    final userId = supabase.auth.currentUser!.id;
    await supabase
        .from('profiles')
        .update({'fcm_token': fcmToken}).eq('id', userId);
  }

  static Future<void> initialize() async {
    await PowerSync.initialize();

    supabase.auth.onAuthStateChange.listen(
      (event) async {
        if (event.event == AuthChangeEvent.initialSession &&
            event.session != null) {
          await _listenNotifications();
        }

        switch (event.event) {
          case AuthChangeEvent.signedIn:
            await initNotifications();
            break;
          case AuthChangeEvent.signedOut:
            _logoutHook();
            break;
          default:
            break;
        }
      },
    );
  }

  static initNotifications() async {
    await _intializeFcmTokenListener();
    await _listenNotifications();
  }

  static _listenNotifications() {
    PushNotificationsService.initFirebaseMessagingForegroundHandler();
    PushNotificationsService.initFirebaseMessagingBackgroundHandler();
    // PushNotificationsService.initFirebaseOnAppOpenStrategy();
  }

  static _logoutHook() {
    localDatabase.clear();
    SecureStorage.instance.deleteAll();
  }
}
