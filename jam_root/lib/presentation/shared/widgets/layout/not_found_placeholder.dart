import 'package:flutter/material.dart';

import 'package:jam/config/config.dart';
import 'package:jam_ui/jam_ui.dart';

class NotFoundPlaceholder extends StatelessWidget {
  const NotFoundPlaceholder({
    super.key,
    this.message,
    this.backgroundColor,
  });

  final String? message;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          color: backgroundColor,
          width: MediaQuery.of(context).size.width * 0.5,
          height: MediaQuery.of(context).size.width * 0.5,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                ImagePathConstants.NOT_FOUND_JAR_PATH,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10.0),
        Text(
          message ?? '',
          style: context.jText.headlineMedium?.copyWith(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
