import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final _storage = const FlutterSecureStorage();

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  Future writeSecureData(String key, String value) async {
    await _storage.write(
        key: key, value: value, aOptions: _getAndroidOptions());
  }

  Future<String?> readSecureData(String key) async {
    var readData =
        await _storage.read(key: key, aOptions: _getAndroidOptions());
    return readData;
  }

  Future<void> deleteSecureData(String key) async {
    await _storage.delete(key: key, aOptions: _getAndroidOptions());
  }
}
