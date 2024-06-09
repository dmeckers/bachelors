import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/config/config.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_ui/jam_ui.dart';
import 'package:jam_utils/jam_utils.dart';

class JamListAppBarWidget extends HookConsumerWidget
    implements PreferredSizeWidget {
  const JamListAppBarWidget({
    super.key,
    required this.filter,
    required this.isSearching,
  });

  final ValueNotifier<String?> filter;
  final ValueNotifier<bool> isSearching;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final jamInvites = ref.watch(getJamInvitesProvider);
    final debouncer = useDebouncer(duration: const Duration(milliseconds: 500));

    return AppBar(
      bottom: TabBar(
        tabs: [
          _buildTab(context, 'My Jams'),
          _buildTab(context, 'All Jams'),
          _buildTab(context, 'Outdated Jams'),
        ],
      ),
      title: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: !isSearching.value
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Jams',
                    style: context.jText.bodyMedium
                        ?.copyWith(color: context.jTheme.primaryColor),
                  ),
                  Row(
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
                                  const JSnackbarData(
                                    title: 'You can only create'
                                        ' ${AppConfigConstants.MAX_JAM_PER_USER}'
                                        'jams at a time',
                                  ),
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
                        onPressed: () => ref
                            .read(jamCardViewStateProvider.notifier)
                            .toggle(),
                        icon: const Icon(
                          Icons.view_list,
                          size: 20,
                        ),
                      ),
                    ],
                  )
                ],
              )
            : Row(
                children: [
                  Expanded(
                    child: TextField(
                      autofocus: true,
                      onChanged: (v) => debouncer(() => filter.value = v),
                      style: const TextStyle(fontSize: 18),
                      decoration: const InputDecoration(
                        hintText: 'Search jams',
                        hintStyle: TextStyle(fontSize: 18),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      filter.value = null;
                      isSearching.value = false;
                    },
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
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

  IconButton _buildJamInvitesInboxButton(void Function()? onPressed) {
    return IconButton(
      onPressed: onPressed,
      icon: const Icon(
        FontAwesomeIcons.inbox,
        size: 20,
      ),
    );
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(DEFAULT_APP_BAR_HEIGHT + TOOLBAR_HEIGHT);
}
