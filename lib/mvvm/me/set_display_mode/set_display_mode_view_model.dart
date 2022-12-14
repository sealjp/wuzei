import '../../../lib.dart';

class SetDisplayModeViewModel extends GetxController {
  Rx<bool?> isDark = null.obs;

  @override
  void onInit() {
    super.onInit();
    // locale.value = LocaleHandler.read();
  }

  void setDisplayMode(Locale v) {

  }
}
