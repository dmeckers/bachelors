import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';

class JamCardBottomSheetActions extends ConsumerWidget {
  const JamCardBottomSheetActions({super.key, required this.jam});

  final JamModel jam;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BottomSheetLayout(
      children: [
        _buildShowInMapTile(context),
        if (!jam.isPast) _buildInviteFriendsTile(context, jam),
        if (jam.isOwner && !jam.isPast) _buildEditTile(context),
        if (jam.isOwner && !jam.isPast) _buildDeleteTile(context, ref),
      ],
    );
  }

  ListTile _buildDeleteTile(BuildContext context, WidgetRef ref) {
    return ListTile(
      leading: const Icon(Icons.delete),
      title: const Text('Delete'),
      onTap: () => showDialog(
        context: context,
        builder: (context) => DestructiveDialog(
          onConfirm: (_) => _handleDeleteJam(context, ref, jam),
          title: 'Delete jam',
          subtitle: 'Are you sure you want to delete this jam?',
        ),
      ),
    );
  }

  ListTile _buildEditTile(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.edit),
      title: const Text('Edit'),
      onTap: () {
        _hideJamCardBottomSheet(context);
        context.pushNamed(
          JamRoutes.edit.name,
          pathParameters: {
            'jamId': jam.id.toString(),
          },
          extra: jam,
        );
      },
    );
  }

  ListTile _buildInviteFriendsTile(BuildContext context, JamModel jam) {
    return ListTile(
      leading: const Icon(Icons.mail),
      title: const Text('Invite friends'),
      onTap: () => showDialog(
        context: context,
        builder: (ctx) => InviteFriendToJamDialog(
          jam: jam,
        ),
      ),
    );
  }

  ListTile _buildShowInMapTile(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.map),
      title: const Text('Open in Maps'),
      onTap: () {
        Navigator.of(context).pop();
        context.pushNamed(
          MapRoutes.map.name,
          queryParameters: {MapRoutes.map.pathParameter!: jam.location},
        );
      },
    );
  }

  void _handleDeleteJam(BuildContext context, WidgetRef ref, JamModel jam) {
    ref.read(deleteJamProvider(jam: jam).future).then(
          (_) async => await ref.read(jamsStateProvider).invalidate(),
        );
  }

  void _hideJamCardBottomSheet(BuildContext context) {
    Navigator.of(context).pop();
  }
}
