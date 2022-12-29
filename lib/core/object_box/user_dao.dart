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

import '../../lib.dart';
import 'objectbox.g.dart';
import '../../main.dart';

class UserDao {
  static Future<List<UserBox>> queryAll() async {
    List<UserBox> res;
    final queryB = objectbox.userBox.query()
      ..order(UserBox_.contactTime, flags: Order.descending);
    final query = queryB.build();
    res = query.find();
    query.close();
    return res;
  }

  // static UserBox queryLast() => queryAll().last;

  static UserBox queryMe() {
    final query = objectbox.userBox.query(UserBox_.id.equals(1)).build();
    final UserBox? result = query.findFirst();
    query.close();
    return result ?? _creatMe();
  }

  static UserBox _creatMe() {
    final UserBox me = UserBox(name: 'me');
    save(me);
    return me;
  }

  static removeUser(int id) => objectbox.userBox.remove(id);

  static int save(UserBox box) => objectbox.userBox.put(box);
}
