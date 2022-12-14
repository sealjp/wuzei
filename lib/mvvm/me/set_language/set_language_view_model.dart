import '../../../lib.dart';

class SetLanguageViewModel extends GetxController {
  Rx<Locale> locale = const Locale('en', 'US').obs;

  @override
  void onInit() {
    super.onInit();
    locale.value = LocaleHandler.read();
  }

  void setLanguage(Locale v) {
    Get.updateLocale(v);
    SystemDao.saveLocale(v);
    locale.value = LocaleHandler.read();
  }
}
