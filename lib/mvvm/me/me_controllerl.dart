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


import '../../lib.dart';

class MeController extends GetxController {
  Rx<UserBox> me = UserBox().obs;
  TextEditingController nameCtrl = TextEditingController();
 

  @override
  void onInit() async {
    super.onInit();
    loadMe();
  }

 void loadMe() {
    me.value = UserDao.queryMe();
    nameCtrl.text = me.value.nameStr;
  }

  void updateMe() => UserDao.save(me.value);

  Future<void> generateKeyPair() async {
    me
      ..value = await RSAUtil.generateMyKeyPair()
      ..refresh();
  }

  void back() => Get.back();

    @override
  void onClose() {
    nameCtrl.dispose();
  }
}
