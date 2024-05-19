import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/config/config.dart';

import 'package:jam/presentation/jams/state/jams_state.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_ui/jam_ui.dart';

class JamPage extends HookConsumerWidget {
  const JamPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSearching = useState(false);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: _buildAppBar(context, ref, isSearching),
        body: ref.watch(jams$).when(
              data: (jams) {
                final notOutdated = [...jams.where((jam) => !jam.isOutdated)];
                return TabBarView(
                  children: [
                    _buildJamList(
                      context,
                      [...notOutdated.where((jam) => jam.isOwner)],
                    ),
                    _buildJamList(
                      context,
                      notOutdated,
                    ),
                    _buildJamList(
                      context,
                      [...jams.where((jam) => jam.isOutdated)],
                      true,
                    ),
                  ],
                );
              },
              error: (e, s) => const JamErrorBox(
                  errorMessage: 'Whoops! Something went wrong fetching jams!'),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
      ),
    );
  }

  AppBar _buildAppBar(
    BuildContext context,
    WidgetRef ref,
    ValueNotifier<bool> isSearching,
  ) {
    final jamInvites = ref.watch(getJamInvitesProvider);

    return AppBar(
      title: Text(
        'Jams',
        style: context.jText.bodyMedium
            ?.copyWith(color: context.jTheme.primaryColor),
      ),
      actions: [
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: isSearching.value
              ? Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        final ownerJams = ref
                            .read(jamsStateProvider)
                            .jams
                            .where((jam) => jam.isOwner && !jam.isOutdated);

                        ownerJams.length < AppConfigConstants.MAX_JAM_PER_USER
                            ? context.pushNamed(JamRoutes.createNew.name)
                            : JSnackBar.show(
                                context,
                                title: 'You can only create 3 jams at a time',
                              );
                      },
                      icon: const Icon(
                        Icons.add,
                        size: 20,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        isSearching.value = true;
                      },
                      icon: const Icon(
                        Icons.search,
                        size: 20,
                      ),
                    ),
                    jamInvites.maybeWhen(
                      data: (data) => Badge(
                        label: Text('${data.length}'),
                        isLabelVisible: data.isNotEmpty,
                        alignment: Alignment.topRight,
                        offset: const Offset(-23, 5),
                        child: _buildJamInvitesInboxButton(
                          () => context.pushNamed(JamRoutes.invites.name,
                              extra: data),
                        ),
                      ),
                      orElse: () => _buildJamInvitesInboxButton(() => {}),
                    ),
                    IconButton(
                      onPressed: () => _handleToggleCardView(ref),
                      icon: const Icon(
                        Icons.view_list,
                        size: 20,
                      ),
                    ),
                  ],
                )
              : IconButton(
                  onPressed: () {
                    isSearching.value = false;
                  },
                  icon: Icon(Icons.abc_sharp),
                ),
        ),
      ],
    );
  }

  IconButton _buildJamInvitesInboxButton(void Function()? onPressed) {
    return IconButton(
      onPressed: onPressed,
      icon: const Icon(
        FontAwesomeIcons.inbox,
        size: 20,
      ),
    );
  }

  Tab _buildTab(BuildContext context, String tabName) {
    return Tab(
      child: Text(
        tabName,
        maxLines: 1,
        style: context.jText.bodyMedium,
      ),
    );
  }

  _buildJamList(
    BuildContext context,
    Jams jams, [
    bool outdated = false,
  ]) =>
      JamListWidget(
        jams: jams,
        canCreate: !outdated,
        placeholderTitle: outdated ? 'No jams here' : null,
      );

  _handleToggleCardView(WidgetRef ref) {
    ref.read(jamCardViewStateProvider.notifier).toggle();
  }
}
