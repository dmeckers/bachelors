import 'package:flutter/material.dart';

class JamBaseFormModel {
  String? labelText;
  String? hintText;
  Function? validator;
  TextInputType? inputType;
  TextEditingController? controller;
  final FocusNode? focusNode;
  String? initValue;

  JamBaseFormModel({
    this.labelText,
    this.hintText,
    this.validator,
    this.inputType,
    this.controller,
    this.focusNode,
    this.initValue,
  });

  factory JamBaseFormModel.generate({
    required String labelText,
    String? hintText,
    Function? validator,
    bool? obscureFieldText,
    TextInputType? inputType = TextInputType.text,
    String? initValue,
  }) {
    return JamBaseFormModel(
        controller: TextEditingController()..text = initValue ?? '',
        focusNode: FocusNode(debugLabel: 'basic form model focus node'),
        hintText: hintText,
        labelText: labelText,
        inputType: inputType,
        validator: validator,
        initValue: initValue);
  }

  void dispose() {
    focusNode?.dispose();
    controller?.dispose();
  }

  String? validate() => validator != null ? validator!(controller!.text) : null;

  get isValid => validate()?.isEmpty ?? true;

  void initState(BuildContext context) {
    controller = controller ?? TextEditingController();
    controller!.text = initValue ?? '';
  }
}
