import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';

import 'package:jam/presentation/presentation.dart';

class PickImageBottomSheet extends StatelessWidget {
  const PickImageBottomSheet({super.key, required this.onImagePicked});

  final Function(XFile?) onImagePicked;

  @override
  Widget build(BuildContext context) {
    return BottomSheetLayout(
      children: [
        const Text('Add photo', style: TextStyle(fontSize: 18)),
        const SizedBox(height: 10),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                CircleAvatar(
                  radius: 27,
                  child: IconButton(
                    onPressed: () async =>
                        _captureImageFromCamera(context).then(
                      (value) => Navigator.of(context).pop(),
                    ),
                    icon: const Icon(Icons.camera_alt),
                  ),
                ),
                const SizedBox(height: 10),
                const Text('Photo', style: TextStyle(fontSize: 14)),
              ],
            ),
            Column(
              children: [
                CircleAvatar(
                  radius: 27,
                  child: IconButton(
                    onPressed: () async => _pickImageFromGallery(context).then(
                      (value) => Navigator.of(context).pop(),
                    ),
                    icon: const Icon(Icons.image_search),
                  ),
                ),
                const SizedBox(height: 10),
                const Text('Gallery', style: TextStyle(fontSize: 14)),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Future<void> _pickImageFromGallery(BuildContext context) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    onImagePicked(pickedImage);
  }

  Future<void> _captureImageFromCamera(BuildContext context) async {
    final picker = ImagePicker();
    final capturedImage = await picker.pickImage(source: ImageSource.camera);

    onImagePicked(capturedImage);
  }
}
