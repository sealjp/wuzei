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

class ApplicationView extends StatelessWidget {
  const ApplicationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ApplicationViewModel m = Get.put((ApplicationViewModel()));
    return Obx(
      () => DefaultTabController(
        initialIndex: m.tabIndex.value,
        length: 3,
        child: Scaffold(
          body: const TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [ConvertView(), ContactsView(), MeView()],
          ),
          bottomNavigationBar: BottomAppBar(
            notchMargin: 6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                BottomItem(0, CupertinoIcons.chat_bubble_2,
                    CupertinoIcons.chat_bubble_2_fill, 'common_convert'.tr),
                BottomItem(1, CupertinoIcons.person_2,
                    CupertinoIcons.person_2_fill, 'common_contacts'.tr),
                BottomItem(2, CupertinoIcons.person, CupertinoIcons.person_fill,
                    'common_me'.tr),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BottomItem extends StatelessWidget {
  final int index;
  final IconData iconData;
  final IconData selectedIconData;
  final String title;
  const BottomItem(this.index, this.iconData, this.selectedIconData, this.title,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ApplicationViewModel m = Get.find();
    final selectedColor = Theme.of(context).selectedRowColor;
    final unselectedColor = Theme.of(context).unselectedWidgetColor;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          m.switchTab(index);
          DefaultTabController.of(context)!.animateTo(index);
        },
        child: SizedBox(
          height: 60,
          child: Padding(
            padding: const EdgeInsets.only(top: 3.0),
            child: Center(
              child: Obx(() => Column(
                    children: <Widget>[
                      if (index == m.tabIndex.value)
                        Icon(selectedIconData, color: selectedColor)
                      else
                        Icon(iconData, color: unselectedColor),
                      Text(
                        title,
                        style: TextStyle(
                            color: index == m.tabIndex.value
                                ? selectedColor
                                : unselectedColor),
                      ),
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
