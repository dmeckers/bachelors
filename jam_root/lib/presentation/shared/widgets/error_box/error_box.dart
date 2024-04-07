import 'dart:math';

import 'package:flutter/material.dart';

import 'package:jam/config/config.dart';

class JamErrorBox extends StatelessWidget {
  final String errorMessage;

  static const ERROR_IMAGES = [
    ImagePathConstants.ERROR_JAR_1,
    ImagePathConstants.ERROR_JAR_2,
    ImagePathConstants.ERROR_JAR_3,
  ];

  final String? imageAssetPath;

  const JamErrorBox({
    super.key,
    required this.errorMessage,
    this.compact = false,
    this.imageAssetPath,
  });

  final bool compact;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: compact ? 100.0 : 200.0,
            width: compact ? 100.0 : 200.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  imageAssetPath ??
                      ERROR_IMAGES[Random().nextInt(ERROR_IMAGES.length)],
                ),
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              'Error Occured',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10.0),
          Text(
            errorMessage,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}
