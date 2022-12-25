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

class ApplicationViewModel extends GetxController {
  RxInt tabIndex = 0.obs;

  RxList<UserBox> users = <UserBox>[].obs;
  int userIndex = 0;
  Rx<UserBox> get user => users[userIndex].obs;

  late String privateKey;
  RxBool encodeMode = true.obs;
  TextEditingController inputCtrl = TextEditingController(text: '');
  RxBool showCopyFinished = false.obs;
  RxInt inputBytes = 0.obs;
  RxString output = ''.obs;

  TextEditingController nameCtrl = TextEditingController();
  RxString nameErrorText = ''.obs;
  RxString keyErrorText = ''.obs;

  TextEditingController publicKeyCtrl = TextEditingController();

  void switchTab(int i) {
    tabIndex.value = i;
    if (i == 2) userIndex = 0;
  }

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

  @override
  void onClose() {
    inputCtrl.dispose();
    nameCtrl.dispose();
    publicKeyCtrl.dispose();
  }
}
