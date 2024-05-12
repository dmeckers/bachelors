import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TextInputWithCursor extends HookWidget {
  final String initialValue;

  const TextInputWithCursor({
    super.key,
    required this.initialValue,
    this.onChanged,
  });

  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    final focusNode = useFocusNode();
    final textController = useTextEditingController();

    useEffect(() {
      textController.text = initialValue;

      Timer? timer;
      focusNode.addListener(() {
        if (!focusNode.hasFocus) {
          timer = Timer.periodic(const Duration(seconds: 1), (timer) {
            if (textController.text.endsWith('|')) {
              textController.text = textController.text
                  .substring(0, textController.text.length - 1);
            } else {
              textController.text = '${textController.text}|';
            }
          });
        } else {
          if (textController.text.endsWith('|')) {
            textController.text = textController.text
                .substring(0, textController.text.length - 1);
          }
          timer?.cancel();
          timer = null;
        }
      });

      timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (textController.text.endsWith('|')) {
          textController.text =
              textController.text.substring(0, textController.text.length - 1);
        } else {
          textController.text = '${textController.text}|';
        }
      });

      return () {
        focusNode.dispose();
        textController.dispose();
        timer?.cancel();
      };
    }, []);

    return Container(
      color: Colors.red,
      width: MediaQuery.of(context).size.width * 0.7,
      child: TextFormField(
        controller: textController,
        onChanged: onChanged,
        focusNode: focusNode,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.black),
        decoration: const InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
      ),
    );
  }
}
