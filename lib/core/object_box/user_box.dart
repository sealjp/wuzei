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

import 'package:objectbox/objectbox.dart';

import '../../lib.dart';
import 'objectbox.g.dart';

// ignore_for_file: public_member_api_docs

@Entity()
class UserBox {
  /// id == 1, user is me
  int? id;
  String? name;
  String? alias;
  String? publicKey;
  DateTime? keyTime;
  DateTime? contactTime;
  UserBox(
      {this.id = 0,
      this.name,
      this.alias,
      this.publicKey,
      this.contactTime,
      this.keyTime});

  String get publicKeyPartStr => _subString(publicKey ?? '');

  String get nameStr => alias ?? name ?? '';

  String get initial => nameStr.isEmpty?'': nameStr[0];

  String _subString(String v) {
    final int length = v.length;
    if (length < 20) return v;
    final initial = v.substring(0, 9);
    final end = v.substring(length - 9, length);
    return '$initial......$end';
  }

  UserBox.fromString(String v) {
    this.publicKey = _extractKey(v);
    this.name = _extractName(v);
  }

  String _extractByMarks(String v, String mark1, String mark2) {
    List<String> strs = v.split(mark1);
    strs = strs.last.split(mark2);
    return strs.first.trim();
  }

  String? _extractKey(String v) {
    const String ini = 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA';
    const String end = 'IDAQAB';
    if (!v.contains(ini) || !v.contains(end)) return null;
    final String body = _extractByMarks(v, ini, end);
    return ini + body + end;
  }

  String? _extractName(String v) {
    String _extractByName(String n) => _extractByMarks(v, n, ',');
    const String name = 'name:';
    const String nameHan = '名字:';
    const String nameJp = '名前:';
    if (v.contains(name)) return _extractByName(name);
    if (v.contains(nameHan)) return _extractByName(nameHan);
    if (v.contains(nameJp)) return _extractByName(nameJp);
    return null;
  }

  UserBox.fromJson(String v) {
    final Map<String, String> map = json.decode(v);
    this
      ..name = map['name']
      ..publicKey = map['key'];
  }
}
