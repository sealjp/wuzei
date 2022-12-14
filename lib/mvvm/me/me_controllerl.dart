import '../../lib.dart';

class MeController extends GetxController {
  Rx<UserBox> me = UserBox().obs;
  TextEditingController nameCtrl = TextEditingController();
 

  @override
  void onInit() async {
    super.onInit();
    loadMe();
  }

 void loadMe() {
    me.value = UserDao.queryMe();
    nameCtrl.text = me.value.nameStr;
  }

  void updateMe() => UserDao.save(me.value);

  Future<void> generateKeyPair() async {
    me
      ..value = await RSAUtil.generateMyKeyPair()
      ..refresh();
  }

  void back() => Get.back();

    @override
  void onClose() {
    nameCtrl.dispose();
  }
}
