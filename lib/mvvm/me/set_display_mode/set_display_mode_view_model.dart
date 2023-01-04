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

class SetDisplayModeViewModel extends GetxController {
  Rx<ThemeMode> mode = ThemeMode.system.obs;
  RxBool get isFollowSystem =>
      mode.value == ThemeMode.system ? true.obs : false.obs;
  ThemeMode get systemMode =>
      Get.isPlatformDarkMode ? ThemeMode.dark : ThemeMode.light;
  Rx<ThemeMode> get runningMode =>
      mode.value == ThemeMode.system ? systemMode.obs : mode;

  @override
  void onInit() {
    super.onInit();
    _loadTheme();
  }

  void _loadTheme() => mode.value = SystemDao.getTheme();

  void switchSystemMode(bool isSystem) {
    final ThemeMode v = isSystem ? ThemeMode.system : runningMode.value;
    setDisplayMode(v);
  }

  void _handleNotRefresh() => Get.updateLocale(Get.locale!);

  void setDisplayMode(ThemeMode v) {
    Get.changeThemeMode(v);
    _handleNotRefresh();
    SystemDao.saveTheme(v.index);
    _loadTheme();
  }
}
