import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/config/config.dart';
import 'package:jam/presentation/presentation.dart';
import 'package:jam/presentation/vibes/edit_vibes/edit_vibes.controller.dart';
import 'package:jam/presentation/vibes/edit_vibes/row_floating_chips.row.dart';

enum RegisterChipState { focused, selected, focusedForDelete, none }

//TODO::decompose this widget
class RegisterVibeSelectByCategoryWidget extends HookConsumerWidget {
  const RegisterVibeSelectByCategoryWidget({super.key});

  ({RegisterChipState state, Color color}) RegisterchipState({
    required bool isSelected,
    required bool isFocused,
  }) {
    return switch ((isSelected, isFocused)) {
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
  }

  Widget chipWithGestureDetector({
    required int index,
    required Vibes vibes,
    required Vibes userSelectedVibes,
    required ValueNotifier<int?> focusedVibe,
    required ValueNotifier<int?> nextSubCategory,
  }) {
    final isFocused = focusedVibe.value == index;
    return GestureDetector(
      onTap: () {
        focusedVibe.value = isFocused ? null : index;
        nextSubCategory.value = null;
      },
      child: Chip(
        label: Text('${vibes[index].iconAsEmoji} ${vibes[index].name}'),
        color: WidgetStatePropertyAll(
          RegisterchipState(
                  isFocused: isFocused,
                  isSelected: userSelectedVibes
                      .map((e) => e.id)
                      .contains(vibes[index].id))
              .color,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final focusedVibeCategory = useState<int?>(null);
    final nextSubCategory = useState<int?>(null);
    final focusedVibeSubCategory = useState<int?>(null);

    final focusedVibeSubSubCategory = useState<int?>(null);

    final asyncCategorizedVibes$ =
        ref.watch(categorizedVibesControllerProvider);

    final selectedVibes = ref.watch(
      registerModelStateNotifierProvider.select((value) => value.vibes),
    );

    final isParentFocused = focusedVibeCategory.value != null;

    return asyncCategorizedVibes$.when(
      data: (categorizedVibes) {
        // final userSelectedVibes = data.last;
        final r = Random();
        return Column(
          children: [
            RowFloatingChips(
              chips: List.generate(
                categorizedVibes.length,
                (index) => chipWithGestureDetector(
                  index: index,
                  nextSubCategory: nextSubCategory,
                  focusedVibe: focusedVibeCategory,
                  userSelectedVibes: selectedVibes,
                  vibes: categorizedVibes,
                ),
              ),
            ),
            SizedBox(
              height: isParentFocused ? 200 : 0,
              child: isParentFocused
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14.0),
                      child: Wrap(
                        spacing: 18.0,
                        runSpacing: 4.0,
                        children: List.generate(
                          categorizedVibes[focusedVibeCategory.value!]
                              .childVibes!
                              .length,
                          (int index) {
                            final subVibes =
                                categorizedVibes[focusedVibeCategory.value!]
                                    .childVibes!;

                            final isSelected = selectedVibes
                                .map((e) => e.id)
                                .contains(subVibes[index].id);

                            final isFocused =
                                focusedVibeSubCategory.value == index;

                            final chipsState = RegisterchipState(
                              isSelected: isSelected,
                              isFocused: isFocused,
                            );

                            return GestureDetector(
                              onTap: () async {
                                await HapticFeedback.selectionClick();
                                final cb = switch (chipsState.state) {
                                  RegisterChipState.selected => () {
                                      nextSubCategory.value = index;
                                      focusedVibeSubCategory.value = index;
                                    },
                                  RegisterChipState.focusedForDelete => () {
                                      ref
                                          .read(userEditVibesControllerProvider
                                              .notifier)
                                          .removeVibe(vibe: subVibes[index]);

                                      // focusedVibeSubCategory.value = null;
                                      focusedVibeSubCategory.value = null;
                                    },
                                  RegisterChipState.none => () {
                                      nextSubCategory.value = index;
                                      focusedVibeSubCategory.value = index;
                                    },
                                  RegisterChipState.focused => () {
                                      ref
                                          .read(userEditVibesControllerProvider
                                              .notifier)
                                          .addVibe(vibe: subVibes[index]);

                                      focusedVibeSubCategory.value = null;
                                    },
                                };

                                cb();
                              },
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: r.nextDouble() * 5,
                                  right: r.nextDouble() * 5,
                                  top: r.nextDouble() * 5,
                                  bottom: r.nextDouble() * 5,
                                ),
                                child: Chip(
                                  label: Text(subVibes[index].name),
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
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: ValueListenableBuilder(
                  valueListenable: nextSubCategory,
                  builder: (context, value, child) {
                    if (value == null) return const SizedBox();
                    return SizedBox(
                      height: nextSubCategory.value != null ? 200 : 0,
                      child: nextSubCategory.value != null
                          ? Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 14.0),
                              child: Wrap(
                                spacing: 18.0,
                                runSpacing: 4.0,
                                children: List.generate(
                                  categorizedVibes[focusedVibeCategory.value!]
                                      .childVibes![nextSubCategory.value!]
                                      .childVibes!
                                      .length,
                                  (int index) {
                                    final subSubVibes = categorizedVibes[
                                            focusedVibeCategory.value!]
                                        .childVibes![nextSubCategory.value!]
                                        .childVibes!;

                                    final isSelected = selectedVibes
                                        .map((e) => e.id)
                                        .contains(subSubVibes[index].id);

                                    final isFocused =
                                        focusedVibeSubSubCategory.value ==
                                            index;

                                    final chipsState = RegisterchipState(
                                      isSelected: isSelected,
                                      isFocused: isFocused,
                                    );

                                    return GestureDetector(
                                      onTap: () async {
                                        await HapticFeedback.selectionClick();

                                        final cb = switch (chipsState.state) {
                                          RegisterChipState.selected => () {
                                              focusedVibeSubSubCategory.value =
                                                  index;
                                            },
                                          RegisterChipState.focusedForDelete =>
                                            () {
                                              ref
                                                  .read(
                                                      userEditVibesControllerProvider
                                                          .notifier)
                                                  .removeVibe(
                                                      vibe: subSubVibes[index]);

                                              focusedVibeSubSubCategory.value =
                                                  null;
                                            },
                                          RegisterChipState.none => () {
                                              focusedVibeSubSubCategory.value =
                                                  index;
                                            },
                                          RegisterChipState.focused => () {
                                              ref
                                                  .read(
                                                      userEditVibesControllerProvider
                                                          .notifier)
                                                  .addVibe(
                                                      vibe: subSubVibes[index]);
                                              focusedVibeSubSubCategory.value =
                                                  null;
                                            },
                                        };

                                        cb();
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                          left: r.nextDouble() * 5,
                                          right: r.nextDouble() * 5,
                                          top: r.nextDouble() * 5,
                                          bottom: r.nextDouble() * 5,
                                        ),
                                        child: Chip(
                                          label: Text(subSubVibes[index].name),
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
                    );
                  }),
            ),
          ],
        );
      },
      error: (error, _) => const SizedBox(),
      loading: () => const JShimmer(),
    );
  }
}
