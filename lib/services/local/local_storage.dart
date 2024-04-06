import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorage {
  static const FlutterSecureStorage _storage = FlutterSecureStorage();

  static AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  static IOSOptions _getiOSOptions() => const IOSOptions();

  static const String _tokenKey = 'token';

  static Future save(String token) async {
    await _storage.write(
        key: _tokenKey,
        value: token,
        aOptions: _getAndroidOptions(),
        iOptions: _getiOSOptions());
    read();
  }

  static Future<String?> read() async {
    return await _storage.read(
      key: _tokenKey,
      aOptions: _getAndroidOptions(),
      iOptions: _getiOSOptions(),
    );
  }

  static Future delete() async {
    await _storage.delete(
      key: _tokenKey,
      aOptions: _getAndroidOptions(),
      iOptions: _getiOSOptions(),
    );
    read();
  }
}
