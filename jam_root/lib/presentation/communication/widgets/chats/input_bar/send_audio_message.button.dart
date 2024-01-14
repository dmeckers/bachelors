// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum MediaMessageMode { audio, video, recording }

final mediaMessageModeProvider =
    StateProvider<MediaMessageMode>((ref) => MediaMessageMode.audio);

class SendAudioMessageButton extends HookConsumerWidget {
  const SendAudioMessageButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // demo
    final isRecording = useState(false);

    return GestureDetector(
        onTap: () => _toggleMediaMessageMode(ref),
        onLongPress: () {
          HapticFeedback.vibrate();
          isRecording.value = true;
        },
        onLongPressEnd: (details) {
          isRecording.value = false;
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
              color: isRecording.value ? Colors.blue : Colors.transparent,
              borderRadius: isRecording.value
                  ? BorderRadius.circular(100)
                  : BorderRadius.circular(0)),
          child: AnimatedPadding(
            duration: const Duration(milliseconds: 200),
            padding: EdgeInsets.symmetric(
                horizontal: isRecording.value ? 12 : 8, vertical: 12),
            child: const Icon(Icons.mic),
          ),
        ));
  }

  void _toggleMediaMessageMode(WidgetRef ref) {
    final currentMode = ref.watch(mediaMessageModeProvider);
    ref.read(mediaMessageModeProvider.notifier).state =
        currentMode == MediaMessageMode.audio
            ? MediaMessageMode.video
            : MediaMessageMode.audio;
  }
}
