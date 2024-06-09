import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jam/config/config.dart';
import 'package:jam/data/data.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam/presentation/user/user_state.dart';
import 'package:jam/presentation/vibes/edit_vibes/edit_vibes.dart';
import 'package:jam_ui/jam_ui.dart';
import 'package:jam_utils/jam_utils.dart';

final didChangesStateProvider = StateProvider<bool>((ref) => false);

class EditUserVibes extends HookConsumerWidget
    with ProfileRepositoryProviders, Storer {
  const EditUserVibes({
    super.key,
    this.vibes = const [],
  });

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
    final didChanges = ref.watch(didChangesStateProvider);
    final can = canPop.value && !didChanges;

    return PopScope(
      canPop: can,
      onPopInvoked: (didPop) {
        if (didChanges) {
          showDialog(
            context: context,
            builder: (ctx) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: DecisionDialog(
                dialogData: DecisionDialogData(
                  title: 'Leave page',
                  subtitle:
                      'You have unsaved changes. Are you sure you want to leave?',
                  onConfirm: (_) {
                    ref.invalidate(didChangesStateProvider);
                    WidgetsBinding.instance.addPostFrameCallback(
                      (_) => context.canPop() ? context.pop() : null,
                    );
                  },
                  onCancel: () {},
                ),
              ),
            ),
          );
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text(
            'Edit your vibes',
            style: TextStyle(fontSize: 14),
          ),
          automaticallyImplyLeading: userVibesState.value.isNotEmpty,
        ),
        body: asyncWrapped(
          ref: ref,
          presenter: (selectedVibes) => Column(
            children: [
              _headline(context),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: _searchBar(
                  (value) {
                    searchQuery.value = value;
                    searchVibes(selectedVibes, value, ref, debouncer);
                  },
                ),
              ),
              if (selectedVibes.length >= MAX_VIBES_AMOUNT)
                _validationError(context),
              if (selectedVibes.isNotEmpty)
                _selectedVibes(selectedVibes, context),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        transitionBuilder: (child, animation) => FadeTransition(
                          opacity: animation,
                          child: child,
                        ),
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
                                      constraints:
                                          const BoxConstraints(maxHeight: 500),
                                      child: ListView.builder(
                                        itemBuilder: (ctx, index) {
                                          final notifier = ref.read(
                                              userEditVibesControllerProvider
                                                  .notifier);
                                          final name = queryResults[index].name;

                                          final hasSelected = selectedVibes
                                              .any((vibe) => vibe.name == name);
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
                                            title:
                                                Text(queryResults[index].name),
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
                padding: const EdgeInsets.all(8.0),
                child: ButtonWithLoader(
                  onPressed: () async {
                    if (selectedVibes.isEmpty) return;

                    await ref
                        .read(vibesRepositoryProvider)
                        .updateVibes(vibes: selectedVibes);

                    ref
                        .read(userStateProvider)
                        .updateVibes(vibes: selectedVibes);

                    ref.invalidate(didChangesStateProvider);
                    context.popIfMounted();
                  },
                  text: selectedVibes.isNotEmpty
                      ? 'Save Vibes'
                      : 'Select at least one vibe',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding _selectedVibes(Vibes selectedVibes, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        'Selected Vibes: ${selectedVibes.map((el) => el.name).join(',')}',
        style: context.jText.headlineSmall,
      ),
    );
  }

  Flexible _validationError(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, top: 4.0, bottom: 100),
        child: Text(
          'You can select up to $MAX_VIBES_AMOUNT vibes',
          style: context.jText.headlineSmall?.copyWith(color: Colors.red),
        ),
      ),
    );
  }

  Padding _headline(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        'Select at least one thing you like',
        style: context.jText.headlineLarge,
      ),
    );
  }

  Widget asyncWrapped({
    required Widget Function(Vibes) presenter,
    required WidgetRef ref,
  }) =>
      ref.watch(userEditVibesControllerProvider).maybeWhen(
            data: presenter,
            orElse: () => const Center(
              child: CircularProgressIndicator(),
            ),
          );

  // _a(){
  //   }

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
