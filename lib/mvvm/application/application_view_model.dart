import '../../lib.dart';


class ApplicationViewModel extends GetxController {
  RxInt tabIndex = 0.obs;
 

  void onTap(int i) => tabIndex.value = i;

  @override
  void onReady() {}
}
