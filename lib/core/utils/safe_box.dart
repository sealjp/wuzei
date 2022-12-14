import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SafeBox {
  static const _box = const FlutterSecureStorage();
  static const String _privateKey = 'privateKey';

  static Future<void> _save(String key, String v) async {
    await _box.write(key: key, value: v);
  }

  static Future<String?> _read(String key) => _box.read(key: key);

  static Future<void> savePrivateKey(String v) => _save(_privateKey, v);

  static Future<String?> readPrivateKey() => _read(_privateKey);
}
