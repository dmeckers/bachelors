import 'package:flutter/material.dart';
import 'package:jam/domain/domain.dart';

class MessageBoxBase extends StatelessWidget {
  const MessageBoxBase({super.key, required this.message, required this.child});

  final Widget child;
  final MessageModel message;

  @override
  Widget build(BuildContext context) {
    const fromMe = (
      color: Colors.blueGrey,
      radiusBottomLeft: Radius.circular(16),
      radiusBottomRight: Radius.zero,
    );

    const fromOther = (
      color: Color.fromARGB(255, 27, 94, 32),
      radiusBottomLeft: Radius.zero,
      radiusBottomRight: Radius.circular(16),
    );

    final styles = message.fromMe ? fromMe : fromOther;

    return Container(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.65,
        minWidth: 10,
        maxHeight: 500,
        minHeight: 30,
      ),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: styles.color,
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(16),
          topRight: const Radius.circular(16),
          bottomLeft: styles.radiusBottomLeft,
          bottomRight: styles.radiusBottomRight,
        ),
      ),
      child: child,
    );
  }
}
