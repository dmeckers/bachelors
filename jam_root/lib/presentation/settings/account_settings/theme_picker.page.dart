import 'package:flutter/material.dart';
import 'package:flutter_circle_color_picker/flutter_circle_color_picker.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jam/presentation/presentation.dart';
import 'package:jam_theme/jam_theme.dart';
import 'package:jam_ui/jam_ui.dart';

class ThemePickerPage extends HookConsumerWidget {
  const ThemePickerPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isCustomColorThemeDefined = JamCustomColorTheme().isDefined != null &&
        JamCustomColorTheme().isDefined!;

    final selectedColor = useState<Color?>(
        isCustomColorThemeDefined ? JamCustomColorTheme().color : null);

    return Scaffold(
      appBar: const SimpleAppBar(title: 'Choose theme'),
      body: Center(
        child: ElevatedButton(
          onPressed: () => showDialog(
            context: context,
            builder: (context) => _ColorPickerDialog(
              onColorSelect: (color) {
                selectedColor.value = color;
                JamTheme.setThemeMode(
                    mode: ThemeMode.system,
                    theme: SupportedThemes.customColorTheme,
                    color: color);
                ThemeSwitcher.of(context).switchTheme(
                  JamCustomColorTheme(),
                );
              },
            ),
          ),
          child: const Text('Select color from pallete'),
        ),
      ),
    );
  }
}

class _ColorPickerDialog extends HookWidget {
  const _ColorPickerDialog({required this.onColorSelect});

  final void Function(Color) onColorSelect;

  @override
  Widget build(BuildContext context) {
    final selectedColor = useState<Color?>(null);

    return AlertDialog(
      title: const Text('Pick a color'),
      content: SizedBox(
        height: 300,
        width: 300,
        child: Align(
          alignment: Alignment.center,
          child: CircleColorPicker(
            size: const Size(210, 210),
            strokeWidth: 2,
            thumbSize: 32,
            colorCodeBuilder: (context, color) => const SizedBox(),
            onEnded: (value) => selectedColor.value = value,
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        if (selectedColor.value != null)
          TextButton(
            onPressed: () {
              onColorSelect(selectedColor.value!);
              Navigator.pop(context);
            },
            child: const Text('Select'),
          ),
      ],
    );
  }
}
