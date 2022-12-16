import 'package:flutter/services.dart';

import '../../lib.dart';

class TransferViewModel extends GetxController {
  RxBool encodeMode = true.obs;
  RxList<UserBox> users = <UserBox>[].obs;
  Rx<UserBox> user = UserBox().obs;
  late String privateKey;
  TextEditingController inputCtrl = TextEditingController(text: '');
  RxInt inputBytes = 0.obs;
  RxString output = ''.obs;

  @override
  void onInit() async {
    super.onInit();
   await loadUsers();
    user..value = users.first..refresh();
    _loadPrivateKey();
    _listenInputCtrl();
  }

 Future< void> loadUsers() async{users.value = await UserDao.queryAll();}

  void _loadPrivateKey() async {
    final String? key = await SafeBox.readPrivateKey();
    if (key == null) {
      await RSAUtil.generateMyKeyPair();
      _loadPrivateKey();
    } else {
      privateKey = key;
    }
  }

  void calInputBytes() =>
      inputBytes.value = RSAUtil.stringBytes(inputCtrl.text);

  void _listenInputCtrl() {
    inputCtrl.addListener(() {
      calInputBytes();
      if (inputCtrl.text.isEmpty) return;
      if (encodeMode.value) {
        if (user.value.publicKey == null) return;
        output.value = RSAUtil.encode(user.value.publicKey!, inputCtrl.text);
      } else {
        output.value = RSAUtil.decode(privateKey, inputCtrl.text);
      }
    });
  }

  void changeMode() => encodeMode.toggle();

  void selectUser(UserBox v) {
    user.value = v;
    Get.back();
  }

  void clearInput() {
    inputCtrl.text = '';
    calInputBytes();
  }

  Future<void> copy() async {
    await Clipboard.setData(ClipboardData(text: output.value));
  }

  Future<void> paste() async {
    final ClipboardData? data = await Clipboard.getData(Clipboard.kTextPlain);
    inputCtrl.text =  data?.text ?? '';
  }

 


}
