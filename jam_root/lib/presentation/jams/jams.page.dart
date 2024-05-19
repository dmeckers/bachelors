import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jam/presentation/presentation.dart';
import 'package:jam_utils/jam_utils.dart';

class JamPage extends HookConsumerWidget {
  const JamPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSearching = useState(false);
    final filter = useState<String?>(null);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: JamListAppBarWidget(
          filter: filter,
          isSearching: isSearching,
        ),
        body: ref.watch(jams$).when(
              data: (jams) {
                final j = jams.where((e) => filter.value.isNotEmptyOrNull
                    ? e.name.toLowerCase().contains(filter.value!.toLowerCase())
                    : true);

                final notOutdated = [...j.where((jam) => !jam.isOutdated)];
                return TabBarView(
                  children: [
                    JamListWidget(
                      jams: [...notOutdated.where((jam) => jam.isOwner)],
                    ),
                    JamListWidget(
                      jams: notOutdated,
                    ),
                    JamListWidget(
                      jams: [...jams.where((jam) => jam.isOutdated)],
                      canCreate: false,
                      placeholderTitle: 'No jams here',
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
}
