import 'package:flutter/material.dart';

import 'package:jam_utils/jam_utils.dart';

class OkPopup extends StatelessWidget {
  const OkPopup({
    super.key,
    required this.title,
    this.onOkPressed,
    this.okButtonText,
    this.imagePath,
  });

  final String title;
  final String? imagePath;
  final String? okButtonText;
  final void Function()? onOkPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      content: imagePath.isNotNull
          ? Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(imagePath!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                _buildTitle(0),
              ],
            )
          : _buildTitle(8),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(
              context,
              rootNavigator: true,
            ).pop();

            onOkPressed?.call();
          },
          child: Text(
            okButtonText ?? 'Ok',
          ),
        )
      ],
    );
  }

  Widget _buildTitle(double topPaddings) {
    return Padding(
      padding: EdgeInsets.only(top: topPaddings),
      child: Text(
        title,
        textAlign: TextAlign.center,
      ),
    );
  }
}
