import '../../lib.dart';

class ThemeHandler {
 static ThemeData show() {
    ThemeMode mode = SystemDao.getTheme();
    if (mode == ThemeMode.system) {
      final bool isDark = Get.isPlatformDarkMode;
      mode = isDark ? ThemeMode.dark : ThemeMode.light;
    }
    return mode == ThemeMode.dark ? darkTheme : lightTheme;
  }
}
