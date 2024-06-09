// ignore: file_names
import 'dart:collection';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:jam/presentation/presentation.dart';

enum SnackbarInfoType { error, success, warning, info }

class JSnackBar {
  static Queue<JSnackbarData> jSnackbarQueue = Queue<JSnackbarData>();
  static bool isShowing = false;

  static void show(BuildContext context, JSnackbarData data) {
    jSnackbarQueue.add(data);

    if (!isShowing) {
      _show(context);
    }
  }

  static void _show(BuildContext context) {
    if (jSnackbarQueue.isEmpty) {
      return;
    }

    final data = jSnackbarQueue.removeFirst();
    isShowing = true;

    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        JCherryToast(
          snackbarQueue: jSnackbarQueue,
          backgroundColor: Colors.black,
          onToastClosed: () {
            isShowing = false;
            _show(context);
          },
          title: data.title != null
              ? Text(
                  data.title!,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                )
              : null,
          icon: switch (data.type) {
            SnackbarInfoType.error => Icons.error,
            SnackbarInfoType.success => Icons.check,
            SnackbarInfoType.warning => Icons.warning,
            SnackbarInfoType.info => Icons.info,
            _ => Icons.info,
          },
          iconColor: Colors.white,
          onTap: data.onTap,
          iconWidget: data.avatarUrl != null
              ? CircleAvatar(
                  backgroundImage: CachedNetworkImageProvider(data.avatarUrl!),
                )
              : null,
          themeColor: switch (data.type) {
            SnackbarInfoType.error => Colors.red,
            SnackbarInfoType.success => Colors.green,
            SnackbarInfoType.warning => Colors.orange,
            SnackbarInfoType.info => Colors.blue,
            _ => Colors.blue,
          },
          animationDuration: const Duration(milliseconds: 3000),
          toastDuration: const Duration(seconds: 2),
          animationCurve: Curves.ease,
          description: data.description != null
              ? Text(
                  data.description!,
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                )
              : null,
          animationType: AnimationType.fromLeft,
        ).show(context);
      },
    );
  }
}

class JSnackbarData {
  final String? description;
  final SnackbarInfoType? type;
  final String? title;
  final String? avatarUrl;
  final Function? onTap;

  const JSnackbarData({
    this.description,
    this.type,
    this.title,
    this.avatarUrl,
    this.onTap,
  });
}

// a(){
//   jSnackbarQueue.add(JSnackbarData(
//     description: 'Failed to send password reset link',
//     type: SnackbarInfoType.error,
//   ));

//   jSnackbarQueue.removeFirst()
// }
// final jsnackbarQueueStateProvider = StateProvider<Queue<JSnackbarData>>(
//   (ref) => Queue<JSnackbarData>(),
// );


