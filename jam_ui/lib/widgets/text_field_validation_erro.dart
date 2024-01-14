import 'package:flutter/material.dart';
import 'package:jam_ui/jam_ui.dart';

class TextFieldValidationError extends StatelessWidget {
  const TextFieldValidationError({super.key, this.errorMessage});

  final String? errorMessage;

  @override
  Widget build(BuildContext context) => errorMessage != null
      ? Text(
          errorMessage!,
          style: context.jText.bodySmall!.copyWith(color: Colors.red),
        )
      : const SizedBox.shrink();
}
