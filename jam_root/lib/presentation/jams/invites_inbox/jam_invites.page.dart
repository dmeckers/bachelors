import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jam/config/config.dart';
import 'package:jam/presentation/presentation.dart';

class JamInvitesPage extends HookConsumerWidget {
  const JamInvitesPage({super.key, required this.invites});

  final JamInvites invites;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final jamIds = invites.map((e) => e.jamId).toList();

    final trash = useState([]);

    return Scaffold(
      appBar: const SimpleAppBar(title: 'Jam Invites'),
      body: Center(
        child: FutureBuilder(
          future: ref.read(
            getJamNamesByIdsProvider(
              jamIds: jamIds,
            ).future,
          ),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }

            if (snapshot.hasError) {
              return JamErrorBox(errorMessage: snapshot.error.toString());
            }

            final data = snapshot.data as IdsWithNames;

            return data.isNotEmpty || !(trash.value.length == invites.length)
                ? ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      final jam = data[index];
                      final invite = invites[index];

                      if (trash.value.contains(invite.id)) {
                        return const SizedBox();
                      }

                      return ListTile(
                        contentPadding: const EdgeInsets.only(
                          top: 8,
                          left: 14,
                          right: 8,
                        ),
                        title: Text(jam.$2),
                        trailing: SizedBox(
                          width: 200,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove_red_eye_outlined),
                                onPressed: () => context.pushNamed(
                                  JamRoutes.details.name,
                                  pathParameters: {'jamId': jam.$1.toString()},
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.check),
                                onPressed: () {
                                  ref.read(
                                    acceptJamInviteProvider(
                                        inviteId: invite.id),
                                  );

                                  JSnackBar.show(
                                    context,
                                    description: 'Jam invite accepted',
                                    type: SnackbarInfoType.success,
                                  );

                                  ref.invalidate(getJamInvitesProvider);
                                  trash.value = [...trash.value, invite.id];
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.close),
                                onPressed: () {
                                  ref.read(
                                    declineJamInviteProvider(
                                        inviteId: invite.id),
                                  );

                                  JSnackBar.show(
                                    context,
                                    description: 'Invite declined',
                                    type: SnackbarInfoType.info,
                                  );

                                  ref.invalidate(getJamInvitesProvider);
                                  trash.value = [...trash.value, invite.id];
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )
                : const NotFoundPlaceholder(message: 'No invites found');
          },
        ),
      ),
    );
  }
}
