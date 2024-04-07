import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:jam/application/application.dart';

final class SupabaseBucketConstants {
  // bucket
  static const SHARED_BUCKET_URL = 'shared';
  // unauth bucket folders
  static const APP_LOGIN_BUCKET_URL = 'app/login';
  // auth bucket folders
  static const JAM_BUCKET_URL = 'jams';
  static const USER_AVATARS_STORAGE_URL = 'avatars';
  static const VIBE_BUCKET_URL = 'vibes';
}

enum SupabaseBucketConfig implements BucketInterface {
  shared((
    path: SupabaseBucketConstants.SHARED_BUCKET_URL,
    isStatic: true,
    isOfUserDomain: false,
  )),
  appLogin((
    path: SupabaseBucketConstants.APP_LOGIN_BUCKET_URL,
    isStatic: true,
    isOfUserDomain: false,
  )),
  jamBackgrounds((
    path: "${SupabaseBucketConstants.JAM_BUCKET_URL}/userId/jams_backgrounds",
    isStatic: false,
    isOfUserDomain: true,
  )),
  avatars((
    path: "${SupabaseBucketConstants.USER_AVATARS_STORAGE_URL}/userId/",
    isStatic: false,
    isOfUserDomain: true,
  )),
  vibes((
    path: "${SupabaseBucketConstants.VIBE_BUCKET_URL}/icons",
    isStatic: true,
    isOfUserDomain: false,
  ));

  @override
  get path => config.path;
  @override
  get isStatic => config.isStatic;
  @override
  get isOfUserDomain => config.isOfUserDomain;

  @override
  String getFullPath(String? userId, Identifiable? model) {
    if (isStatic) return path;
    var fullPath = path;

    if (isOfUserDomain) {
      fullPath = fullPath.replaceAll('userId', userId!);
    }

    if (model != null) {
      fullPath = fullPath.replaceAll('id', model.id);
    }

    return fullPath;
  }

  final ({String path, bool isStatic, bool isOfUserDomain}) config;

  const SupabaseBucketConfig(this.config);
}

final supaBucket = Supabase.instance.client.storage
    .from(SupabaseBucketConstants.SHARED_BUCKET_URL);

typedef Storage = SupabaseBucketConstants;
