import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jam/presentation/presentation.dart';

class JamPageListController extends StateNotifier<List<Widget>> {
  JamPageListController() : super(const [JamTypeSelectPage()]);

  void addPage(Widget page) {
    if (state.contains(page)) return;
    state = [...state, page];
  }

  void removePage(Widget page) {
    state = state.where((element) => element != page).toList();
  }

  void reset() {
    state = const [JamTypeSelectPage()];
  }
}

final pageListControllerProvider =
    StateNotifierProvider<JamPageListController, List<Widget>>(
  (ref) => JamPageListController(),
);

final pageControllerProvider = Provider.autoDispose<PageController>(
  (ref) => PageController(),
);
