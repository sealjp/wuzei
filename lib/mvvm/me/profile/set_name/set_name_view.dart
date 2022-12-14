import '../../../../lib.dart';

class SetNameView extends StatelessWidget {
  const SetNameView({super.key});

  @override
  Widget build(BuildContext context) {
    final MeController m = Get.find();
    return Scaffold(
        appBar: AppBar(
            leading: TextButton(
              child: Text('common_cancel'.tr),
              onPressed: m.back,
            ),
            actions: [
              TextButton(
                child: Text('common_complete'.tr),
                onPressed: m.complete,
              )
            ],
            title: Text('me_setName'.tr)),
        body: SafeArea(
            child: Padding(
                padding: EdgeInsets.all(16.wPt),
                child: Column(
                  children: [
                    TextFormField(
                        controller: m.nameCtrl,
                        maxLength: 32,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: m.clear, //m.clear,
                                icon: const Icon(Icons.close_rounded)))),
                  ],
                ))));
  }
}
