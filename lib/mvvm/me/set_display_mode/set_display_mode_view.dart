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

import '../../../lib.dart';

class SetDisplayModeView extends StatelessWidget {
  const SetDisplayModeView({super.key});

  @override
  Widget build(BuildContext context) {
    final SetDisplayModeViewModel m = Get.put(SetDisplayModeViewModel());
    return Scaffold(
        appBar: AppBar(title: Text('common_displayMode'.tr)),
        body: SafeArea(
            child: Padding(
                padding: EdgeInsets.all(16.wPt),
                child: ListView(
                  children: [
                    ListTile(
                      leading: Text('me_sytemMode'.tr),
                      trailing: Obx(() => Switch(
                          value: m.isFollowSystem.value,
                          onChanged: m.switchSystemMode)),
                    ),
                    const _Divider(),
                    const DisplayModeListTile(ThemeMode.dark),
                    const _Divider(),
                    const DisplayModeListTile(ThemeMode.light),
                  ],
                ))));
  }
}

class DisplayModeCheckMark extends StatelessWidget {
  const DisplayModeCheckMark(this.mode, {super.key});
  final ThemeMode mode;
  @override
  Widget build(BuildContext context) {
    final SetDisplayModeViewModel m = Get.put(SetDisplayModeViewModel());
    return Obx(() => CheckMark(m.runningMode.value, mode));
  }
}

class DisplayModeListTile extends StatelessWidget {
  const DisplayModeListTile(this.mode, {super.key});
  final ThemeMode mode;

  @override
  Widget build(BuildContext context) {
    final SetDisplayModeViewModel m = Get.put(SetDisplayModeViewModel());
    return Obx(() => Visibility(
        visible: !m.isFollowSystem.value,
        child: ListTile(
            onTap: () => m.setDisplayMode(mode),
            title: Text(mode.name.tr),
            trailing: DisplayModeCheckMark(mode))));
  }
}

class _Divider extends StatelessWidget {
  const _Divider({super.key});

  @override
  Widget build(BuildContext context) {
    final SetDisplayModeViewModel m = Get.put(SetDisplayModeViewModel());
    return Obx(() =>
        Visibility(visible: !m.isFollowSystem.value, child: const Divider()));
  }
}
