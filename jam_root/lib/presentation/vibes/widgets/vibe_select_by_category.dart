import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/config/config.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam/presentation/vibes/edit_vibes/edit_my_vibes.page.dart';
import 'package:jam/presentation/vibes/edit_vibes/edit_vibes.controller.dart';
import 'package:jam/presentation/vibes/edit_vibes/row_floating_chips.row.dart';
import 'package:jam_ui/jam_ui.dart';
import 'package:jam_utils/jam_utils.dart';

enum ChipState { focused, selected, focusedForDelete, none }

class VibeSelectByCategoryWidget extends HookConsumerWidget {
  const VibeSelectByCategoryWidget({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final focusedVibeCategory = useState<int?>(null);
    final focusedVibeSubCategory = useState<int?>(null);
    final focusedVibeDevision = useState<int?>(null);

    final nextSubCategory = useState<int?>(null);

    final asyncCategorizedVibes$ = ref.watch(
      categorizedVibesControllerProvider,
    );

    return asyncCategorizedVibes$.when(
      data: (categorizedVibes) {
        final vibeSubCategories = focusedVibeCategory.value.isNotNull
            ? categorizedVibes[focusedVibeCategory.value!].childVibes ?? []
            : Vibes.empty();

        final vibeDevisions = nextSubCategory.value.isNotNull
            ? vibeSubCategories[nextSubCategory.value!].childVibes ?? []
            : Vibes.empty();

        return SingleChildScrollView(
          child: Column(
            children: [
              RowFloatingChips(
                chips: List.generate(
                  categorizedVibes.length,
                  (index) => chipWithGestureDetector(
                    ref,
                    index: index,
                    nextSubCategory: nextSubCategory,
                    focusedVibe: focusedVibeCategory,
                    vibe: categorizedVibes[index],
                  ),
                ),
              ),
              if (focusedVibeCategory.value.isNotNull)
                Text('Subcategories', style: context.jText.headlineSmall),
              _vibeSubCategorySection(
                ref,
                isParentFocused: focusedVibeCategory.value.isNotNull,
                children: vibeSubCategories,
                focusedCategory: focusedVibeSubCategory,
                nextSubCategory: nextSubCategory,
                hasChildren: true,
              ),
              if (nextSubCategory.value.isNotNull)
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Text(
                    'Subcategory Devisions',
                    style: context.jText.headlineSmall,
                  ),
                ),
              _vibeSubCategorySection(
                ref,
                isParentFocused: focusedVibeSubCategory.value.isNotNull,
                children: vibeDevisions,
                focusedCategory: focusedVibeDevision,
                nextSubCategory: nextSubCategory,
                hasChildren: false,
              ),
            ],
          ),
        );
      },
      error: (error, _) => const SizedBox(),
      loading: () => const JShimmer(),
    );
  }

  ({RegisterChipState state, Color color}) chipState({
    required bool isSelected,
    required bool isFocused,
  }) =>
      switch ((isSelected, isFocused)) {
        (true, false) => (
            state: RegisterChipState.selected,
            color: Colors.green[800]!
          ),
        (false, true) => (
            state: RegisterChipState.focused,
            color: Colors.orange[800]!
          ),
        (true, true) => (
            state: RegisterChipState.focusedForDelete,
            color: Colors.red[800]!
          ),
        (false, false) => (
            state: RegisterChipState.none,
            color: Colors.transparent
          ),
      };

  Widget chipWithGestureDetector(
    WidgetRef ref, {
    required int index,
    required VibeModel vibe,
    required ValueNotifier<int?> focusedVibe,
    required ValueNotifier<int?> nextSubCategory,
  }) {
    final isFocused = focusedVibe.value == index;

    return ref.watch(userEditVibesControllerProvider).when(
          data: (selectedVibes) {
            final isSelected = selectedVibes.map((e) => e.id).contains(vibe.id);
            return GestureDetector(
              onTap: () {
                focusedVibe.value = isFocused ? null : index;
                nextSubCategory.value = null;
              },
              child: Chip(
                label: Text('${vibe.iconAsEmoji} ${vibe.name}'),
                color: WidgetStatePropertyAll(
                  chipState(isSelected: isSelected, isFocused: isFocused).color,
                ),
              ),
            );
          },
          error: (e, s) => const SizedBox(),
          loading: () => const SizedBox(),
        );
  }

  _vibeSubCategorySection(
    WidgetRef ref, {
    required bool isParentFocused,
    required Vibes children,
    required ValueNotifier<int?> focusedCategory,
    required ValueNotifier<int?>? nextSubCategory,
    required bool hasChildren,
  }) {
    final toHide = nextSubCategory?.value.isNotNull ?? false
        ? nextSubCategory!.value.isNull
        : !isParentFocused;

    markAsDirty() {
      final isPristine = ref.read(didChangesStateProvider);

      if (!isPristine) {
        ref.read(didChangesStateProvider.notifier).state = true;
      }
    }

    if (toHide) return const SizedBox();

    return ref.watch(userEditVibesControllerProvider).when(
          data: (selectedVibes) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: Wrap(
                spacing: 18,
                runSpacing: 4,
                children: List.generate(
                  children.length,
                  (index) {
                    final selectedVibe = children[index];
                    final chipsState = chipState(
                      isSelected:
                          selectedVibes.any((v) => v.id == selectedVibe.id),
                      isFocused: focusedCategory.value == index,
                    );

                    return GestureDetector(
                      onTap: () async {
                        await HapticFeedback.selectionClick();

                        (switch (chipsState.state) {
                          RegisterChipState.selected => () {
                              if (hasChildren) nextSubCategory?.value = index;

                              focusedCategory.value = index;
                            },
                          RegisterChipState.focusedForDelete => () {
                              vmNotifier(ref).removeVibe(vibe: selectedVibe);
                              focusedCategory.value = null;
                              markAsDirty();
                            },
                          RegisterChipState.none => () {
                              if (hasChildren) nextSubCategory?.value = index;

                              focusedCategory.value = index;
                            },
                          RegisterChipState.focused => () {
                              if (selectedVibes.length.isMoreThan(19)) return;
                              vmNotifier(ref).addVibe(vibe: selectedVibe);
                              focusedCategory.value = null;
                              markAsDirty();
                            },
                        })();
                      },
                      child: Chip(
                        label: Text(children[index].name),
                        color: WidgetStatePropertyAll(chipsState.color),
                      ),
                    );
                  },
                ),
              ),
            );
          },
          error: (e, s) => const SizedBox(),
          loading: () => const SizedBox(),
        );
  }

  UserEditVibesController vmNotifier(WidgetRef ref) => ref.read(
        userEditVibesControllerProvider.notifier,
      );
}
