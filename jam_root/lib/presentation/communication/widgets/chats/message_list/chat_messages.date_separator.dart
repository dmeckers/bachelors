import 'package:flutter/material.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam_ui/jam_ui.dart';

class ChatMessagesDateSeparator extends StatelessWidget {
  const ChatMessagesDateSeparator({super.key, required this.message});

  final MessageModel message;

  static const MONTH_MAP = {
    1: 'January',
    2: 'February',
    3: 'March',
    4: 'April',
    5: 'May',
    6: 'June',
    7: 'July',
    8: 'August',
    9: 'September',
    10: 'October',
    11: 'Novemeber',
    12: 'December',
  };

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        width: 100,
        height: 30,
        child: Card(
          color: context.jTheme.primaryColor,
          child: Align(
            alignment: Alignment.center,
            child: Text(
              "${message.sentAt.day} ${MONTH_MAP[message.sentAt.month]} ",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 10),
            ),
          ),
        ),
      ),
    );
  }
}
