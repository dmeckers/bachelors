import 'dart:io';

import 'package:jam/application/application.dart';
import 'package:jam/config/config.dart';
import 'package:jam/data/data.dart';
import 'package:jam_utils/jam_utils.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// i just hope that local db always have all data
final class SupabaseUserProfileImagesRepositoryInterface
    with SupabaseUserGetter
    implements UserProfileImagesRepositoryInterface {
  SupabaseUserProfileImagesRepositoryInterface(
    this._ref,
    this.attachmentService,
  );

  final ProviderRef _ref;

  @override
  final AttachmentServiceInterface attachmentService;

  @override
  Future<String> addProfilePhoto({required File image}) async {
    final fileName = await attachmentService.upload(file: image);
    final currentAvatar = await _getCurrentAvatar();

    if (currentAvatar == null) {
      await setMainAvatar(attachmentService.getLink(filename: fileName));
    }

    return attachmentService.getLink(filename: fileName);
  }

  @override
  Future<String?> deleteProfilePhoto({required String photoId}) async {
    await attachmentService.delete(photoId);
    final currentAvatar = await _getCurrentAvatar();
    if (!(currentAvatar == photoId)) return currentAvatar;

    final otherImages = (await attachmentService.list()) as List<FileObject>;
    //supabase returns `.empty` file when no images are in folder NICE
    final newAvatar =
        otherImages.where((element) => !element.name.startsWith('.')).isEmpty
            ? null
            : attachmentService.getLink(filename: otherImages.first.name);

    await setMainAvatar(newAvatar);

    return newAvatar;
  }

  @override
  Future<Strings> getUserAvatars({String? userId}) async {
    final list =
        (await attachmentService.list(userId: userId)) as List<FileObject>;

    return list
        .where((element) => !element.name.startsWith('.'))
        .map(
          (image) => attachmentService.getLink(
            filename: image.name,
            userId: userId,
          ),
        )
        //like wtf
        .toList();
  }

  @override
  Future<void> setMainAvatar(String? url) async {
    final userId = getUserIdOrThrow();

    !(await isOnline(_ref))
        ? await PowerSync.db.execute(
            'UPDATE profiles SET avatar = ? WHERE id = ?',
            [url, userId],
          )
        : await supabase
            .from('profiles')
            .update({'avatar': url}).eq('id', userId);
  }

  Future<String?> _getCurrentAvatar() async {
    return (await supabase
            .from('profiles')
            .select('avatar')
            .eq('id', getUserIdOrThrow()))
        .first['avatar'] as String?;
  }
}
