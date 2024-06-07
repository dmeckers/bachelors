import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jam/config/config.dart';
import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_ui/jam_ui.dart';
import 'package:jam_utils/jam_utils.dart';

class SelectVibe extends HookConsumerWidget with Storer {
  const SelectVibe({super.key});

  static const MAX_VIBES_AMOUNT = 20;

  searchVibes(
    Vibes selectedVibes,
    String value,
    WidgetRef ref,
    Debouncer debouncer,
  ) {
    debouncer(() {
      if (selectedVibes.length >= MAX_VIBES_AMOUNT || value.isEmpty) return;

      ref.read(vibesControllerProvider.notifier).searchVibes(query: value);
    });
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
      child: SingleChildScrollView(
        child: Column(
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
                  padding:
                      const EdgeInsets.only(left: 8.0, top: 4.0, bottom: 100),
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
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
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
                          constraints: const BoxConstraints(maxHeight: 300),
                          child: ListView.builder(
                            itemBuilder: (ctx, index) {
                              final notifier = ref.read(
                                  registerModelStateNotifierProvider.notifier);
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
            )
          ],
        ),
      ),
    );

    // return ConstrainedBox(
    //   constraints: BoxConstraints(
    //     maxHeight: MediaQuery.of(context).size.height * 0.6,
    //     maxWidth: MediaQuery.of(context).size.width * 0.9,
    //   ),
    //   child: SingleChildScrollView(
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Text(
    //           'Select at least one thing you like',
    //           style: context.jText.headlineLarge,
    //         ),
    //         const SizedBox(height: 20),
    //         _buildSearchBar(
    //           selectedVibes,
    //           ref,
    //           debouncer,
    //         ),
    //         if (selectedVibes.length >= MAX_VIBES_AMOUNT)
    //           Padding(
    //             padding: const EdgeInsets.only(left: 8.0, top: 4.0),
    //             child: Text(
    //               'You can select up to $MAX_VIBES_AMOUNT vibes',
    //               style:
    //                   context.jText.headlineSmall?.copyWith(color: Colors.red),
    //             ),
    //           ),
    //         _buildSearchTypeSwitcher(
    //           searchWithAI,
    //           context,
    //         ),
    //         const SizedBox(height: 10),
    //         _buildSelectedUserChips(
    //           vibesWithColors,
    //           ref,
    //         ),
    //         _buildVibeSelectList(
    //           vibes,
    //           selectedVibes,
    //           context,
    //           ref,
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }

  Row _buildSearchTypeSwitcher(
    ValueNotifier<bool> searchWithAI,
    BuildContext context,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
          onPressed: () => searchWithAI.value = !searchWithAI.value,
          icon: searchWithAI.value
              ? const FaIcon(
                  FontAwesomeIcons.wandMagic,
                  size: 15,
                )
              : const FaIcon(
                  FontAwesomeIcons.wandMagicSparkles,
                  size: 15,
                ),
        ),
        Text(
          searchWithAI.value
              ? 'Default search'
              : 'Search with AI prompt (experimental)',
          style: context.jText.headlineSmall,
        ),
      ],
    );
  }

  Padding _buildVibeSelectList(
    AsyncValue<VibesCollection> vibes,
    List<VibeModel> selectedVibes,
    BuildContext context,
    WidgetRef ref,
  ) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: vibes.when(
        data: (vibes) {
          final filteredVibes = vibes
              .where(
                (element) => !selectedVibes.contains(element),
              )
              .toList();

          if (filteredVibes.isEmpty) return const SizedBox();
          return Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
              color: context.jTheme.cardColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.grey,
                width: 1,
              ),
            ),
            child: ListView.builder(
              itemBuilder: (_, i) => ListTile(
                onTap: () => ref
                    .read(registerModelStateNotifierProvider.notifier)
                    .addVibes(filteredVibes[i]),
                title: Text(
                  filteredVibes[i].name,
                  style: context.jText.bodySmall,
                ),
                leading: const CircleAvatar(
                  maxRadius: 15,
                  child: Icon(Icons.cookie_outlined),
                ),
              ),
              itemCount: filteredVibes.length,
            ),
          );
        },
        error: (e, s) => const JamErrorBox(
          errorMessage: 'Whoops! Failed to load vibes',
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  SearchBar _buildSearchBar(
    List<VibeModel> selectedVibes,
    WidgetRef ref,
    Debouncer debouncer,
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
        hintText: 'Find your vibe',
        onChanged: (value) => searchVibes(
              selectedVibes,
              value,
              ref,
              debouncer,
            ));
  }

  void removeVibe(VibeModel e, WidgetRef ref) =>
      ref.read(registerModelStateNotifierProvider.notifier).removeVibe(e);

  _buildSelectedUserChips(
    List<(VibeModel, Color)> selectedVibes,
    WidgetRef ref,
  ) =>
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Wrap(
            alignment: WrapAlignment.start,
            spacing: 10,
            children: selectedVibes
                .map(
                  (e) => Chip(
                    label:
                        Text(e.$1.name, style: const TextStyle(fontSize: 12)),
                    shape: const StadiumBorder(),
                    padding: const EdgeInsets.all(2),
                    backgroundColor: e.$2,
                    onDeleted: () => removeVibe(e.$1, ref),
                  ),
                )
                .toList(),
          ),
        ),
      );

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
