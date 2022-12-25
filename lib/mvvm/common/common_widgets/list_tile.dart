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

class CommonListTile extends StatelessWidget {
  const CommonListTile(
      {this.icon,
      required this.title,
      this.trailing,
      this.nextPage,
      this.nextPageArgu,
      super.key});
  final IconData? icon;
  final String title;
  final Widget? trailing;
  final dynamic nextPage;
  final dynamic nextPageArgu;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.wPt),
      child: ListTile(
          onTap: () => Get.to(nextPage, arguments: nextPageArgu),
          leading: icon == null ? null : Icon(icon),
          title: Text(title),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (trailing != null) trailing!,
              if (nextPage != null)
                const Icon(CupertinoIcons.chevron_right, size: 16)
            ],
          )),
    );
  }
}
