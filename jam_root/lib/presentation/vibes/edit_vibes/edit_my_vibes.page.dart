import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jam/config/config.dart';
import 'package:jam/data/data.dart';
import 'package:jam/domain/vibes/vibe.model.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam/presentation/vibes/edit_vibes/edit_vibes.controller.dart';
import 'package:jam_ui/jam_ui.dart';
import 'package:jam_utils/jam_utils.dart';

class EditUserVibes extends HookConsumerWidget with ProfileRepositoryProviders {
  const EditUserVibes({super.key, this.vibes = const []});

  final Vibes? vibes;

  static const MAX_VIBES_AMOUNT = 20;

  searchVibesAI(
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
            .searchVibesAI(query: value);
      },
    );
  }

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
    final searchWithAI = useState(false);
    final isDirty = useState(false);

    final selectedVibes$ = ref.watch(userEditVibesControllerProvider);
    final vibes$ = ref.watch(searchVibesControllerProvider);
    final debouncer = useDebouncer(duration: const Duration(milliseconds: 300));
    final canPop = useState((vibes?.isEmpty ?? true) ? false : true);

    return PopScope(
      canPop: canPop.value,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Edit your vibes',
            style: TextStyle(fontSize: 14),
          ),
          automaticallyImplyLeading: (vibes?.isEmpty ?? true) ? false : true,
        ),
        body: SingleChildScrollView(
          child: selectedVibes$.maybeWhen(
            data: (selectedVibes) => Padding(
              padding:
                  const EdgeInsets.only(left: 18.0, right: 18.0, top: 20.0),
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
                        style: context.jText.headlineSmall
                            ?.copyWith(color: Colors.red),
                      ),
                    ),
                  _buildSearchTypeSwitcher(
                    searchWithAI,
                    context,
                  ),
                  const SizedBox(height: 10),
                  _buildSelectedUserChips(
                    selectedVibes,
                    ref,
                    isDirty,
                  ),
                  _buildVibeSelectList(
                    vibes$,
                    selectedVibes,
                    context,
                    ref,
                    isDirty,
                  ),
                  const SizedBox(height: 20),
                  if (isDirty.value && selectedVibes.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          ref
                              .read(userEditVibesControllerProvider.notifier)
                              .updateVibes(vibes: selectedVibes);

                          ref.invalidate(currentUserProfileProvider);
                          isDirty.value = false;
                          canPop.value = true;
                          context.pushNamed(SettingsRoutes.account.name);
                        },
                        child: const Text('Save'),
                      ),
                    ),
                ],
              ),
            ),
            orElse: () => const SizedBox(),
          ),
        ),
      ),
    );
  }

  ListTile _buildSearchTypeSwitcher(
    ValueNotifier<bool> searchWithAI,
    BuildContext context,
  ) {
    return ListTile(
      onTap: () => searchWithAI.value = !searchWithAI.value,
      contentPadding: EdgeInsets.zero,
      leading: searchWithAI.value
          ? const FaIcon(
              FontAwesomeIcons.wandMagic,
              size: 15,
            )
          : const FaIcon(
              FontAwesomeIcons.wandMagicSparkles,
              size: 15,
            ),
      title: Text(
        searchWithAI.value
            ? 'Default search'
            : 'Search with AI prompt (experimental)',
        style: context.jText.headlineSmall,
      ),
    );
  }

  Padding _buildVibeSelectList(
    AsyncValue<Vibes> vibes,
    List<VibeModel> selectedVibes,
    BuildContext context,
    WidgetRef ref,
    ValueNotifier<bool> isDirty,
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
            height: MediaQuery.of(context).size.height * 0.5,
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
                onTap: () {
                  ref
                      .read(userEditVibesControllerProvider.notifier)
                      .addVibe(vibe: filteredVibes[i]);
                  isDirty.value = true;
                },
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
          imageAssetPath: ImagePathConstants.ERROR_JAR_1,
          errorMessage:
              'Whoops! Failed to search vibes. Try again , if it fails switch on other search mode.',
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
      shape: MaterialStateProperty.all(RoundedRectangleBorder(
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

  void removeVibe(
    VibeModel e,
    WidgetRef ref,
    ValueNotifier<bool> isDirty,
  ) {
    ref.read(userEditVibesControllerProvider.notifier).removeVibe(vibe: e);
    isDirty.value = true;
  }

  _buildSelectedUserChips(
    Vibes selectedVibes,
    WidgetRef ref,
    ValueNotifier<bool> isDirty,
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
                    label: Text(
                      e.name.capitalize(),
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    shape: const StadiumBorder(),
                    padding: const EdgeInsets.all(2),
                    backgroundColor:
                        CHIP_COLORS[e.hashCode % CHIP_COLORS.length],
                    onDeleted: () => removeVibe(e, ref, isDirty),
                  ),
                )
                .toList(),
          ),
        ),
      );
}
