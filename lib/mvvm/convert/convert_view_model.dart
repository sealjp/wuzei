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

import 'package:flutter/services.dart';

import '../../lib.dart';

class TransferViewModel extends GetxController {
  RxBool encodeMode = true.obs;
  RxList<UserBox> users = <UserBox>[].obs;
  Rx<UserBox> user = UserBox().obs;
  late String privateKey;
  TextEditingController inputCtrl = TextEditingController(text: '');
  RxInt inputBytes = 0.obs;
  RxString output = ''.obs;
  RxBool showCopyFinished = false.obs;

  @override
  void onInit() async {
    super.onInit();
    await loadUsers();
    user
      ..value = users.first
      ..refresh();
    _loadPrivateKey();
    _listenInputCtrl();
  }

  Future<void> loadUsers() async {
    users.value = await UserDao.queryAll();
  }

  void _loadPrivateKey() async {
    final String? key = await SafeBox.readPrivateKey();
    if (key == null) {
      await RSAUtil.generateMyKeyPair();
      _loadPrivateKey();
    } else {
      privateKey = key;
    }
  }

  void calInputBytes() =>
      inputBytes.value = RSAUtil.stringBytes(inputCtrl.text);

  void _listenInputCtrl() {
    inputCtrl.addListener(() {
      calInputBytes();
      if (inputCtrl.text.isEmpty) return;
      if (encodeMode.value) {
        if (user.value.publicKey == null) return;
        output.value = RSAUtil.encode(user.value.publicKey!, inputCtrl.text);
      } else {
        output.value = RSAUtil.decode(privateKey, inputCtrl.text);
      }
    });
  }

  void changeMode() => encodeMode.toggle();

  void selectUser(UserBox v) {
    user.value = v;
    Get.back();
  }

  void clearInput() {
    inputCtrl.text = '';
    calInputBytes();
  }

  void _setCopyFinished() {
    showCopyFinished.value = true;
    Future.delayed(const Duration(seconds: 1), () {
      showCopyFinished.value = false;
    });
  }

  Future<void> copy() async {
    await Clipboard.setData(ClipboardData(text: output.value));
    _setCopyFinished();
  }

  Future<void> paste() async {
    final ClipboardData? data = await Clipboard.getData(Clipboard.kTextPlain);
    inputCtrl.text = data?.text ?? '';
  }
}
