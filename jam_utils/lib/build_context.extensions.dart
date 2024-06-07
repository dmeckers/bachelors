import 'package:flutter/material.dart';

extension BuildContextExtensions on BuildContext {
  void pushIfMounted(String routeName) {
    if (mounted) {
      Navigator.of(this).pushNamed(routeName);
    }
  }

  T? doIfMounted<T>(T Function() callback) {
    if (mounted) {
      return callback();
    }

    return null;
  }
}
