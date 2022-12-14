import '../../lib.dart';

class ThemeHandler {
  /// return value isDark
  static bool read() => SystemDao.getIsDarkTheme() ?? Get.isPlatformDarkMode;
}
