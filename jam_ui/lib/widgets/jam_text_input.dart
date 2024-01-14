import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:jam_ui/jam_ui.dart';

class JTextFormInput extends HookWidget {
  const JTextFormInput({
    super.key,
    required this.viewModel,
    this.overrideValidate,
    this.customLabelText,
  });
  final Function? overrideValidate;
  final JamBaseFormModel viewModel;
  final String? customLabelText;

  @override
  Widget build(BuildContext context) {
    final isPasswordField =
        viewModel.labelText?.toLowerCase().contains('password');
    final obscureText = useState(isPasswordField ?? false);
    final showObscured = useState(isPasswordField ?? false);
    final focusNode = useFocusNode();
    final isFocused = useState(false);
    final prestine = useState(true);
    final isInvalid = useState(true);

    final animationController =
        useAnimationController(duration: const Duration(milliseconds: 200));
    final animation = useAnimation(animationController);

    focusNode.addListener(() {
      isFocused.value = focusNode.hasFocus;
      if (focusNode.hasFocus) {
        animationController.forward();
      } else {
        animationController.reverse();
      }
    });

    handleOnInputChange(String _) {
      if (prestine.value) {
        prestine.value = false;
      }

      isInvalid.value = overrideValidate == null
          ? (viewModel.validate()?.isNotEmpty ?? false)
          : overrideValidate!() != null;
    }

    return Column(
      children: [
        Container(
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
              controller: viewModel.controller,
              obscureText: showObscured.value ? obscureText.value : false,
              onChanged: handleOnInputChange,
              decoration: InputDecoration(
                border: InputBorder.none,
                labelText: customLabelText ?? viewModel.labelText,
                labelStyle: context.jText.bodySmall,
                suffixIcon: showObscured.value
                    ? InkWell(
                        onTap: () => obscureText.value = !obscureText.value,
                        focusNode: FocusNode(skipTraversal: true),
                        child: Icon(
                          obscureText.value
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
              focusNode: focusNode,
            ),
          ),
        ),
        Visibility(
          visible: !prestine.value && isInvalid.value,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: TextFieldValidationError(
                errorMessage: overrideValidate == null
                    ? viewModel.validate()
                    : overrideValidate!(),
              ),
            ),
          ),
        )
      ],
    );
  }
}
