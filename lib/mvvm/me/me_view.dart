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

import '../../lib.dart';

class MeView extends StatelessWidget {
  const MeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ApplicationViewModel m = Get.find();
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: Text('common_me'.tr)),
        body: SafeArea(
            child: Padding(
                padding: EdgeInsets.all(16.wPt),
                child: ListView(
                  children: [
                    const ProfileListTile(),
                    const Divider(),
                    CommonListTile(
                      icon: Icons.share,
                      title: 'me_sendMyPublicKey'.tr,
                      nextPage: const ShareView(),
                      nextPageArgu: [m.user.value],
                    ),
                    const Divider(),
                    CommonListTile(
                        icon: Icons.language,
                        title: 'common_language'.tr,
                        nextPage: const SetLanguageView()),
                    const Divider(),
                    CommonListTile(
                        icon: CupertinoIcons.moon,
                        title: 'common_display'.tr,
                        nextPage: const SetDisplayModeView()),
                  ],
                ))));
  }
}

class ProfileListTile extends StatelessWidget {
  const ProfileListTile({super.key});
  @override
  Widget build(BuildContext context) {
    final ApplicationViewModel m = Get.find();
    return ListTile(
        onTap: () => Get.to(const ProfileView()),
        leading: SizedBox(
            child: CircleAvatar(child: Obx(() => Text(m.user.value.initial)))),
        title: Row(
          children: [Obx(() => Text(m.user.value.nameStr))],
        ),
        subtitle: Obx(() => Text(
            "${'common_rsaPublicKey'.tr}: ${m.user.value.publicKeyPartStr}")),
        trailing: const Icon(CupertinoIcons.chevron_right, size: 16));
  }
}
