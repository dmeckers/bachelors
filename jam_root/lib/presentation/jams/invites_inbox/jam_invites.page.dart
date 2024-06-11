import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jam/config/config.dart';
import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_ui/jam_ui.dart';
import 'package:jam_utils/jam_utils.dart';

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
                  final inviteToText = 'Invite to: ${invite.jamName}'
                      '${invite.jamName.endsWith('jam') ? '' : ' jam'}';
                  return ShakesOnNoLongPress(
                    child: ListTile(
                      tileColor: context.jColor.primary.withAlpha(
                          ((255 / invitesState.value.length) * index) ~/ 3),
                      isThreeLine: true,
                      title: Text(
                        inviteToText,
                        style: context.jText.bodyMedium,
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 15,
                              backgroundImage: sender.avatarImageProvider,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Invited by: ${sender.fullName}',
                              style: context.jText.headlineSmall,
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
                              pathParameters: {'jamId': '${invite.jamId}'},
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.check),
                            onPressed: () async {
                              ScaffoldMessenger.maybeOf(context)?.showSnackBar(
                                const SnackBar(
                                  content: Text('Invite Accepted'),
                                ),
                              );
                              await _handleJamInviteAccept(
                                context,
                                ref,
                                invitesState,
                                invite,
                              );
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.close),
                            onPressed: () async {
                              ScaffoldMessenger.maybeOf(context)?.showSnackBar(
                                const SnackBar(
                                  content: Text('Invite Declined'),
                                ),
                              );
                              await _handleJamInviteReject(
                                context,
                                ref,
                                invitesState,
                                invite,
                              );
                            },
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
    _removeInviteFromList(invites, rejected);
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   Future.microtask(() {
    //     JSnackBar.show(
    //       context,
    //       const JSnackbarData(
    //         description: 'Invite declined',
    //         type: SnackbarInfoType.info,
    //       ),
    //     );
    //   });
    // });
    await ref
        .read(socialRepositoryProvider)
        .rejectJamInvite(inviteId: rejected.id);

    ref.invalidate(getJamInvitesProvider);
  }

  _handleJamInviteAccept(
    BuildContext context,
    WidgetRef ref,
    ValueNotifier<JamInvites> invites,
    JamInviteModel accepted,
  ) async {
    _removeInviteFromList(invites, accepted);
    // Future.microtask(() {

    // });
    // WidgetsBinding.instance.addPostFrameCallback((_) {});
    await ref
        .read(socialRepositoryProvider)
        .acceptJamInvite(inviteId: accepted.id);

    await ref.read(jamsStateProvider).invalidate();
    ref.invalidate(getJamInvitesProvider);
  }

  void _removeInviteFromList(
    ValueNotifier<JamInvites> invites,
    JamInviteModel toRemove,
  ) {
    invites.value = [...invites.value.where((inv) => inv.id != toRemove.id)];
  }
}
