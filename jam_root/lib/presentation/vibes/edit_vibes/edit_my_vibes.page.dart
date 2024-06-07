import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jam/config/config.dart';
import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam/presentation/vibes/edit_vibes/edit_vibes.dart';
import 'package:jam_ui/jam_ui.dart';
import 'package:jam_utils/jam_utils.dart';

class EditUserVibes extends HookConsumerWidget
    with ProfileRepositoryProviders, Storer {
  const EditUserVibes({super.key, this.vibes = const []});

  final Vibes? vibes;

  static const MAX_VIBES_AMOUNT = 20;

  searchVibes(
    Vibes selectedVibes,
    String value,
    WidgetRef ref,
    Debouncer debouncer,
  ) {
    debouncer(
      () {
        if (selectedVibes.length >= MAX_VIBES_AMOUNT || value.isEmpty) return;
        ref
            .read(searchVibesControllerProvider.notifier)
            .searchVibes(query: value);
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final debouncer = useDebouncer(duration: const Duration(milliseconds: 300));
    final userVibesState = useState(vibes ?? []);
    final canPop = useState(userVibesState.value.isNotEmpty);
    final searchQuery = useState<String?>(null);

    return PopScope(
      canPop: canPop.value,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text(
            'Edit your vibes',
            style: TextStyle(fontSize: 14),
          ),
          automaticallyImplyLeading: userVibesState.value.isNotEmpty,
        ),
        body: ref.watch(userEditVibesControllerProvider).maybeWhen(
              orElse: () => const Center(
                child: CircularProgressIndicator(),
              ),
              data: (selectedVibes) => Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Select at least one thing you like',
                      style: context.jText.headlineLarge,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: _searchBar((value) {
                      searchQuery.value = value;
                      searchVibes(selectedVibes, value, ref, debouncer);
                    }),
                  ),
                  if (selectedVibes.length >= MAX_VIBES_AMOUNT)
                    Flexible(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, top: 4.0, bottom: 100),
                        child: Text(
                          'You can select up to $MAX_VIBES_AMOUNT vibes',
                          style: context.jText.headlineSmall
                              ?.copyWith(color: Colors.red),
                        ),
                      ),
                    ),
                  if (selectedVibes.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Selected Vibes: ${selectedVibes.map((el) => el.name).join(',')}',
                        style: context.jText.headlineSmall,
                      ),
                    ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          transitionBuilder: (child, animation) {
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                          child: searchQuery.value.isNullOrEmpty
                              ? const VibeSelectByCategoryWidget()
                              : ref
                                  .watch(searchVibesControllerProvider)
                                  .maybeWhen(
                                    data: (queryResults) {
                                      if (queryResults.isEmpty) {
                                        return const NotFoundPlaceholder(
                                          message: 'No results',
                                        );
                                      }

                                      return ConstrainedBox(
                                        constraints: const BoxConstraints(
                                            maxHeight: 300),
                                        child: ListView.builder(
                                          itemBuilder: (ctx, index) {
                                            final notifier = ref.read(
                                                userEditVibesControllerProvider
                                                    .notifier);
                                            final name =
                                                queryResults[index].name;

                                            final hasSelected =
                                                selectedVibes.any((vibe) =>
                                                    vibe.name == name);
                                            return ListTile(
                                              onTap: () {
                                                if (hasSelected) {
                                                  notifier.removeVibe(
                                                    vibe: queryResults[index],
                                                  );
                                                  return;
                                                }

                                                notifier.addVibe(
                                                    vibe: queryResults[index]);
                                              },
                                              leading: Icon(
                                                hasSelected
                                                    ? FontAwesomeIcons.check
                                                    : FontAwesomeIcons.plus,
                                                color: Colors.green,
                                              ),
                                              title: Text(
                                                  queryResults[index].name),
                                            );
                                          },
                                          itemCount: queryResults.length,
                                        ),
                                      );
                                    },
                                    orElse: () => const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ButtonWithLoader(
                            onPressed: () async {
                              if (selectedVibes.isEmpty) return;
                              await ref
                                  .read(vibesRepositoryProvider)
                                  .updateVibes(vibes: selectedVibes);
                              final cached = get<UserProfileModel>();
                              if (cached != null) {
                                await refresh(
                                    cached.copyWith(vibes: selectedVibes));
                              }

                              // todo fix it later
                              // see router strategy
                              canPop.value = true;
                              if (!context.mounted) return;
                              context.pushNamed(HomeRoutes.home.name);
                            },
                            text: selectedVibes.isNotEmpty
                                ? 'Save Vibes'
                                : 'Select at least one vibe',
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
      ),
    );
  }

  SearchBar _searchBar(
    void Function(String)? onChanged,
  ) {
    return SearchBar(
      constraints: const BoxConstraints(
        maxHeight: 60,
        minHeight: 60,
      ),
      leading: const Icon(Icons.search),
      shape: WidgetStateProperty.all(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      )),
      hintText: 'Find topics you like',
      onChanged: onChanged,
    );
  }
}
