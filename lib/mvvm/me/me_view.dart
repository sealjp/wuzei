import 'package:flutter/cupertino.dart';

import '../../lib.dart';

class MeView extends StatelessWidget {
  const MeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MeController(), permanent: true);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: Text('common_me'.tr)),
        body: SafeArea(
            child: Padding(
                padding: EdgeInsets.all(16.wPt),
                child: ListView(
                  children: [
                    const ProfileListTile(),
                    const Divider(),
                    CommonListTile(
                        icon: Icons.share,
                        title: 'me_sendMyPublicKey'.tr,
                        nextPage: const ShareView()),
                    const Divider(),
                    CommonListTile(
                        icon: Icons.language,
                        title: 'common_language'.tr,
                        nextPage: const SetLanguageView()),
                         const Divider(),
                    CommonListTile(
                        icon: CupertinoIcons.moon,
                        title: 'common_display'.tr,
                        nextPage: const SetDisplayModeView()),
                  ],
                ))));
  }
}

class ProfileListTile extends StatelessWidget {
  const ProfileListTile({super.key});
  @override
  Widget build(BuildContext context) {
    final MeController m = Get.find();
    return ListTile(
      onTap: () =>Get.to(const ProfileView()),
      leading: SizedBox(
          child: CircleAvatar(child: Obx(() => Text(m.me.value.initial)))),
      title: Row(
        children: [Obx(() => Text(m.me.value.nameStr))],
      ),
      subtitle: Obx(() =>
          Text("${'common_rsaPublicKey'.tr}: ${m.me.value.publicKeyPartStr}")),
      trailing: const Icon(CupertinoIcons.chevron_right, size: 16)
    );
  }
}
