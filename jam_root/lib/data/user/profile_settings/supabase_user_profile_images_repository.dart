import 'dart:io';

import 'package:jam/application/application.dart';
import 'package:jam/config/config.dart';
import 'package:jam/data/data.dart';

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
    final userId = getUserIdOrThrow();
    final currentAvatar =
        await supabase.from('profiles').select('avatar').eq('id', userId);

    if (currentAvatar.first['avatar'] == null) {
      await setMainAvatar(fileName);
    }

    return fileName;
  }

  @override
  Future<void> deleteProfilePhoto({required String photoId}) async {
    await attachmentService.delete(photoId);
    final otherImages = (await attachmentService.list()) as List<FileObject>;
    //supabase returns `.empty` file when no images are in folder NICE
    final filtered = otherImages.where(
      (element) => !element.name.startsWith('.'),
    );

    return filtered.isEmpty
        ? await setMainAvatar(null)
        : await setMainAvatar(otherImages.first.name);
  }

  @override
  Future<Strings> getUserAvatars({String? userId}) async {
    final list =
        (await attachmentService.list(userId: userId)) as List<FileObject>;

    return list
        .where((element) => !element.name.startsWith('.'))
        .map(
          (image) => '${attachmentService.getLink(
            filename: image.name,
            userId: userId,
          )}${image.name}',
        )
        //like wtf
        .toList();
  }

  @override
  Future<void> setMainAvatar(String? filename) async {
    final url = filename != null
        ? filename.startsWith('https://')
            ? filename
            : "${attachmentService.getLink(filename: filename)}$filename"
        : null;

    await supabase.from('profiles').update({'avatar': url}).eq(
      'id',
      getUserIdOrThrow(),
    );
  }
}
