import 'dart:typed_data';

import 'package:crypton/crypton.dart';

import '../../lib.dart';

class RSAUtil {
  late String init;
  late String end;
  static Future<UserBox> generateMyKeyPair() async {
    final RSAKeypair keypair = RSAKeypair.fromRandom();
    final String publicKey = keypair.publicKey.toString();
    debugPrint(publicKey);
    final String privateKey = keypair.privateKey.toString();
    final DateTime now = DateTime.now();
    final UserBox me = UserDao.queryMe();
    me
      ..publicKey = publicKey
      ..keyTime = now
      ..contactTime = now;
    UserDao.save(me);
    await SafeBox.savePrivateKey(privateKey);
    return me;
  }

  static int stringBytes(String message) {
    final x = utf8.encode(message) as Uint8List;
    return x.length;
  }

  static String encode(String publicKey, String message) {
    final RSAPublicKey _publicKey = RSAPublicKey.fromString(publicKey);
    return _publicKey.encrypt(message);
  }

  static String decode(String privateKey, String message) {
    final RSAPrivateKey _privateKey = RSAPrivateKey.fromString(privateKey);
    return _privateKey.decrypt(message);
  }
}
