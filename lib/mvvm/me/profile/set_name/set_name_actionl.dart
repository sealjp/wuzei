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


import '../../../../lib.dart';

extension SetNameAction on MeController {
  void inputName(String? v) {
    if (v == null) return;
    nameCtrl.text = v;
  }

  void clear() {
    nameCtrl.text = '';
  }

  void complete() {
    me.value.alias = nameCtrl.text;
    updateMe();
    loadMe();
    back();
  }
}
