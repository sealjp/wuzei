/*
 * This file is part of the Wuzei (https://github.com/sealjp/wuzei.git or 
 * git@github.com:sealjp/wuzei.git).
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
