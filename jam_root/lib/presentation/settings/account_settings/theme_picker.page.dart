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

    final selectedTheme = useState(
      ThemeSwitcher.of(context).themeData.themeInfo,
    );

    final oldTheme = useMemoized(
      () => ThemeSwitcher.of(context).themeData.themeInfo,
      [selectedTheme.value],
    );

    final selectedColor = useState<Color?>(
        isCustomColorThemeDefined ? JamCustomColorTheme().color : null);

    return Scaffold(
      appBar: const SimpleAppBar(title: 'Choose theme'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 22.0),
            child: Text(
              'Select on of jams themes',
              style: context.jText.headlineMedium,
            ),
          ),
          const SizedBox(height: 20),
          ...SupportedThemes.values
              .where(
                (element) => element == SupportedThemes.customColorTheme
                    ? isCustomColorThemeDefined
                    : true,
              )
              .map(
                (e) => RadioListTile(
                  value: e,
                  groupValue: selectedTheme.value,
                  title: Text(e.displayName),
                  onChanged: (value) {
                    selectedTheme.value = value!;
                    if (e != oldTheme) {
                      JamTheme.setThemeMode(
                        mode: ThemeMode.system,
                        theme: e,
                        color: e == SupportedThemes.customColorTheme
                            ? selectedColor.value
                            : null,
                      );
                    }
                    ThemeSwitcher.of(context).switchTheme(_switchTheme(e));
                  },
                ),
              ),
          const SizedBox(height: 20),
          Center(
            child: Text(
              'Or select color of theme by yourself',
              style: context.jText.headlineMedium,
            ),
          ),
          const SizedBox(height: 20),
          Center(
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
        ],
      ),
    );
  }

  _switchTheme(SupportedThemes theme) => switch (theme) {
        SupportedThemes.cobraTheme => JamCobraTheme(),
        SupportedThemes.monaTheme => JamMonaTheme(),
        SupportedThemes.defaultTheme => JamDefaultTheme(),
        SupportedThemes.customColorTheme =>
          JamCustomColorTheme().isDefined != null &&
                  JamCustomColorTheme().isDefined!
              ? JamCustomColorTheme()
              : JamDefaultTheme(),
      };
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
