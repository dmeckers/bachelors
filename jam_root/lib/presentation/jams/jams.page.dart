import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_ui/jam_ui.dart';

class JamPage extends HookConsumerWidget {
  const JamPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: _buildAppBar(context, ref),
        body: TabBarView(
          children: [
            Consumer(
              builder: (ctx, ref, child) => _buildAsyncValueWrapper(
                ctx,
                ref.watch(userJamControllerProvider),
              ),
            ),
            Consumer(
              builder: (ctx, ref, child) => _buildAsyncValueWrapper(
                ctx,
                ref.watch(getParticipatingJamsProvider),
              ),
            ),
            Consumer(
              builder: (ctx, ref, child) => _buildAsyncValueWrapper(
                ctx,
                ref.watch(getOutdatedJamsProvider),
                true,
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context, WidgetRef ref) {
    final jamInvites = ref.watch(getJamInvitesProvider);

    return AppBar(
      title: Text(
        'Jams',
        style: context.jText.bodyMedium
            ?.copyWith(color: context.jTheme.primaryColor),
      ),
      actions: [
        IconButton(
          onPressed: () => _handleToggleCardView(context, ref),
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
                  onPressed: () => context.pushNamed(JamRoutes.createNew.name),
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
          //like literally idgaf
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

  _buildAsyncValueWrapper(
    BuildContext context,
    AsyncValue<List<JamModel>> jams, [
    bool outdated = false,
  ]) =>
      Container(
        child: jams.when(
          data: (data) => JamListWidget(
            jams: data,
            canCreate: !outdated,
            placeholderTitle: outdated ? 'No jams here' : null,
          ),
          error: (error, _) => const Center(
            child: JamErrorBox(
              errorMessage: 'Whoops! Failed to load jams',
            ),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );

  _handleToggleCardView(BuildContext context, WidgetRef ref) {
    ref.read(jamCardViewStateProvider.notifier).toggle();
  }
}
