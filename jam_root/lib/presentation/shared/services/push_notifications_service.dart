import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:jam/globals.dart';
import 'package:jam/presentation/push_notifications/push_notification_type.enum.dart';
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
        if (message.data.isEmpty || message.data['notificationType'] == null) {
          return;
        }

        final notificitationType =
            PushNotificationType.parse(message.data['notificationType']);

        switch (notificitationType) {
          case PushNotificationType.friendInvite:
            _simplePushNotificationHandler(
              message,
              ChatRoutes.friendInvites.name,
            );
          case PushNotificationType.messageNotification:
            _handleMessageNotification(message);
          case PushNotificationType.jamInvite:
            _simplePushNotificationHandler(message, JamRoutes.invites.name);
            break;
        }
      },
    );
  }

  static _simplePushNotificationHandler(
    RemoteMessage message, [
    String? routeName,
  ]) {
    final context = MAIN_PAGE_KEY.currentContext;
    if (context == null) return;

    JSnackBar.show(
      context,
      type: SnackbarInfoType.info,
      description: message.data['body'],
      onTap: () =>
          routeName != null ? GoRouter.of(context).pushNamed(routeName) : {},
    );
  }

  static _handleMessageNotification(RemoteMessage message) {
    final routerContext = ROUTER_KEY.currentContext;
    if (routerContext == null) return;

    final router = GoRouter.of(routerContext);
    final lastMatch = router.routerDelegate.currentConfiguration.last;
    final matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : router.routerDelegate.currentConfiguration;

    final route = matchList.uri.toString();
    final isHomeRoute = route == '/home';
    final isChatRoute = RegExp(r'^/home/\d+$').hasMatch(route);

    /// dont show notification if user is in chat or home
    /// because he will see new message anyway
    if (isHomeRoute || isChatRoute) return;

    final messageModel = MessageModel(
      fromMe: false,
      messageText: message.data['body'],
      senderId: message.data['senderId'],
      chatId: int.parse(message.data['chatId']),
      sentAt: DateTime.now(),
      messageType: MessageType.parse(message.data['messageType']),
    );

    JSnackBar.show(
      MAIN_PAGE_KEY.currentContext!,
      type: SnackbarInfoType.info,
      description: messageModel.messageText!.crop(20),
      title: message.data['title'] ?? "New Message",
      avatarUrl: message.data['avatar'] ??
          ImagePathConstants.DEFAULT_AVATAR_IMAGE_BUCKET_URL,
      onTap: () => router.pushNamed(
        ChatRoutes.chat.name,
        pathParameters: {
          ChatRoutes.chat.pathParameter!: message.data['chatId']
        },
      ),
    );
  }

  static Future sendNotification(NotificationTypeEnum type, Json body) async {
    final key = dotenv.env[EnvironmentConstants.SUPABASE_API_KEY];

    await supabase.functions.invoke(
      type.value,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $key'
      },
      body: body,
    );
  }
}
