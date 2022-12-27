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

import 'package:flutter/cupertino.dart';

import '../../../lib.dart';

class EditUserView extends StatelessWidget {
  const EditUserView({super.key});
  @override
  Widget build(BuildContext context) => const ManageUserView(
      title: 'contacts_edit',
      delBtnTitle: 'contacts_remove',
      manageBtnTitle: 'common_save');
}

class AddUserView extends StatelessWidget {
  const AddUserView({super.key});
  @override
  Widget build(BuildContext context) => const ManageUserView(
      title: 'contacts_add',
      delBtnTitle: 'common_clear',
      manageBtnTitle: 'common_add');
}

class ManageUserView extends StatelessWidget {
  const ManageUserView(
      {required this.title,
      required this.delBtnTitle,
      required this.manageBtnTitle,
      super.key});
  final String title;
  final String delBtnTitle;
  final String manageBtnTitle;

  @override
  Widget build(BuildContext context) {
    final ApplicationViewModel m = Get.find();
    return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              title: Text(title.tr),
              actions: [
                IconButton(
                    onPressed: m.pasteUser,
                    icon: const Icon(CupertinoIcons.doc_on_clipboard),
                    color: Theme.of(context).primaryColor),

              ],
            ),
            body: SafeArea(
                child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: m.manageUserFormKey,
                child: Column(
                  children: [
                    const TitleWidget('common_name'),
                    TextFormField(
                        controller: m.nameCtrl,
                        validator: Validator.name,
                        maxLength: 32,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: m.clearName,
                                icon: const Icon(Icons.close_rounded)))),
                    const TitleWidget('common_rsaPublicKey'),
                    Obx(() => TextFormField(
                          enabled: m.user.value.id == 1 ? false : true,
                          controller: m.publicKeyCtrl,
                          validator: Validator.publickey,
                          minLines: 13,
                          maxLines: 13,
                          maxLength: 392,
                        )),
                    StadiumTextButton(
                      title: manageBtnTitle.tr,
                      onPressed: m.manageUser,
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ))));
  }
}


