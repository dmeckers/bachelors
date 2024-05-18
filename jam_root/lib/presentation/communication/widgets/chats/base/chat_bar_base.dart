import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jam/config/config.dart';
import 'package:jam_ui/jam_ui.dart';

class ChatBarBase extends StatelessWidget implements PreferredSizeWidget {
  const ChatBarBase({
    super.key,
    required this.avatar,
    this.onTap,
    this.bodyWidgets,
    this.popupMenu,
  });

  final Widget avatar;
  final void Function()? onTap;
  final List<Widget>? bodyWidgets;
  final Widget? popupMenu;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16),
      color: context.jColor.secondaryContainer,
      child: Row(
        children: [
          IconButton(
            onPressed: () => context.pop(),
            icon: const Icon(Icons.arrow_back),
          ),
          const SizedBox(width: 2),
          avatar,
          const SizedBox(width: 12),
          Expanded(
            child: GestureDetector(
              onTap: onTap,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: bodyWidgets ?? []),
            ),
          ),
          // ChatPopupMenu(chat: chat),
          popupMenu ?? const SizedBox(),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(DEFAULT_APP_BAR_HEIGHT);
}
