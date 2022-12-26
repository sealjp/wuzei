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
  RxBool get isFilled => (nameErrorText.value == null &&
          keyErrorText.isEmpty &&
          nameCtrl.text.isNotEmpty &&
          publicKeyCtrl.text.isNotEmpty)
      .obs;

  void clearKey() => publicKeyCtrl.clear();

  Future<void> pasteUser() async {
    final ClipboardData? cdata = await Clipboard.getData(Clipboard.kTextPlain);
    if (cdata == null || cdata.text == null || cdata.text!.isEmpty) return;
    final UserBox u = UserBox.fromString(cdata.text!);
    nameCtrl.text = u.name ?? '';
    publicKeyCtrl.text = u.publicKey ?? '';
  }

  void deleteUser() =>
      user.value.id == 0 ? newUser() : Get.dialog(const DeleteAlertDialog());

  void removeUserFromBox() {
    // must not remove me. only update
    if (user.value.id == 1) return;
    UserDao.removeUser(user.value.id!);
    newUser();
    users
      ..removeAt(userIndex)
      ..refresh();
    Get
      ..back()
      ..back();
  }

  void validateName(String? v) {
    nameErrorText.value = null;
    if (v?.isEmpty ?? true) nameErrorText.value = 'contacts_notName'.tr;
  }

  void validateKey(String? v) {
    keyErrorText.value = '';
    final int length = v?.length ?? 0;
    if (length != 367 ||
        v?.substring(0, 44) != 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA' ||
        v?.substring(length - 6, length) != 'IDAQAB')
      keyErrorText.value = 'contacts_notRSA'.tr;
  }
  // String? validateKey(String? v) {
  //   final int length = v?.length ?? 0;
  //   if (length != 367 ||
  //       v?.substring(0, 44) != 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA' ||
  //       v?.substring(length - 6, length) != 'IDAQAB')
  //     return 'contacts_notRSA'.tr;
  //   return null;
  // }

  /// edit or add user
  void manageUser() {
    validateName(nameCtrl.text);
    validateKey(publicKeyCtrl.text);
    if (nameCtrl.text.isEmpty && publicKeyCtrl.text.isEmpty) return;
    final DateTime now = DateTime.now();
    user.value
      ..name = nameCtrl.text
      ..publicKey = publicKeyCtrl.text
      ..keyTime = now
      ..contactTime = now;
    UserDao.save(user.value);
    userIndex < users.length
        ? users[userIndex] = user.value
        : users.add(user.value);
    users.refresh();
    Get.back();
  }
}
