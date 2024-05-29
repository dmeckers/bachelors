import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jam/config/config.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam_ui/jam_ui.dart';
import 'package:jam_utils/jam_utils.dart';

class SelectVibe extends HookConsumerWidget {
  const SelectVibe({super.key});

  static const MAX_VIBES_AMOUNT = 20;

  searchVibesAI(
    Vibes selectedVibes,
    String value,
    WidgetRef ref,
    Debouncer debouncer,
  ) {
    debouncer(() {
      if (selectedVibes.length >= MAX_VIBES_AMOUNT || value.isEmpty) return;

      ref.read(vibesControllerProvider.notifier).searchVibesAI(query: value);
    });
  }

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
    final searchWithAI = useState(false);

    final selectedVibes = ref.watch(
      registerModelStateNotifierProvider.select((value) => value.vibes),
    );
    final vibesWithColors = selectedVibes
        .map(
          (e) => (
            e,
            CHIP_COLORS[selectedVibes.indexOf(e) % CHIP_COLORS.length],
          ),
        )
        .toList();
    final vibes = ref.watch(vibesControllerProvider);
    final debouncer = useDebouncer(duration: const Duration(milliseconds: 300));

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.6,
        maxWidth: MediaQuery.of(context).size.width * 0.9,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select at least one thing you like',
              style: context.jText.headlineLarge,
            ),
            const SizedBox(height: 20),
            _buildSearchBar(
              searchWithAI,
              selectedVibes,
              ref,
              debouncer,
            ),
            if (selectedVibes.length >= MAX_VIBES_AMOUNT)
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 4.0),
                child: Text(
                  'You can select up to $MAX_VIBES_AMOUNT vibes',
                  style:
                      context.jText.headlineSmall?.copyWith(color: Colors.red),
                ),
              ),
            _buildSearchTypeSwitcher(
              searchWithAI,
              context,
            ),
            const SizedBox(height: 10),
            _buildSelectedUserChips(
              vibesWithColors,
              ref,
            ),
            _buildVibeSelectList(
              vibes,
              selectedVibes,
              context,
              ref,
            ),
          ],
        ),
      ),
    );
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
    ValueNotifier<bool> searchWithAI,
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
      onChanged: (value) => searchWithAI.value
          ? searchVibes(
              selectedVibes,
              value,
              ref,
              debouncer,
            )
          : searchVibesAI(
              selectedVibes,
              value,
              ref,
              debouncer,
            ),
    );
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
}
