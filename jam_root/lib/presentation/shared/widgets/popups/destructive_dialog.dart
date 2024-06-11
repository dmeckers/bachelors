import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DestructiveDialog extends HookWidget {
  const DestructiveDialog({
    super.key,
    required this.onConfirm,
    required this.title,
    required this.subtitle,
    this.confirmMessage = 'Yes',
    this.extraConditionMessage,
  });

  final Function(bool? extraCondition) onConfirm;
  final String confirmMessage;
  final String title;
  final String? extraConditionMessage;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final extraCondition = useState<bool?>(null);

    return AlertDialog(
      actionsPadding: const EdgeInsets.only(top: 0, bottom: 16, right: 8),
      insetPadding: EdgeInsets.zero,
      contentPadding:
          const EdgeInsets.only(left: 24, right: 24, bottom: 0, top: 16),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      title: Text(title, style: const TextStyle(fontSize: 18)),
      content: _buildModalContent(context, extraCondition),
      actions: [
        _buildCancelDeleteChatButton(context),
        _buildConfirmDeleteChatButton(context, extraCondition),
      ],
    );
  }

  Widget _buildModalContent(
    BuildContext context,
    ValueNotifier<bool?> extraCondition,
  ) =>
      extraConditionMessage != null
          ? ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: subtitle.isNotEmpty
                    ? MediaQuery.of(context).size.height * 0.15
                    : 80,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(subtitle, style: const TextStyle(fontSize: 14)),
                  const Spacer(),
                  CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    value: extraCondition.value ?? false,
                    onChanged: (value) => extraCondition.value = value as bool,
                    title: Text(
                      extraConditionMessage!,
                      style: const TextStyle(fontSize: 14),
                    ),
                  )
                ],
              ),
            )
          : Text(subtitle, style: const TextStyle(fontSize: 14));

  TextButton _buildCancelDeleteChatButton(BuildContext context) => TextButton(
        onPressed: () => Navigator.pop(context),
        child: const Text(
          'Cancel',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      );

  TextButton _buildConfirmDeleteChatButton(
    BuildContext context,
    ValueNotifier<bool?> checkboxState,
  ) =>
      TextButton(
        onPressed: () {
          Navigator.pop(context);
          onConfirm(checkboxState.value);
        },
        child: const Text(
          'Yes',
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.w600),
        ),
      );
}
