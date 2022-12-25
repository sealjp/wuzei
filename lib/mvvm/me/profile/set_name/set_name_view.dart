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

import '../../../../lib.dart';

class SetNameView extends StatelessWidget {
  const SetNameView({super.key});

  @override
  Widget build(BuildContext context) {
    final ApplicationViewModel m = Get.find();
    return Scaffold(
        appBar: AppBar(
            // leading: TextButton(
            //   child: Text('common_cancel'.tr),
            //   onPressed: m.back,
            // ),
            actions: [
              TextButton(
                child: Text('common_complete'.tr),
                onPressed: m.complete,
              )
            ], title: Text('me_setName'.tr)),
        body: SafeArea(
            child: Padding(
                padding: EdgeInsets.all(16.wPt),
                child: Column(
                  children: [
                    TextFormField(
                        controller: m.nameCtrl,
                        maxLength: 32,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: m.clearName, //m.clear,
                                icon: const Icon(Icons.close_rounded)))),
                  ],
                ))));
  }
}
