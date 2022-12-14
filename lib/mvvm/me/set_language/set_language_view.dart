import '../../../lib.dart';

class SetLanguageView extends StatelessWidget {
  const SetLanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    final SetLanguageViewModel m = Get.put(SetLanguageViewModel());
    return Scaffold(
        appBar: AppBar(title: Text('common_language'.tr)),
        body: SafeArea(
            child: Padding(
                padding: EdgeInsets.all(16.wPt),
                child: ListView(
                  children: [
                    ListTile(
                        onTap: () => m.setLanguage(const Locale('en', 'US')),
                        title: const Text('English'),
                        trailing: const CheckMark(Locale('en', 'US'))),
                    ListTile(
                        onTap: () => m.setLanguage(const Locale('zh', 'Hans')),
                        title: const Text('中文'),
                        trailing: const CheckMark(Locale('zh', 'Hans'))),
                    ListTile(
                        onTap: () => m.setLanguage(const Locale('ja', 'JP')),
                        title: const Text('日本語'),
                        trailing: const CheckMark(Locale('ja', 'JP'))),
                  ],
                ))));
  }
}

class CheckMark extends StatelessWidget {
  const CheckMark(this.locale, {super.key});
  final Locale locale;

  @override
  Widget build(BuildContext context) {
    final SetLanguageViewModel m = Get.find();
    return Obx(() => Visibility(
        visible: m.locale.value == locale,
        child:
            Icon(Icons.check, color: Theme.of(context).colorScheme.primary)));
  }
}
