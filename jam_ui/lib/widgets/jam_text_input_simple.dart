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
    this.inputLeadingWidget,
    this.inputTrailingWidget,
    this.inputFocusNode,
    this.withAnimation = true,
    // this.withTrailingCleaner = false,
  });

  final bool withAnimation;
  final Widget? inputLeadingWidget;
  final TextEditingController? controller;
  final Function(String value)? onChanged;
  final String? labelText;
  final String? initialValue;
  final Widget? inputTrailingWidget;
  final FocusNode? inputFocusNode;
  // final bool withTrailingCleaner;

  @override
  Widget build(BuildContext context) {
    final animationController =
        useAnimationController(duration: const Duration(milliseconds: 200));
    final animation = useAnimation(animationController);
    final focusNode = inputFocusNode ?? useFocusNode();
    final isFocused = useState(false);
    final inputController = (controller ?? useTextEditingController());

    useEffect(() {
      inputController.text = initialValue ?? '';
      return null;
    }, const []);

    focusNode.addListener(() {
      if (!withAnimation) return;
      isFocused.value = focusNode.hasFocus;
      focusNode.hasFocus
          ? animationController.forward()
          : animationController.reverse();
    });

    return withAnimation
        ? Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: context.jColor.onSurface.withOpacity(0.3),
                  spreadRadius: 4,
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: CustomPaint(
              painter: CustomAnimateBorder(
                color: context.jColor.onSurface,
                animationPercent: animation,
                stroke: 4,
              ),
              child: _buildInput(inputController, context, focusNode),
            ),
          )
        : _buildInput(inputController, context, focusNode);
  }

  TextFormField _buildInput(TextEditingController inputController,
      BuildContext context, FocusNode focusNode) {
    return TextFormField(
      controller: inputController,
      onChanged: onChanged,
      decoration: InputDecoration(
        suffixIcon: inputTrailingWidget,
        prefixIcon: inputLeadingWidget,
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
    );
  }
}
