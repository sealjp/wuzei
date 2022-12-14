import '../../lib.dart';

extension ScreenSize on double {
  //デザイン：390px / 844p
  double get wPt => this * Get.width / 390;
  double get hPt => this * Get.height / 844;
}


extension ScreenSize2 on int {
  //デザイン：390px / 844p
  double get wPt => this * Get.width / 390;
  double get hPt => this * Get.height / 844;
}