import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jam/config/config.dart';
import 'package:jam/data/data.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_utils/jam_utils.dart';

class RegisetVibeSelectPageView extends HookConsumerWidget
    with Storer, SelectVibeWidgetsMixin {
  const RegisetVibeSelectPageView({super.key});

  static const MAX_VIBES_AMOUNT = 20;

  searchVibes(
    Vibes selectedVibes,
    String value,
    WidgetRef ref,
    ValueNotifier<String?> searchQuery,
  ) {
    searchQuery.value = value;

    if (selectedVibes.length >= MAX_VIBES_AMOUNT || value.isEmpty) return;

    ref.read(vibesControllerProvider.notifier).searchVibes(query: value);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final debouncer = useDebouncer(duration: const Duration(milliseconds: 300));

    final selectedVibes = ref.watch(
      registerModelStateNotifierProvider.select((value) => value.vibes),
    );
    final searchQuery = useState<String?>(null);

    final searchVibesProvider = ref.watch(vibesControllerProvider);

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.65,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Headline(context),
                  VibeSearchBar(
                    onChange: (query) => debouncer(
                      () => searchVibes(
                        selectedVibes,
                        query,
                        ref,
                        searchQuery,
                      ),
                    ),
                  ),
                  ValidationErrors(context, selectedVibes),
                  SelectedVibeList(context, selectedVibes),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    transitionBuilder: (child, animation) => FadeTransition(
                      opacity: animation,
                      child: child,
                    ),
                    child: searchQuery.value.isNullOrEmpty
                        ? const RegisterVibeSelectByCategoryWidget()
                        : searchVibesProvider.maybeWhen(
                            data: (queryResults) {
                              if (queryResults.isEmpty) {
                                return const NotFoundPlaceholder(
                                  message: 'No results',
                                );
                              }

                              return ConstrainedBox(
                                constraints:
                                    const BoxConstraints(maxHeight: 300),
                                child: ListView.builder(
                                  itemBuilder: (ctx, index) {
                                    final notifier = ref.read(
                                        registerModelStateNotifierProvider
                                            .notifier);
                                    final name = queryResults[index].name;

                                    final hasSelected = selectedVibes
                                        .any((vibe) => vibe.name == name);
                                    return ListTile(
                                      onTap: () {
                                        if (hasSelected) {
                                          notifier.removeVibe(
                                            queryResults[index],
                                          );
                                          return;
                                        }

                                        notifier.addVibes(queryResults[index]);
                                      },
                                      leading: Icon(
                                        hasSelected
                                            ? FontAwesomeIcons.check
                                            : FontAwesomeIcons.plus,
                                        color: Colors.green,
                                      ),
                                      title: Text(queryResults[index].name),
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
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: ButtonWithLoader(
              size: const Size(200, 50),
              onPressed: () async => await ref
                  .read(registerModelStateNotifierProvider.notifier)
                  .handleRegister(
                    model: ref.read(registerModelStateNotifierProvider),
                  ),
              text: 'Sign Up',
              withSuccessGradient: true,
            ),
          )
        ],
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
