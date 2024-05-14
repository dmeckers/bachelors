import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:jam_ui/jam_ui.dart';

class JInputSimple extends HookWidget {
  const JInputSimple({
    super.key,
    this.controller,
    this.onChanged,
    this.labelText,
    this.initialValue,
  });

  final TextEditingController? controller;
  final Function(String value)? onChanged;
  final String? labelText;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    final animationController =
        useAnimationController(duration: const Duration(milliseconds: 200));
    final animation = useAnimation(animationController);
    final focusNode = useFocusNode();
    final isFocused = useState(false);
    final inputController = (controller ?? useTextEditingController());

    useEffect(() {
      inputController.text = initialValue ?? '';
      return null;
    }, const []);

    focusNode.addListener(() {
      isFocused.value = focusNode.hasFocus;
      if (focusNode.hasFocus) {
        animationController.forward();
      } else {
        animationController.reverse();
      }
    });

    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: context.jColor.onBackground.withOpacity(0.3),
            spreadRadius: 4,
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: CustomPaint(
        painter: CustomAnimateBorder(
          color: Theme.of(context).brightness == Brightness.light
              ? Colors.black
              : Colors.white,
          animationPercent: animation,
          stroke: 4,
        ),
        child: TextFormField(
          controller: inputController,
          onChanged: onChanged,
          decoration: InputDecoration(
            border: InputBorder.none,
            labelText: labelText,
            labelStyle: context.jText.bodySmall,
            filled: true,
            fillColor: context.jTheme.cardColor,
            focusColor: context.jTheme.cardColor,
          ),
          style: context.jText.bodyMedium,
          keyboardType: TextInputType.emailAddress,
          focusNode: focusNode,
        ),
      ),
    );
  }
}
