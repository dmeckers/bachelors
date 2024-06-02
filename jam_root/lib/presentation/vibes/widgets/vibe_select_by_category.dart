import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/config/config.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam/presentation/vibes/edit_vibes/edit_vibes.controller.dart';
import 'package:jam/presentation/vibes/edit_vibes/row_floating_chips.row.dart';
import 'package:jam_utils/jam_utils.dart';

enum ChipState { focused, selected, focusedForDelete, none }

class VibeSelectByCategoryWidget extends HookConsumerWidget {
  const VibeSelectByCategoryWidget({super.key});

  ({ChipState state, Color color}) chipState({
    required bool isSelected,
    required bool isFocused,
  }) {
    return switch ((isSelected, isFocused)) {
      (true, false) => (state: ChipState.selected, color: Colors.green[800]!),
      (false, true) => (state: ChipState.focused, color: Colors.orange[800]!),
      (true, true) => (
          state: ChipState.focusedForDelete,
          color: Colors.red[800]!
        ),
      (false, false) => (state: ChipState.none, color: Colors.transparent),
    };
  }

  Widget chipWithGestureDetector({
    required int index,
    required Vibes vibes,
    required Vibes userSelectedVibes,
    required ValueNotifier<int?> focusedVibe,
    required ValueNotifier<int?> focusedSubVibes,
    required ValueNotifier<int?> stickyFocusVibe,
  }) {
    final isFocused = focusedVibe.value == index;
    return GestureDetector(
      onTap: () {
        focusedVibe.value = isFocused ? null : index;
        focusedSubVibes.value = null;
        stickyFocusVibe.value = null;
      },
      child: Chip(
        label: Text('${vibes[index].iconAsEmoji} ${vibes[index].name}'),
        color: WidgetStatePropertyAll(
          chipState(
                  isFocused: isFocused,
                  isSelected: userSelectedVibes
                      .map((e) => e.id)
                      .contains(vibes[index].id))
              .color,
        ),
      ),
    );
  }

  Widget animatedContainer(
    WidgetRef ref, {
    required ValueNotifier<int?> parentFocusedVibe,
    required Vibes vibes,
    required ValueNotifier<int?> thisGroupVibeFocus,
    void Function(VibeModel vibe)? onTap,
    ValueNotifier<int?>? stickyFocusVibe,
  }) {
    final r = Random();
    final childVibes = parentFocusedVibe.value != null
        ? vibes[parentFocusedVibe.value!].childVibes
        : stickyFocusVibe != null && stickyFocusVibe.value != null
            ? vibes[stickyFocusVibe.value!].childVibes
            : null;
    final parentValue = parentFocusedVibe.value ?? stickyFocusVibe?.value;
    final canShow = parentValue != null;

    return ref.watch(userEditVibesControllerProvider).maybeWhen(
          orElse: () => const JShimmer(),
          data: (selectedVibes) => AnimatedContainer(
            duration: const Duration(seconds: 1),
            height: canShow ? 200 : 0,
            child: canShow && childVibes.isNotNullOrEmpty
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14.0),
                    child: Wrap(
                      spacing: 18.0,
                      runSpacing: 4.0,
                      children: List.generate(
                        childVibes!.length,
                        (int index) {
                          final isSelected = selectedVibes
                              .map((e) => e.id)
                              .contains(childVibes[index].id);
                          final isFocused = thisGroupVibeFocus.value == index;

                          final chipsState = chipState(
                            isSelected: isSelected,
                            isFocused: isFocused,
                          );

                          return GestureDetector(
                            onTap: () {
                              final cb = switch (chipsState.state) {
                                ChipState.selected => () {
                                    thisGroupVibeFocus.value = index;
                                    if (stickyFocusVibe != null) {
                                      stickyFocusVibe.value = index;
                                    }
                                  },
                                ChipState.focusedForDelete => () {
                                    ref
                                        .read(userEditVibesControllerProvider
                                            .notifier)
                                        .removeVibe(vibe: childVibes[index]);

                                    thisGroupVibeFocus.value = null;
                                    if (stickyFocusVibe != null) {
                                      stickyFocusVibe.value = index;
                                    }
                                  },
                                ChipState.none => () {
                                    thisGroupVibeFocus.value = index;
                                    if (stickyFocusVibe != null) {
                                      stickyFocusVibe.value = index;
                                    }
                                  },
                                ChipState.focused => () {
                                    ref
                                        .read(userEditVibesControllerProvider
                                            .notifier)
                                        .addVibe(vibe: childVibes[index]);
                                    thisGroupVibeFocus.value = null;
                                    if (stickyFocusVibe != null) {
                                      stickyFocusVibe.value = index;
                                    }
                                  },
                              };

                              cb();
                              onTap?.call(childVibes[index]);
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: r.nextDouble() * 5,
                                right: r.nextDouble() * 5,
                                top: r.nextDouble() * 5,
                                bottom: r.nextDouble() * 5,
                              ),
                              child: Chip(
                                label: Text(childVibes[index].name),
                                color: WidgetStatePropertyAll(
                                  chipsState.color,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  )
                : null,
          ),
        );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final focusedVibeCategory = useState<int?>(null);
    final focusedVibeSubCategory = useState<int?>(null);
    final focusedVibeSubSubCategory = useState<int?>(null);

    final asyncCategorizedVibes$ =
        ref.watch(categorizedVibesControllerProvider);

    final isParentFocused = focusedVibeSubCategory.value != null;

    final stickyFocusVibe = useState<int?>(null);

    return asyncCategorizedVibes$.maybeWhen(
      data: (vibes) => Column(
        children: [
          RowFloatingChips(
            chips: List.generate(
              vibes.length,
              (index) => chipWithGestureDetector(
                index: index,
                focusedSubVibes: focusedVibeSubCategory,
                focusedVibe: focusedVibeCategory,
                userSelectedVibes: ref
                    .watch(userEditVibesControllerProvider)
                    .maybeWhen(orElse: () => [], data: (vibes) => vibes),
                vibes: vibes,
                stickyFocusVibe: stickyFocusVibe,
              ),
            ),
          ),
          animatedContainer(
            ref,
            parentFocusedVibe: focusedVibeCategory,
            vibes: vibes,
            thisGroupVibeFocus: focusedVibeSubCategory,
            stickyFocusVibe: stickyFocusVibe,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: animatedContainer(ref,
                parentFocusedVibe: focusedVibeSubCategory,
                vibes: isParentFocused
                    ? vibes[focusedVibeSubCategory.value!].childVibes ?? []
                    : stickyFocusVibe.value != null
                        ? vibes[stickyFocusVibe.value!].childVibes ?? []
                        : [],
                thisGroupVibeFocus: focusedVibeSubSubCategory,
                stickyFocusVibe: stickyFocusVibe),
          ),
        ],
      ),
      orElse: () => const JShimmer(),
    );
  }
}
