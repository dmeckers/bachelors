import 'package:flutter/material.dart';

import 'package:jam_ui/jam_ui.dart';

class ChatMesssageInputBarWrapper extends StatelessWidget {
  const ChatMesssageInputBarWrapper({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: context.jTheme.primaryColor),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: children,
      ),
    );
  }
}
