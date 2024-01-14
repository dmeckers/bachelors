import 'dart:io';
import 'dart:math';
import 'package:go_router/go_router.dart';
import 'package:jam/presentation/presentation.dart';
// ignore: depend_on_referenced_packages
import 'package:path_provider/path_provider.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class AndroidNotificator {
  static FlutterLocalNotificationsPlugin plugin =
      FlutterLocalNotificationsPlugin();

  static handleRedirect(NotificationResponse a) {
    final chatId = int.parse(a.payload!.split('=')[1]);
    if (routerKey.currentContext == null) {
      return (isFromChat: true, router: null);
    }

    GoRouter.of(routerKey.currentContext!).pushNamed(
      ChatRoutes.chat.name,
      pathParameters: {
        ChatRoutes.chat.pathParameter!: chatId.toString(),
      },
    );
  }

  static const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('logo');

  static const InitializationSettings initializationSettings =
      InitializationSettings(android: initializationSettingsAndroid);

  static Future init() async {
    await plugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: handleRedirect,
    );
  }

  static Future show(
    String title,
    String body,
    String? imageUrl,
    int chatId,
  ) async {
    if (imageUrl == null) {
      const AndroidNotificationDetails androidPlatformChannelSpecifics =
          AndroidNotificationDetails(
        'personal_chat_message_channel',
        'Default',
        channelDescription: 'Default',
        importance: Importance.max,
        priority: Priority.high,
        showWhen: false,
      );

      const NotificationDetails platformChannelSpecifics =
          NotificationDetails(android: androidPlatformChannelSpecifics);

      await plugin.show(
        Random().nextInt(1000),
        title,
        body,
        platformChannelSpecifics,
        payload: 'chatId=$chatId',
      );
    }

    final response = await http.get(Uri.parse(imageUrl!));

    final tempDirectory = await getTemporaryDirectory();
    final imagePath =
        '${tempDirectory.path}/${Random().nextInt(1000)}_notification_avatar.png';
    final imageFile = File(imagePath);

    await imageFile.writeAsBytes(response.bodyBytes);

    // Create the Android notification details
    final AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'personal_chat_message_channel',
      'Default',
      channelDescription: 'Default',
      importance: Importance.max,
      priority: Priority.high,
      showWhen: false,
      largeIcon: FilePathAndroidBitmap(imagePath),
      category: AndroidNotificationCategory.message,
    );

    // Create the notification details
    final NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    // Show the notification
    await plugin.show(
      Random().nextInt(1000),
      title,
      body,
      platformChannelSpecifics,
      payload: 'chatId=$chatId',
    );
  }
}
