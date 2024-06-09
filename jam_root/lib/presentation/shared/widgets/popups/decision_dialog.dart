import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:jam/config/config.dart';
import 'package:jam_utils/jam_utils.dart';

enum DecisionDialogType {
  listSelect,
  confirmDialogWithExtraCondition,
  confirmDialog;
}

class DecisionDialogData<T> {
  const DecisionDialogData({
    required this.title,
    this.subtitle,
    this.extraConditionMessage,
    this.confirmMessage = 'Yes',
    this.onConfirm,
    this.list,
    this.onCancel,
    this.type = DecisionDialogType.confirmDialog,
  });

  final Function(bool? extraCondition)? onConfirm;
  final Function()? onCancel;
  final List<T>? list;
  final String confirmMessage;
  final String title;
  final String? extraConditionMessage;
  final String? subtitle;
  final DecisionDialogType type;
}

class DecisionDialog extends StatelessWidget {
  const DecisionDialog({super.key, required this.dialogData});

  final DecisionDialogData dialogData;

  @override
  Widget build(BuildContext context) {
    return switch (dialogData.type) {
      DecisionDialogType.confirmDialog => _confirmDialog(context),
      DecisionDialogType.confirmDialogWithExtraCondition =>
        _confirmDialogWithExtraCondition(context),
      DecisionDialogType.listSelect => _listSelectDialog(),
    };
  }

  Widget _confirmDialog(BuildContext context) {
    return _dialogWrapper(
        content: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: dialogData.subtitle.isNotNullOrEmpty
                ? MediaQuery.of(context).size.height * 0.15
                : 80,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _dialogTextContent(),
          ),
        ),
        actions: _actionButtons(context));
  }

  Widget _confirmDialogWithExtraCondition(BuildContext context) {
    final extraConditionState = useState(false);

    return _dialogWrapper(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ..._dialogTextContent(),
          CheckboxListTile.adaptive(
            value: extraConditionState.value,
            onChanged: (v) =>
                extraConditionState.value = !extraConditionState.value,
            title: Text(
              dialogData.extraConditionMessage ?? 'Extra condition',
            ),
          ),
        ],
      ),
      actions: _actionButtons(context, extraConditionState),
    );
  }

  Widget _listSelectDialog() {
    return _dialogWrapper(content: const Text(''), actions: []);
  }

  List<Widget> _actionButtons(
    BuildContext context, [
    ValueNotifier<bool>? extraConditionState,
  ]) {
    return [
      TextButton(
        onPressed: () async {
          await dialogData.onCancel?.call();
          context.popIfMounted();
        },
        child: const Text(
          'Cancel',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      TextButton(
        onPressed: () async {
          await dialogData.onConfirm?.call(extraConditionState?.value);
          context.popIfMounted();
        },
        child: Text(
          dialogData.confirmMessage,
          style: const TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ];
  }

  Widget _dialogWrapper({
    required Widget content,
    required Widgets actions,
  }) {
    const contentPadding = EdgeInsets.only(
      left: 24,
      right: 24,
      bottom: 0,
      top: 6,
    );

    return AlertDialog(
      actionsPadding: const EdgeInsets.only(top: 0, bottom: 16, right: 8),
      insetPadding: EdgeInsets.zero,
      contentPadding: contentPadding,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      title: dialogData.subtitle.isNotEmptyOrNull
          ? Text(dialogData.title, style: const TextStyle(fontSize: 18))
          : null,
      content: content,
      actions: actions,
    );
  }

  Widgets _dialogTextContent() {
    return [
      if (dialogData.subtitle.isNullOrEmpty)
        Text(
          dialogData.title,
          style: const TextStyle(fontSize: 18),
        ),
      if (dialogData.subtitle.isNotEmptyOrNull)
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            dialogData.subtitle!,
            style: const TextStyle(fontSize: 16),
          ),
        ),
    ];
  }
}
