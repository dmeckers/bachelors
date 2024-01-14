import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam_ui/jam_ui.dart';

//TODO fix render overflow
class BottomSheetModalWithInput extends HookConsumerWidget {
  const BottomSheetModalWithInput({
    super.key,
    required this.onConfirm,
    this.textFieldHintText,
    this.initialValue,
  });

  final Function(String value) onConfirm;
  final String? textFieldHintText;
  final String? initialValue;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textController = useTextEditingController()
      ..text = initialValue ?? '';
    final textFocusNode = useFocusNode();
    final showEmoji = useState(false);
    useEffect(() {
      listener() {
        if (textFocusNode.hasFocus) {
          showEmoji.value = false;
        }
      }

      textFocusNode.addListener(listener);

      return () => textFocusNode.removeListener(listener);
    }, [textFocusNode]);

    return Container(
      constraints: const BoxConstraints(maxHeight: 600),
      height: showEmoji.value ? null : 160,
      width: double.infinity,
      decoration: BoxDecoration(
        color: context.jColor.background,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      child: Align(
          alignment: Alignment.bottomCenter,
          // child: Padding(
          //   padding: const EdgeInsets.only(bottom: 24.0, top: 18, left: 10),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Row(
                children: [
                  const SizedBox(width: 15),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width - 80),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width - 80,
                      child: TextField(
                        controller: textController,
                        focusNode: textFocusNode,
                        style: context.jText.bodySmall
                            ?.copyWith(color: Colors.white, fontSize: 13),
                        maxLength: 30,
                        buildCounter: (context,
                                {required currentLength,
                                required isFocused,
                                maxLength}) =>
                            Transform.translate(
                          offset: const Offset(0, -30),
                          child: Text(
                            '$currentLength/$maxLength',
                            style: TextStyle(
                                color: isFocused ? Colors.white : Colors.grey,
                                fontSize: 12),
                          ),
                        ),
                        decoration: InputDecoration(
                            hintText: textFieldHintText ?? 'Type a message',
                            hintStyle: context.jText.bodyMedium
                                ?.copyWith(color: Colors.white),
                            border: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10)),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      textFocusNode.unfocus();
                      await Future.delayed(
                        const Duration(microseconds: 100),
                        () => showEmoji.value = !showEmoji.value,
                      );
                    },
                    icon: const Icon(Icons.emoji_emotions_outlined,
                        color: Colors.white),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ),
                  // const Spacer(),
                  TextButton(
                    onPressed: () {
                      onConfirm(textController.text);
                      context.pop();
                    },
                    child: const Text(
                      'Confirm',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 10)
                ],
              ),
              // Visibility(
              //   visible: showEmoji.value,
              //   child: SizedBox(
              //       height: 200,
              //       width: MediaQuery.of(context).size.width,
              //       child: EmojiPicker(
              //         textEditingController: textController,
              //         config: ref.read(emojiPickerConfigProvider(context)),
              //       )),
              // )
            ],
            // ),
          )),
    );
  }
}
