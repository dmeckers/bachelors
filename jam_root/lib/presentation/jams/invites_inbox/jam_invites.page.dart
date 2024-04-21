import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jam/config/config.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_ui/jam_ui.dart';

class JamInvitesPage extends HookConsumerWidget {
  const JamInvitesPage({super.key, required this.invites});

  final JamInvites invites;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final invitesState = useState(invites);

    return Scaffold(
      appBar: const SimpleAppBar(title: 'Jam Invites'),
      body: Center(
        child: invitesState.value.isNotEmpty
            ? ListView.builder(
                itemCount: invitesState.value.length,
                itemBuilder: (context, index) {
                  final invite = invitesState.value[index];
                  final sender = invite.sender;
                  return ShakesOnNoLongPress(
                    child: ListTile(
                      tileColor: context.jColor.primary.withAlpha(
                          ((255 / invitesState.value.length) * index) ~/ 3),
                      isThreeLine: true,
                      title: Text('Invite to: ${invite.jamName}'),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 15,
                              backgroundImage: NetworkImage(
                                sender.avatar ??
                                    ImagePathConstants
                                        .DEFAULT_AVATAR_IMAGE_BUCKET_URL,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Invited by: ${sender.username}',
                              style: context.jText.headlineMedium,
                            ),
                          ],
                        ),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove_red_eye_outlined),
                            onPressed: () => context.pushNamed(
                              JamRoutes.details.name,
                              pathParameters: {
                                'jamId': invite.jamId.toString()
                              },
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.check),
                            onPressed: () async => await _handleJamInviteAccept(
                              context,
                              ref,
                              invitesState,
                              invite,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.close),
                            onPressed: () async => _handleJamInviteReject(
                              context,
                              ref,
                              invitesState,
                              invite,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
            : const NotFoundPlaceholder(message: 'No invites found'),
      ),
    );
  }

  _handleJamInviteReject(
    BuildContext context,
    WidgetRef ref,
    ValueNotifier<JamInvites> invites,
    JamInviteModel rejected,
  ) async {
    _removeInviteFromState(invites, rejected);

    await ref.read(
      declineJamInviteProvider(inviteId: rejected.id).future,
    );

    if (context.mounted) {
      JSnackBar.show(
        context,
        description: 'Invite declined',
        type: SnackbarInfoType.info,
      );
    }

    ref.invalidate(getJamInvitesProvider);
  }

  _handleJamInviteAccept(
    BuildContext context,
    WidgetRef ref,
    ValueNotifier<JamInvites> invites,
    JamInviteModel accepted,
  ) async {
    _removeInviteFromState(invites, accepted);

    await ref.read(
      acceptJamInviteProvider(inviteId: accepted.id).future,
    );

    if (context.mounted) {
      JSnackBar.show(
        context,
        description: 'Jam invite accepted',
        type: SnackbarInfoType.success,
      );
    }

    ref.invalidate(getJamInvitesProvider);
  }

  void _removeInviteFromState(
    ValueNotifier<JamInvites> invites,
    JamInviteModel toRemove,
  ) {
    invites.value = invites.value
        .where(
          (element) => element.id != toRemove.id,
        )
        .toList();
  }
}
