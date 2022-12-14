import '../../../../lib.dart';

extension SetNameAction on MeController {
  void inputName(String? v) {
    if (v == null) return;
    nameCtrl.text = v;
  }

  void clear() {
    nameCtrl.text = '';
  }

  void complete() {
    me.value.alias = nameCtrl.text;
    updateMe();
    loadMe();
    back();
  }
}
