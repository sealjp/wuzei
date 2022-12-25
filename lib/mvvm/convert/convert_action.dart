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

import '../../lib.dart';

extension ConvertAction on ApplicationViewModel {
  String get _output => encodeMode.value
      ? RSAUtil.encode(user.value.publicKey!, inputCtrl.text)
      : RSAUtil.decode(privateKey, inputCtrl.text);

  void inputChanged(String? v) {
    inputBytes.value = v!.bytes();
    if (inputBytes.value > 245) return;
    output.value = (v.isEmpty) ? '' : _output;
  }

  void changeMode() => encodeMode.toggle();

  void selectUser(int i) {
    userIndex = i;
    Get.back();
  }

  void clearInput() => inputCtrl.clear();

  void _setCopyFinished() {
    showCopyFinished.value = true;
    Future.delayed(const Duration(seconds: 1), () {
      showCopyFinished.value = false;
    });
  }

  Future<void> copyOutput() async {
    await Clipboard.setData(ClipboardData(text: output.value));
    _setCopyFinished();
  }

  Future<void> pasteConvert() async {
    final ClipboardData? data = await Clipboard.getData(Clipboard.kTextPlain);
    inputCtrl.text = data?.text ?? '';
  }
}
