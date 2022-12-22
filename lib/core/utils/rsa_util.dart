/*
 * This file is part of the Wuzei (https://github.com/sealjp/Wuzei.git or 
 * git@github.com:sealjp/Wuzei.git).
 * 
 * Copyright (C) 2022 Zhang Xi (sealnippon@gmail.com)
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 3 as
 * published by the Free Software Foundation.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */


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
