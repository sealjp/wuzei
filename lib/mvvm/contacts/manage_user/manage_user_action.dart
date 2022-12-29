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

import 'package:flutter/services.dart';

import '../../../lib.dart';

extension ManageUserAction on ApplicationViewModel {
  void clearKey() => publicKeyCtrl.clear();

  Future<void> pasteUser() async {
    final ClipboardData? cdata = await Clipboard.getData(Clipboard.kTextPlain);
    if (cdata == null || cdata.text == null || cdata.text!.isEmpty) return;
    final UserBox u = UserBox.fromString(cdata.text!);
    nameCtrl.text = u.name ?? '';
    publicKeyCtrl.text = u.publicKey ?? '';
  }

  /// edit or add user
  void manageUser() {
    if (!manageUserFormKey.currentState!.validate()) return;
    final DateTime now = DateTime.now();
    user.value
      ..publicKey = publicKeyCtrl.text
      ..keyTime = now
      ..contactTime = now;
    isEditUser
        ? user.value.alias = nameCtrl.text
        : user.value.name = nameCtrl.text;
    user.value.id = UserDao.save(user.value);
    isEditUser ? users[userIndex] = user.value : users.add(user.value);
    users.refresh();
    Get.back();
  }
}
