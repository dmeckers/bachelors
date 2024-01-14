import 'package:flutter/material.dart';
import 'package:jam_ui/jam_ui.dart';

enum BottomSheetSize { small, medium, large }

class BottomSheetLayout extends StatelessWidget {
  const BottomSheetLayout({
    super.key,
    this.child,
    this.children,
    this.paddingTop,
    this.size = BottomSheetSize.medium,
  }) : assert(child != null || children != null,
            'You must provide a child or children');

  final Widget? child;
  final List<Widget>? children;
  final double? paddingTop;
  final BottomSheetSize size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: switch (size) {
        BottomSheetSize.small => 200,
        BottomSheetSize.medium => 300,
        BottomSheetSize.large => 350,
      },
      width: double.infinity,
      decoration: BoxDecoration(
        color: context.jColor.background,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      child: Column(
        children: [
          const SizedBox(height: 10),
          Container(
              height: 5,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: context.jColor.primary,
              )),
          SizedBox(height: paddingTop ?? 40),
          child ?? Column(children: children!),
        ],
      ),
    );
  }
}
