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

import 'package:flutter/cupertino.dart';

import '../../../../lib.dart';

class UpdatePublicKeyView extends StatelessWidget {
  const UpdatePublicKeyView({super.key});

  @override
  Widget build(BuildContext context) {
    final ApplicationViewModel m = Get.find();
    return Scaffold(
        appBar: AppBar(title: Text('me_updatePublicKey'.tr)),
        body: SafeArea(
            child: Padding(
                padding: EdgeInsets.all(16.wPt),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(child: Text('me_updatePublicKeyDescript'.tr)),
                      ],
                    ),
                    SizedBox(height: 20.wPt),
                    Row(
                      children: [
                        Text('common_rsaPublicKey'.tr),
                      ],
                    ),
                    Container(
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Theme.of(context).cardColor),
                            color: Theme.of(context).cardColor,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8))),
                        child: Padding(
                          padding: EdgeInsets.all(8.wPt),
                          child: Obx(() => Text(m.user.value.publicKey!)),
                        )),
                    SizedBox(height: 60.wPt),
                    StadiumTextButton(
                        title: 'me_update'.tr,
                        onPressed: () => Get.dialog(const UpdateAlertDialog()))
                  ],
                ))));
  }
}

class UpdateAlertDialog extends StatelessWidget {
  const UpdateAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final ApplicationViewModel m = Get.find();
    return CupertinoAlertDialog(
      title: Text('common_remind'.tr),
      content: Text('me_updatePublicKeyDescript'.tr),
      actions: [
        TextButton(onPressed: Get.back, child: Text('common_cancel'.tr)),
        TextButton(
            onPressed:m.generateKeyPair,
            child: Text('me_update'.tr))
      ],
    );
  }
}
