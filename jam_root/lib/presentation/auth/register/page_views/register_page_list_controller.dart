import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jam/presentation/presentation.dart';

class RegisterPageListController extends StateNotifier<List<Widget>> {
  RegisterPageListController() : super(const [BasicInfoPageView()]);

  void addPage(Widget page) {
    if (state.contains(page)) return;
    state = [...state, page];
  }

  void removePage(Widget page) => state = [
        ...state.where((pages) => pages != page),
      ];

  void reset() => state = const [BasicInfoPageView()];
}

final registerFormPagesProvider =
    StateNotifierProvider<RegisterPageListController, List<Widget>>(
  (ref) => RegisterPageListController(),
);

final registerFormPageViewControllerProvider =
    Provider.autoDispose<PageController>(
  (ref) => PageController(),
);
