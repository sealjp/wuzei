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


import '../../../lib.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final MeController m = Get.find();
    final Map<String, String> map = {'name': m.me.value.name??'','key': m.me.value.publicKey ?? ''};
    return Scaffold(
        appBar: AppBar(title: Text('me_profile'.tr)),
        body: SafeArea(
            child: Padding(
                padding: EdgeInsets.all(16.wPt),
                child: ListView(
                  children: [
                    CommonListTile(
                        title: 'common_name'.tr,
                        trailing: Obx(() => Text(m.me.value.nameStr)),
                        nextPage: const SetNameView()),
                    const Divider(),
                    CommonListTile(
                        title: 'common_rsaPublicKey'.tr,
                        trailing: Obx(() => Text(m.me.value.publicKeyPartStr)),
                        nextPage: const UpdateKeyPairView()),
                    const Divider(),
                    CommonListTile(
                        title: 'common_timeOfCreateKey'.tr,
                        trailing: Obx(
                            () => Text(m.me.value.keyTime!.yyyyMmDdHhMmSs))),
                  ],
                ))));
  }
}
