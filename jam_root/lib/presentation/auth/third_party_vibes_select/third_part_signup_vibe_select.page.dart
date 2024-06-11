import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/config/config.dart';
import 'package:jam/data/data.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam/presentation/vibes/edit_vibes/edit_vibes.controller.dart';
import 'package:jam_utils/jam_utils.dart';

class ThirdPartySignUpVibeSelect extends HookConsumerWidget
    with SelectVibeWidgetsMixin {
  const ThirdPartySignUpVibeSelect({super.key});

  searchVibes(
    Vibes selectedVibes,
    String value,
    WidgetRef ref,
    ValueNotifier<String?> searchQuery,
  ) {
    if (selectedVibes.length >= maxVibesAmount || value.isEmpty) return;
    searchQuery.value = value;
    ref.read(searchVibesControllerProvider.notifier).searchVibes(query: value);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final debouncer = useDebouncer(duration: const Duration(milliseconds: 300));
    final userVibesState = useState([]);
    final canPop = useState(userVibesState.value.isNotEmpty);
    final searchQuery = useState<String?>(null);
    // supaAuth.signOut().then((z) => {});

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
                ),
              ),
              Legend(),
              ValidationErrors(context, selectedVibes),
              SelectedVibeList(context, selectedVibes),
              Expanded(
                child: SingleChildScrollView(
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
                            : _VibeSelectBySearch(
                                selectedVibes: selectedVibes,
                              ),
                      ),
                    ],
                  ),
                ),
              ),
              SubmitButton(
                selectedVibes,
                ref,
                context,
                userVibesState,
              )
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
    ValueNotifier<List> userVibesState,
  ) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: ButtonWithLoader(
        size: const Size(250, 50),
        onPressed: () async {
          if (selectedVibes.isEmpty) return;

          await ref
              .read(vibesRepositoryProvider)
              .updateVibes(vibes: selectedVibes);

          userVibesState.value = selectedVibes;
          context.doIfMounted(() => context.goNamed(HomeRoutes.home.name));
        },
        text: selectedVibes.isNotEmpty ? 'Save' : 'Select at least one vibe',
      ),
    );
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
          data: (queryResults) => queryResults.isNotEmpty
              ? ConstrainedBox(
                  constraints: const BoxConstraints(maxHeight: 500),
                  child: ListView.builder(
                    itemBuilder: (ctx, index) {
                      final vibe = queryResults[index];
                      final hasSelected = selectedVibes.any(
                        (vibe) => vibe.name == vibe.name,
                      );
                      return VibeListTile(
                        onTap: () {
                          !hasSelected
                              ? notifier.addVibe(vibe: vibe)
                              : notifier.removeVibe(vibe: vibe);
                        },
                        vibe: vibe,
                        hasSelected: hasSelected,
                      );
                    },
                    itemCount: queryResults.length,
                  ),
                )
              : const NotFoundPlaceholder(message: 'No results'),
          orElse: () => const Center(
            child: CircularProgressIndicator(),
          ),
        );
  }
}
