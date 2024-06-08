import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam_ui/jam_ui.dart';

enum JFormTextInputType { email, password, text }

class JFormTextInput extends HookConsumerWidget {
  const JFormTextInput({
    super.key,
    this.validator,
    this.labelText,
    this.leadingIcon,
    this.onChange,
    this.inputType = JFormTextInputType.text,
    this.validateOnSubmit = false,
    this.isSubmitted,
  }) : assert(validateOnSubmit || isSubmitted != null);

  final JFormTextInputType inputType;
  final ValueNotifier<bool>? isSubmitted;
  final String? Function(String?)? validator;
  final String? labelText;
  final IconData? leadingIcon;
  final Function(String)? onChange;
  final bool validateOnSubmit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 200),
    );
    final animation = useAnimation(animationController);
    final focus = useFocusNode();
    final textEditingController = useTextEditingController();
    final isObscured = useState(true);

    focus.addListener(
      () => focus.hasFocus
          ? animationController.forward()
          : animationController.reverse(),
    );

    final showValidationError = validateOnSubmit ? isSubmitted!.value : true;

    return Column(
      children: [
        Container(
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
            child: TextFormField(
              controller: textEditingController,
              obscureText:
                  inputType == JFormTextInputType.password && isObscured.value,
              onChanged: (v) => onChange?.call(v),
              decoration: InputDecoration(
                prefixIcon: Icon(leadingIcon),
                border: InputBorder.none,
                labelText: labelText,
                labelStyle: context.jText.bodySmall,
                suffixIcon: inputType == JFormTextInputType.password
                    ? InkWell(
                        onTap: () => isObscured.value = !isObscured.value,
                        focusNode: FocusNode(skipTraversal: true),
                        child: Icon(
                          isObscured.value
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          size: 22.0,
                        ),
                      )
                    : null,
                filled: true,
                fillColor: context.jTheme.cardColor,
                focusColor: context.jTheme.cardColor,
              ),
              style: context.jText.bodyMedium,
              keyboardType: TextInputType.emailAddress,
              focusNode: focus,
            ),
          ),
        ),
        Visibility(
          visible: showValidationError,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: TextFieldValidationError(
                errorMessage: validator?.call(textEditingController.text),
              ),
            ),
          ),
        )
      ],
    );
  }
}
