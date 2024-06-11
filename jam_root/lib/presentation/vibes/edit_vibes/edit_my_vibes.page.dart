import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jam/config/config.dart';
import 'package:jam/data/data.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam/presentation/user/user_state.dart';
import 'package:jam/presentation/vibes/edit_vibes/edit_vibes.dart';
import 'package:jam_utils/jam_utils.dart';

final didChangesStateProvider = StateProvider<bool>((ref) => false);

class EditUserVibes extends HookConsumerWidget
    with ProfileRepositoryProviders, Storer, SelectVibeWidgetsMixin {
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
    ValueNotifier<String?> searchQuery,
  ) {
    if (selectedVibes.length >= MAX_VIBES_AMOUNT || value.isEmpty) return;
    searchQuery.value = value;
    ref.read(searchVibesControllerProvider.notifier).searchVibes(query: value);
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
      onPopInvoked: (didPop) => onPop(context, ref, didChanges),
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
          asyncVibes: ref.watch(userEditVibesControllerProvider),
          ref: ref,
          presenter: (selectedVibes) => Column(
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
                      )),
              ValidationErrors(context, selectedVibes),
              SelectedVibeList(context, selectedVibes),
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
                            : _VibeSelectBySearch(selectedVibes: selectedVibes),
                      ),
                    ],
                  ),
                ),
              ),
              SubmitButton(selectedVibes, ref, context)
            ],
          ),
        ),
      ),
    );
  }

  Padding SubmitButton(
    Vibes selectedVibes,
    WidgetRef ref,
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ButtonWithLoader(
        onPressed: () async {
          if (selectedVibes.isEmpty) return;

          await ref
              .read(vibesRepositoryProvider)
              .updateVibes(vibes: selectedVibes);

          ref.read(userStateProvider).updateVibes(vibes: selectedVibes);

          ref.invalidate(didChangesStateProvider);
          context.popIfMounted();
        },
        text: selectedVibes.isNotEmpty
            ? 'Save Vibes'
            : 'Select at least one vibe',
      ),
    );
  }

  onPop(BuildContext context, WidgetRef ref, bool didChanges) {
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
  }
}

class _VibeSelectBySearch extends HookConsumerWidget
    with SelectVibeWidgetsMixin {
  const _VibeSelectBySearch({required this.selectedVibes});

  final Vibes selectedVibes;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(userEditVibesControllerProvider.notifier);
    return ref.watch(searchVibesControllerProvider).maybeWhen(
          data: (queryResults) {
            return queryResults.isNotEmpty
                ? ConstrainedBox(
                    constraints: const BoxConstraints(maxHeight: 500),
                    child: ListView.builder(
                      itemBuilder: (ctx, index) {
                        final vibe = queryResults[index];
                        final hasSelected = selectedVibes.any(
                          (v) => v.name == vibe.name,
                        );
                        return VibeListTile(
                          onTap: () {
                            if (selectedVibes.length.isMoreThan(20)) return;
                            hasSelected
                                ? notifier.removeVibe(vibe: vibe)
                                : notifier.addVibe(vibe: vibe);
                          },
                          hasSelected: hasSelected,
                          vibe: queryResults[index],
                        );
                      },
                      itemCount: queryResults.length,
                    ),
                  )
                : const NotFoundPlaceholder(message: 'No results');
          },
          orElse: () => const Center(
            child: CircularProgressIndicator(),
          ),
        );
  }
}
