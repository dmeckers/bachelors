import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:jam_ui/jam_ui.dart';

class InputDialog extends HookWidget {
  const InputDialog({
    super.key,
    required this.onConfirm,
    required this.title,
    this.icon,
    this.initialValue,
    this.rules,
  });

  final IconData? icon;
  final String title;
  final String? initialValue;
  final Future Function(String value) onConfirm;
  final String? Function(String value)? rules;

  @override
  Widget build(BuildContext context) {
    final inputController = useTextEditingController();
    final dialogWidth = MediaQuery.of(context).size.width * 0.8;
    final validationMessages = useState<String?>(null);

    return AlertDialog(
      actionsPadding: const EdgeInsets.only(top: 0, bottom: 16, right: 8),
      insetPadding: EdgeInsets.zero,
      contentPadding:
          const EdgeInsets.only(left: 24, right: 24, bottom: 0, top: 16),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      title: Text(title, style: const TextStyle(fontSize: 18)),
      content: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: dialogWidth,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            JInputSimple(
              controller: inputController,
              initialValue: initialValue,
            ),
            if (validationMessages.value != null)
              Container(
                width: dialogWidth * 0.9,
                padding: const EdgeInsets.only(top: 16),
                child: Text(
                  validationMessages.value!,
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 12,
                  ),
                ),
              ),
          ],
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            if (rules != null && rules!(inputController.text.trim()) != null) {
              validationMessages.value = rules!(inputController.text.trim());
              return;
            }
            onConfirm(inputController.text);
            Navigator.of(context).pop();
          },
          icon: Icon(icon ?? Icons.check_circle_outline),
        )
      ],
    );
  }
}

class FixedInputDialog extends StatelessWidget {
  const FixedInputDialog({
    super.key,
    required this.onConfirm,
    required this.title,
    this.icon,
    this.initialValue,
    this.rules,
  });

  final IconData? icon;
  final String title;
  final String? initialValue;
  final Future Function(String value) onConfirm;
  final String? Function(String value)? rules;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: MediaQuery.of(context).size.height * 0.3,
          left: MediaQuery.of(context).size.width * 0.05,
          child: InputDialog(
            title: title,
            initialValue: initialValue,
            onConfirm: onConfirm,
            rules: rules,
          ),
        ),
      ],
    );
  }
}
