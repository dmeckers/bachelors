import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';

class FilledFormPage extends HookConsumerWidget {
  const FilledFormPage({super.key, required this.joinRequest});

  final JamJoinRequestModel joinRequest;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (joinRequest.seenAt != null) return;

      ref
          .read(jamDetailsStateProvider(joinRequest.jamId).notifier)
          .updateSeenAt(joinRequest.id);
    });

    return Scaffold(
      appBar: const SimpleAppBar(
        title: 'Form preview',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(joinRequest.filledForm!.title),
                ...joinRequest.filledForm!.elements.map(
                  (e) => switch (e.type) {
                    JamFormElementType.checkboxInput => const Text('checkbox'),
                    JamFormElementType.dateInput => const Text('date input'),
                    JamFormElementType.radioInput => const Text('radio input'),
                    JamFormElementType.textInput => ListTile(
                        title: Text(e.label ?? 'No label'),
                        subtitle: Text(e.value ?? 'No response'),
                      ),
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
