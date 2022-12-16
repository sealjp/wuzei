import '../../../lib.dart';

class SetLanguageView extends StatelessWidget {
  const SetLanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SetLanguageViewModel());
    return Scaffold(
        appBar: AppBar(title: Text('common_language'.tr)),
        body: SafeArea(
            child: Padding(
                padding: EdgeInsets.all(16.wPt),
                child: ListView(
                  children: const [
                    LanguageListTile(
                        title: 'English', locale: Locale('en', 'US')),
                    Divider(),
                    LanguageListTile(title: '中文', locale: Locale('zh', 'Hans')),
                    Divider(),
                    LanguageListTile(title: '日本語', locale: Locale('ja', 'JP'))
                  ],
                ))));
  }
}

class CheckMark extends StatelessWidget {
  const CheckMark(this.systemValue, this.value, {super.key});
  final systemValue;
  final value;

  @override
  Widget build(BuildContext context) {
    return Visibility(
        visible: systemValue == value,
        child: Icon(Icons.check, color: Theme.of(context).colorScheme.primary));
  }
}

class LanguageCheckMark extends StatelessWidget {
  const LanguageCheckMark(this.locale, {super.key});
  final Locale locale;
  @override
  Widget build(BuildContext context) {
    final SetLanguageViewModel m = Get.put(SetLanguageViewModel());
    return Obx(() => CheckMark(m.locale.value, locale));
  }
}

class LanguageListTile extends StatelessWidget {
  const LanguageListTile(
      {required this.title, required this.locale, super.key});
  final String title;
  final Locale locale;

  @override
  Widget build(BuildContext context) {
    final SetLanguageViewModel m = Get.put(SetLanguageViewModel());
    return ListTile(
        onTap: () => m.setLanguage(locale),
        title: Text(title),
        trailing: LanguageCheckMark(locale));
  }
}
