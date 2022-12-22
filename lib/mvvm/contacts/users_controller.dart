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

class UsersController extends GetxController {
  RxList<UserBox> users = <UserBox>[].obs;
  Rx<UserBox> user = UserBox().obs;

  // add user
  TextEditingController nameCtrl = TextEditingController(text: '');
  TextEditingController publicKeyCtrl = TextEditingController(text: '');
  RxString nameErrorText = ''.obs;
  RxString keyErrorText = ''.obs;

  @override
  void onInit() async {
    super.onInit();
    await loadUsers();
  }

  Future<void> loadUsers() async {
    users
      ..value = await UserDao.queryAll()
      ..refresh();
  }

  void loadTextCtrls(UserBox v) {
    nameCtrl.text = user.value.name ?? '';
    publicKeyCtrl.text = user.value.publicKey ?? '';
  }

  void newUser() {
    user.value = UserBox();
    loadTextCtrls(user.value);
  }

  void toAddView() {
    newUser();
    Get.to(const AddUserView());
  }

  void toEditView(UserBox v) {
    user.value = v;
    loadTextCtrls(v);
    Get.to(const EditUserView());
  }
}
