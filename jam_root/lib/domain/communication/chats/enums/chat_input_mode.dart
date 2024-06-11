import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'chat_input_mode.g.dart';

// TODO move this to the presentation layer

typedef ChatInputModeWidgetAttributes = ({
  IconData icon,
  String Function(String?) title
});

@HiveType(typeId: 13)
enum ChatInputMode {
  @HiveField(0)
  forward,
  @HiveField(1)
  reply,
  @HiveField(2)
  edit,
  @HiveField(3)
  standart;

  ChatInputModeWidgetAttributes get getWidgetAttrivutes {
    return switch (this) {
      ChatInputMode.reply => (
          icon: Icons.reply,
          title: (String? input) => "Reply to $input",
        ),
      ChatInputMode.edit => (
          icon: Icons.edit,
          title: (String? input) => "Editing",
        ),
      ChatInputMode.forward => (
          icon: Icons.forward,
          title: (String? input) => "Forwarding",
        ),
      ChatInputMode.standart => (
          icon: Icons.send,
          title: (String? input) => "Send",
        ),
    };
  }
}
