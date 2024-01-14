import 'dart:io';

import 'package:jam/application/application.dart';

abstract class UserProfileImagesRepositoryInterface {
  Future<String> addProfilePhoto({required File image});
  Future<void> deleteProfilePhoto({required String photoId});
  Future<List<String>> getUserAvatars({String? userId});
  Future<void> setMainAvatar(String? url);

  abstract final AttachmentServiceInterface attachmentService;
}
