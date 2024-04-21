import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/generated/l10n.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_ui/jam_ui.dart';

class PinMessageDialog extends HookConsumerWidget with ChattingProviders {
  const PinMessageDialog({super.key, required this.message});

  final MessageModel message;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pinForBoth = useState<bool>(false);

    return AlertDialog(
      actionsPadding: const EdgeInsets.only(top: 0, bottom: 16, right: 8),
      insetPadding: EdgeInsets.zero,
      contentPadding:
          const EdgeInsets.only(left: 24, right: 24, bottom: 0, top: 16),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      content: _buildModalContent(context, pinForBoth),
      actions: [
        _buildCancelActionButton(context),
        _buildPinMessageButton(context, ref, pinForBoth)
      ],
    );
  }

  TextButton _buildPinMessageButton(
    BuildContext context,
    WidgetRef ref,
    ValueNotifier<bool> pinForBoth,
  ) =>
      TextButton(
        onPressed: () => _handlePinMessage(
          context,
          ref,
          pinForBoth.value,
        ),
        child: Text(
          S.of(context).yes,
          style: context.jText.bodySmall,
        ),
      );

  TextButton _buildCancelActionButton(BuildContext context) => TextButton(
        onPressed: () => context.pop(),
        child: Text(
          S.of(context).cancel,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
      );

  _handlePinMessage(BuildContext context, WidgetRef ref, bool forEveryone) {
    ref.read(messagesRepositoryProvider).pinMessage(
          message: message,
          forEveryone: forEveryone,
        );
    context.pop();
  }

  Widget _buildModalContent(
    BuildContext context,
    ValueNotifier<bool?> checkboxState,
  ) =>
      ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 100),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).pinThisMessageInChat,
              textAlign: TextAlign.left,
              style: context.jText.headlineMedium,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Checkbox(
                  value: checkboxState.value,
                  onChanged: (value) => checkboxState.value = value as bool,
                ),
                Text(
                  S.of(context).pinForEveryoneInChat,
                  style: const TextStyle(fontSize: 14),
                )
              ],
            ),
          ],
        ),
      );
}
