// ignore: file_names
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:jam/presentation/presentation.dart';

enum SnackbarInfoType { error, success, warning, info }

class JSnackBar {
  static void show(
    BuildContext context, {
    String? description,
    SnackbarInfoType? type,
    String? title,
    String? avatarUrl,
    Function? onTap,
  }) {
    JCherryToast(
      title: title != null
          ? Text(
              title,
              style: const TextStyle(color: Colors.black, fontSize: 14),
            )
          : null,
      icon: switch (type) {
        SnackbarInfoType.error => Icons.error,
        SnackbarInfoType.success => Icons.check,
        SnackbarInfoType.warning => Icons.warning,
        SnackbarInfoType.info => Icons.info,
        _ => Icons.info,
      },
      onTap: onTap,
      iconWidget: avatarUrl != null
          ? CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(avatarUrl),
            )
          : null,
      themeColor: switch (type) {
        SnackbarInfoType.error => Colors.red,
        SnackbarInfoType.success => Colors.green,
        SnackbarInfoType.warning => Colors.orange,
        SnackbarInfoType.info => Colors.blue,
        _ => Colors.blue,
      },
      animationDuration: const Duration(milliseconds: 300),
      toastDuration: const Duration(seconds: 2),
      animationCurve: Curves.ease,
      description: description != null
          ? Text(
              description,
              style: const TextStyle(color: Colors.black, fontSize: 12),
            )
          : null,
      animationType: AnimationType.fromTop,
    ).show(context);
  }
}
