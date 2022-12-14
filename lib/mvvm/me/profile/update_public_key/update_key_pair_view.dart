import 'package:flutter/cupertino.dart';

import '../../../../lib.dart';

class UpdateKeyPairView extends StatelessWidget {
  const UpdateKeyPairView({super.key});

  @override
  Widget build(BuildContext context) {
    final MeController m = Get.find();
    return Scaffold(
        appBar: AppBar(title: Text('me_updateKeyPair'.tr)),
        body: SafeArea(
            child: Padding(
                padding: EdgeInsets.all(16.wPt),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(child: Text('me_updateKeyPairDescript'.tr)),
                      ],
                    ),
                    SizedBox(height: 20.wPt),
                    Row(
                      children: [
                        Text('common_rsaPublicKey'.tr),
                      ],
                    ),
                    Container(
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Theme.of(context).cardColor),
                            color: Theme.of(context).cardColor,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8))),
                        child: Padding(
                          padding: EdgeInsets.all(8.wPt),
                          child: Obx(() => Text(m.me.value.publicKey!)),
                        )),
                    SizedBox(height: 60.wPt),
                    StadiumTextButton(
                        title: 'me_update'.tr,
                        onPressed: () => Get.dialog(const UpdateAlertDialog()))
                  ],
                ))));
  }
}

class UpdateAlertDialog extends StatelessWidget {
  const UpdateAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final MeController m = Get.find();
    return CupertinoAlertDialog(
      title: Text('common_remind'.tr),
      content: Text('me_updateKeyPairDescript'.tr),
      actions: [
        TextButton(onPressed: m.back, child: Text('common_cancel'.tr)),
        TextButton(
            onPressed: () async {
              await m.generateKeyPair();
              m.back();
            },
            child: Text('me_update'.tr))
      ],
    );
  }
}
