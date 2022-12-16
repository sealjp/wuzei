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
