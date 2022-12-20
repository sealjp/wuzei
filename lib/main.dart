import 'lib.dart';

/// Provides access to the ObjectBox Store throughout the app.
late ObjectBox objectbox;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  objectbox = await ObjectBox.create();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wuzei',
      theme: ThemeHandler.show(),
      locale: SystemDao.getLocale(),
      translations: AppTranslations(),
      home: const ApplicationView(),
    );
  }
}
