import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/config/config.dart';

import 'package:jam/presentation/jams/state/jams_state.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam/presentation/user/user_state.dart';
import 'package:jam_ui/jam_ui.dart';

class JamPage extends HookConsumerWidget {
  const JamPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: _buildAppBar(context, ref),
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

  AppBar _buildAppBar(BuildContext context, WidgetRef ref) {
    final jamInvites = ref.watch(getJamInvitesProvider);

    final ownerJams = ref
        .read(userStateProvider)
        .getLastValue()
        .jams
        .where((jam) => jam.isOwner && !jam.isOutdated);

    return AppBar(
      title: Text(
        'Jams',
        style: context.jText.bodyMedium
            ?.copyWith(color: context.jTheme.primaryColor),
      ),
      actions: [
        IconButton(
          onPressed: () => _handleToggleCardView(ref),
          icon: const Icon(Icons.view_list),
        ),
        jamInvites.maybeWhen(
          data: (data) => MenuAnchor(
            menuChildren: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: MenuItemButton(
                  onPressed: () =>
                      context.pushNamed(JamRoutes.invites.name, extra: data),
                  leadingIcon: const FaIcon(
                    FontAwesomeIcons.paperPlane,
                    size: 15,
                  ),
                  child: const Text('Jam invites'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: MenuItemButton(
                  onPressed: () {
                    ownerJams.length <= 3
                        ? context.pushNamed(JamRoutes.createNew.name)
                        : JSnackBar.show(
                            context,
                            title: 'You can only create 3 jams at a time',
                          );
                  },
                  leadingIcon: const Icon(
                    Icons.add,
                    size: 15,
                  ),
                  child: const Text('Create jam'),
                ),
              )
            ],
            builder: (context, controller, child) => data.isNotEmpty
                ? Badge(
                    label: Text(data.length.toString()),
                    alignment: Alignment.topRight,
                    offset: const Offset(-23, 5),
                    child: _buildJamMenuButton(controller),
                  )
                : _buildJamMenuButton(controller),
          ),
          orElse: () => const Icon(Icons.more_vert),
        )
      ],
      bottom: TabBar(
        tabs: [
          _buildTab(context, 'My jams'),
          _buildTab(context, 'Upcoming jams'),
          _buildTab(context, 'Old jams'),
        ],
      ),
    );
  }

  IconButton _buildJamMenuButton(MenuController controller) {
    return IconButton(
      onPressed: () =>
          controller.isOpen ? controller.close() : controller.open(),
      icon: const Icon(Icons.more_vert),
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
