import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jam/config/config.dart';

class AuthMediaService {
  Future<Strings> getLoginBackgrounds() async {
    final items = await supaBucket.list(path: Storage.APP_LOGIN_BUCKET_URL);

    return items
        .map(
          (e) => supaBucket
              .getPublicUrl("${Storage.APP_LOGIN_BUCKET_URL}/${e.name}"),
        )
        .toList();
  }
}

final authMediaServiceProvider = Provider<AuthMediaService>(
  (ref) => AuthMediaService(),
);
