import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:jam/config/config.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_utils/jam_utils.dart';

class PushNotificationsService {
  static Future initFirebaseMessagingBackgroundHandler() async {
    FirebaseMessaging.onBackgroundMessage(
      firebaseMessagingBackgroundHandler,
    );
  }

  // static Future initFirebaseOnAppOpenStrategy() async {
  //   // FirebaseMessaging.instance.
  //   FirebaseMessaging.onMessageOpenedApp.listen(
  //     (RemoteMessage message) {
  //       final (isFromChat: fromChat, router: router) =
  //           _isMessageFromChat(message);

  //       if (fromChat) return;

  //       router!.pushNamed(
  //         ChatRoutes.chat.name,
  //         pathParameters: {
  //           ChatRoutes.chat.pathParameter!: message.data['chatId']
  //         },
  //       );
  //     },
  //   );
  // }

  @pragma('vm:entry-point')
  static Future<void> firebaseMessagingBackgroundHandler(
    RemoteMessage message,
  ) async {
    try {
      await dotenv.load(fileName: ".env");
      await Supabase.initialize(
        url: dotenv.env[EnvironmentConstants.SUPABASE_PROJECT_URL]!,
        anonKey: dotenv.env[EnvironmentConstants.SUPABASE_API_KEY]!,
      );
    } catch (e) {
      debugPrint('Already initialized');
    }

    final userId = supabase.auth.currentUser?.id;

    if (message.data.isEmpty || message.data['senderId'] == userId) {
      return;
    }

    final messageModel = MessageModel(
      fromMe: false,
      messageText: message.data['body'],
      senderId: message.data['senderId'],
      sentAt: DateTime.now(),
      chatId: int.parse(message.data['chatId']),
      messageType: MessageType.parse(message.data['messageType']),
    );

    AndroidNotificator.show(
      message.data['title'] ?? "New Message",
      messageModel.messageType == MessageType.text
          ? messageModel.messageText!.crop(25)
          : messageModel.messageType.name,
      message.data['avatar'] ??
          ImagePathConstants.DEFAULT_AVATAR_IMAGE_BUCKET_URL,
      int.parse(message.data['chatId']),
    );
  }

  static initFirebaseMessagingForegroundHandler() {
    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) async {
        final userId = supabase.auth.currentUser?.id;

        if (message.data.isEmpty || message.data['senderId'] == userId) {
          return;
        }

        final (isFromChat: fromChat, router: router) =
            _isMessageFromChat(message);

        if (fromChat) return;

        final messageModel = MessageModel(
          fromMe: false,
          messageText: message.data['body'],
          senderId: message.data['senderId'],
          chatId: int.parse(message.data['chatId']),
          sentAt: DateTime.now(),
          messageType: MessageType.parse(message.data['messageType']),
        );

        JSnackBar.show(
          testKey.currentContext!,
          type: SnackbarInfoType.info,
          description: messageModel.messageText!.crop(20),
          title: message.data['title'] ?? "New Message",
          avatarUrl: message.data['avatar'] ??
              ImagePathConstants.DEFAULT_AVATAR_IMAGE_BUCKET_URL,
          onTap: () => router!.pushNamed(
            ChatRoutes.chat.name,
            pathParameters: {
              ChatRoutes.chat.pathParameter!: message.data['chatId']
            },
          ),
        );
      },
    );
  }

  static ({bool isFromChat, GoRouter? router}) _isMessageFromChat(
      RemoteMessage message) {
    if (routerKey.currentContext == null) {
      return (isFromChat: true, router: null);
    }

    final router = GoRouter.of(routerKey.currentContext!);

    final lastMatch = router.routerDelegate.currentConfiguration.last;
    final matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : router.routerDelegate.currentConfiguration;

    final route = matchList.uri.toString();

    /// TODO resolve when to show notification
    /// i will only check on chat because im fucking tired of this shit
    /// if somebody wants he will do it
    final isChatNotification = (message.data['title'] as String)
        .toLowerCase()
        .startsWith('new message');
    final isHomeRoute = route == '/home';
    final isChatRoute = RegExp(r'^/home/\d+$').hasMatch(route);

    return (
      isFromChat: (isHomeRoute || isChatRoute) && isChatNotification,
      router: router
    );
  }
}
