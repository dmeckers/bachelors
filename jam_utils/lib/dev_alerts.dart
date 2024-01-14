import 'package:flutter/material.dart';

void showUnimplementedSnackbar(BuildContext context) =>
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('To be implemented!'),
      ),
    );
