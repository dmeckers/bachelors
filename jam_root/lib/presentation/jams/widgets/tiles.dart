import 'package:flutter/material.dart';

import 'package:jam/domain/domain.dart';
import 'package:jam_ui/jam_ui.dart';
import 'package:jam_utils/jam_utils.dart';

class JamDateTimeTile extends StatelessWidget {
  const JamDateTimeTile({super.key, required this.jam});

  final JamModel jam;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      subtitle: Text(
        'Date & Time',
        style: context.jText.headlineSmall,
      ),
      leading: const Icon(Icons.date_range_outlined),
      title: Text(
        DateTime.now().isAfter(jam.date)
            ? "${jam.date.nameWithoutYear} ${jam.date.year}"
            : "${jam.date.nameWithoutYear} at ${jam.date.atTime}",
        style: context.jText.bodySmall,
      ),
    );
  }
}

class JamParticipantsTile extends StatelessWidget {
  const JamParticipantsTile({super.key, required this.jam});

  final JamModel jam;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      subtitle: Text(
        'People joined so far ',
        style: context.jText.headlineSmall,
      ),
      leading: const Icon(Icons.people),
      title: Text(
        jam.participants.isNotEmpty
            ? formatParticipantNames(jam)
            : 'No one joined yet',
        style: context.jText.bodySmall,
      ),
    );
  }

  String formatParticipantNames(JamModel jam) {
    final participants = jam.participants;
    final participantNames =
        participants.take(7).map((e) => e.fullName).toList();

    final remainingCount = participants.length - participantNames.length;

    final displayNames = participantNames.join(', ');

    if (remainingCount > 0) {
      return '$displayNames... and $remainingCount more';
    } else {
      return displayNames;
    }
  }
}

class JamExtraInformationTile extends StatelessWidget {
  const JamExtraInformationTile({super.key, required this.jam});

  final JamModel jam;

  @override
  Widget build(BuildContext context) {
    return jam.extraInformation != null && jam.extraInformation!.isNotEmpty
        ? ListTile(
            subtitle: Text(
              'Extra Information',
              style: context.jText.headlineSmall,
            ),
            leading: const Icon(Icons.info_outline),
            title: Text(jam.extraInformation!),
          )
        : const SizedBox();
  }
}

class JamLocationNameTile extends StatelessWidget {
  const JamLocationNameTile({super.key, required this.jam});

  final JamModel jam;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      subtitle: Text(
        DateTime.now().isAfter(jam.date) ? "Happened in" : 'Will take place in',
        style: context.jText.headlineSmall,
      ),
      leading: const Icon(Icons.location_on),
      title: Text(
        jam.locationName ?? 'Unknown',
        style: context.jText.bodySmall,
      ),
    );
  }
}
