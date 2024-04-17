import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jam/presentation/presentation.dart';

class SendVideoMessageButton extends ConsumerWidget with ChattingProviders {
  const SendVideoMessageButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
        onLongPress: () {
          HapticFeedback.vibrate();
          debugPrint('Record video');
        },
        onTap: () => _toggleMediaMessageMode(ref),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
          child: Icon(Icons.photo_camera_outlined),
        ));
  }

  void _toggleMediaMessageMode(WidgetRef ref) {
    final currentMode = ref.read(mediaMessageModeProvider.notifier).state;
    ref.read(mediaMessageModeProvider.notifier).state =
        currentMode == MediaMessageMode.audio
            ? MediaMessageMode.video
            : MediaMessageMode.audio;
  }
}
