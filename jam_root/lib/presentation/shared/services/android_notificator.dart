import 'dart:io';
import 'dart:math';
import 'package:go_router/go_router.dart';
import 'package:jam/globals.dart';
// ignore: depend_on_referenced_packages
import 'package:path_provider/path_provider.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:jam/presentation/presentation.dart';

class AndroidNotificator {
  static FlutterLocalNotificationsPlugin plugin =
      FlutterLocalNotificationsPlugin();

  static handleRedirect(NotificationResponse a) {
    final chatId = int.parse(a.payload!.split('=')[1]);
    if (ROUTER_KEY.currentContext == null) {
      return (isFromChat: true, router: null);
    }

    GoRouter.of(ROUTER_KEY.currentContext!).pushNamed(
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
    // Create the Android notification details
    final AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'personal_chat_message_channel',
      'Default',
      channelDescription: 'Default',
      importance: Importance.max,
      priority: Priority.high,
      showWhen: false,
      largeIcon: FilePathAndroidBitmap(await getImagePath(imageUrl)),
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

  static Future<String> getImagePath(String? url) async {
    const defaultPath = 'assets/images/default_avatar.png';

    return url == null ? defaultPath : await createImageFileFromNetwork(url);
  }

  static Future createImageFileFromNetwork(String url) async {
    final response = await http.get(Uri.parse(url));

    final tempDirectory = await getTemporaryDirectory();
    final imagePath =
        '${tempDirectory.path}/${Random().nextInt(1000)}_notification_avatar.png';
    final imageFile = File(imagePath);

    await imageFile.writeAsBytes(response.bodyBytes);

    return imagePath;
  }
}
