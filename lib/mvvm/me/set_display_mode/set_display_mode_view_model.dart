import '../../../lib.dart';

class SetDisplayModeViewModel extends GetxController {
  Rx<ThemeMode> boxMode = ThemeMode.system.obs;
  Rx<ThemeMode> runningMode = ThemeMode.system.obs;

  @override
  void onInit() {
    super.onInit();
    _getModes();
  }

  ThemeMode _bool2Mode(bool? v) {
    switch (v) {
      case null:
        return ThemeMode.system;

      case true:
        return ThemeMode.dark;

      case false:
        return ThemeMode.light;
      default:
        return ThemeMode.system;
    }
  }

  bool? _mode2bool(ThemeMode v) {
    switch (v) {
      case ThemeMode.dark:
        return true;

      case ThemeMode.light:
        return false;
      case ThemeMode.system:
        return null;
    }
  }

  void _getBoxMode() {
    final bool? boxValue = SystemDao.getIsDarkTheme();
    boxMode.value = _bool2Mode(boxValue);
  }

  void _getRunningMode() {
    final bool runningValue = ThemeHandler.read();
    runningMode.value = _bool2Mode(runningValue);
  }

  void _getModes() {
    _getBoxMode();
    _getRunningMode();
  }

  void switchSystemMode(bool isSystem) {
    final ThemeMode v = isSystem ? ThemeMode.system : runningMode.value;
    setDisplayMode(v);
  }

  void _handleNotRefresh() => Get.updateLocale(Get.locale!);

  void setDisplayMode(ThemeMode mode) {
    Get.changeThemeMode(mode);
    _handleNotRefresh();
    final bool? v = _mode2bool(mode);
    SystemDao.saveTheme(v);
    _getModes();
  }
}
