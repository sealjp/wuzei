import 'package:flutter/services.dart';

import '../../../lib.dart';

extension ManageUserExtension on UsersController {
  RxBool get isFilled => (nameErrorText.value.isEmpty &&
          keyErrorText.value.isEmpty &&
          nameCtrl.text.isNotEmpty &&
          publicKeyCtrl.text.isNotEmpty)
      .obs;

  void deleteName() => nameCtrl.text = '';

  void deleteKey() => publicKeyCtrl.text = '';

  Future<void> paste() async {
    final ClipboardData? cdata = await Clipboard.getData(Clipboard.kTextPlain);
    if (cdata == null) return;
    user
      ..value = UserBox.fromString(cdata.text ?? '')
      ..refresh();
    loadTextCtrls(user.value);
  }

  void deleteUser() =>
      user.value.id == 0 ? newUser() : Get.dialog(const DeleteAlertDialog());

  void removeUserFromBox() {
    // must not remove me. only update
    if (user.value.id == 1) return;
    UserDao.removeUser(user.value.id!);
    newUser();
    loadUsers();
    Get
      ..back()
      ..back();
  }

  void validateName(String? v) {
    nameErrorText.value = '';
    if (v?.isEmpty ?? true) nameErrorText.value = 'contacts_notName'.tr;
  }

  void validateKey(String? v) {
    keyErrorText.value = '';
    final int length = v?.length ?? 0;
    if (length != 367 ||
        v?.substring(0, 44) != 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA' ||
        v?.substring(length - 6, length) != 'IDAQAB')
      keyErrorText.value = 'contacts_notRSA'.tr;
  }

  /// edit or add user
  void manageUser() {
    validateName(nameCtrl.text);
    validateKey(publicKeyCtrl.text);
    if (nameCtrl.text.isEmpty && publicKeyCtrl.text.isEmpty) return;
    final DateTime now = DateTime.now();
    user.value
      ..name = nameCtrl.text
      ..publicKey = publicKeyCtrl.text
      ..keyTime = now
      ..contactTime = now;
    UserDao.save(user.value);
    loadUsers();
    Get.back();
  }
}
