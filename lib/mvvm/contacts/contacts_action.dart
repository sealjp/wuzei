/*
 * This file is part of the Wuzei (https://github.com/sealjp/wuzei.git or 
 * git@github.com:sealjp/wuzei.git).
 * 
 * Copyright (C) 2022-2023 Zhang Xi (sealnippon@gmail.com)
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

extension ContactsAction on ApplicationViewModel {
  void removeUser() {
    UserDao.removeUser(user.value.id!);
    users
      ..removeAt(userIndex)
      ..refresh();
    Get.back();
  }

  void loadTextCtrls(UserBox v) {
    nameCtrl.text = v.name??'';
    publicKeyCtrl.text = v.publicKey ?? '';
  }

  void toAdd() {
    userIndex = users.length;
    loadTextCtrls(user.value);
    Get.to(const AddUserView());
  }

  void toEdit() {
    loadTextCtrls(user.value);
    Get.to(const EditUserView());
  }
}
