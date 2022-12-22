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


import '../../lib.dart';
import '../../main.dart';
import 'objectbox.g.dart';


class SystemDao {
  static  SystemBox _box = SystemBox();

  /// save to object box
  static void _update() => objectbox.systemBox.put(_box);

  static void saveTheme(int themeModeIndex) {
    /// in order to only save one record
    _read();
    _box.themeModeIndex = themeModeIndex;
    _update();
  }

  static ThemeMode getTheme() {
    _read();
    final int i =_box.themeModeIndex??0;
    return ThemeMode.values[i];
  }

  static void saveLocale(Locale? locale) {
    _read();
    _box.languageCode = locale?.languageCode??null;
    _update();
  }

  static Locale? getLocale() {
    _read();
    switch (_box.languageCode) {
      case 'ja':
        return const Locale('ja', 'JP');
      case 'zh':
        return const Locale('zh', 'Hans');
      default:
        return const Locale('en', 'US');
    }
  }


  static void _read() {
    final query = objectbox.systemBox.query(SystemBox_.id.equals(1)).build();
    final SystemBox? res = query.findFirst();
    query.close();
    if (res != null) _box = res;
  }

 
}
