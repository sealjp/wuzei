import '../../../lib.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final MeController m = Get.find();
    final Map<String, String> map = {'name': m.me.value.name??'','key': m.me.value.publicKey ?? ''};
    return Scaffold(
        appBar: AppBar(title: Text('me_profile'.tr)),
        body: SafeArea(
            child: Padding(
                padding: EdgeInsets.all(16.wPt),
                child: ListView(
                  children: [
                    CommonListTile(
                        title: 'common_name'.tr,
                        trailing: Obx(() => Text(m.me.value.nameStr)),
                        nextPage: const SetNameView()),
                    const Divider(),
                    CommonListTile(
                        title: 'common_rsaPublicKey'.tr,
                        trailing: Obx(() => Text(m.me.value.publicKeyPartStr)),
                        nextPage: const UpdateKeyPairView()),
                    const Divider(),
                    CommonListTile(
                        title: 'common_timeOfCreateKey'.tr,
                        trailing: Obx(
                            () => Text(m.me.value.keyTime!.yyyyMmDdHhMmSs))),
                  ],
                ))));
  }
}
