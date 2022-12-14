import '../../../lib.dart';

class ShareView extends StatelessWidget {
  const ShareView({super.key});

  @override
  Widget build(BuildContext context) {
    final MeController m = Get.find();
    return Scaffold(
        appBar: AppBar(title: Text('me_sendMyPublicKey'.tr)),
        body: SafeArea(
            child: Padding(
                padding: EdgeInsets.all(16.wPt),
                child: Column(
                  children: [
                    Text('me_shareDescript'.tr),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 28.0),
                      child: StadiumTextButton(
                        title: 'me_sendMyPublicKey'.tr,
                        onPressed: m.share,
                      ),
                    )
                  ],
                ))));
  }
}
