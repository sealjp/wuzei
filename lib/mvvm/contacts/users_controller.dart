import '../../lib.dart';

class UsersController extends GetxController {
  RxList<UserBox> users = <UserBox>[].obs;
  Rx<UserBox> user = UserBox().obs;

  // add user
  TextEditingController nameCtrl = TextEditingController(text: '');
  TextEditingController publicKeyCtrl = TextEditingController(text: '');
  RxString nameErrorText = ''.obs;
  RxString keyErrorText = ''.obs;

  @override
  void onInit() async {
    super.onInit();
    await loadUsers();
  }

  Future<void> loadUsers() async {
    users
      ..value = await UserDao.queryAll()
      ..refresh();
  }

  void loadTextCtrls(UserBox v) {
    nameCtrl.text = user.value.name ?? '';
    publicKeyCtrl.text = user.value.publicKey ?? '';
  }

  void newUser() {
    user.value = UserBox();
    loadTextCtrls(user.value);
  }

  void toAddView() {
    newUser();
    Get.to(const AddUserView());
  }

  void toEditView(UserBox v) {
    user.value = v;
    loadTextCtrls(v);
    Get.to(const EditUserView());
  }
}
