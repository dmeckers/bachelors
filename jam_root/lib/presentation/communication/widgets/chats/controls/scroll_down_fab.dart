import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jam/presentation/presentation.dart';

class ScrollDownFAB extends ConsumerWidget with ChattingProviders {
  const ScrollDownFAB({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (child, animation) =>
          ScaleTransition(scale: animation, child: child),
      child: ref.watch(showFABProvider)
          ? FloatingActionButton(
              shape: const CircleBorder(),
              child: const Badge(
                label: Text('5'),
                offset: Offset(-20, 25),
                largeSize: 20,
                // change padding depending on badge text size (number of digits)
                // padding: EdgeInsets.all(5),
                child: Icon(Icons.arrow_downward),
              ),
              // messagesData.indexOf(messagesData.first)
              onPressed: () =>
                  ref.read(autoScrollCtrlProvider).scrollToIndex(0),
            )
          : const SizedBox(),
    );
  }
}

class CustomFloatingActionButtonLocation extends FloatingActionButtonLocation {
  const CustomFloatingActionButtonLocation();

  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    final double x = scaffoldGeometry.scaffoldSize.width / 1.2;
    final double y = scaffoldGeometry.contentTop * 7.5;

    return Offset(x, y);
  }
}
