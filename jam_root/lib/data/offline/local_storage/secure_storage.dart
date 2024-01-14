import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static const instance = FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );
}
