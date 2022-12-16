
import '../../lib.dart';
import '../../main.dart';
import 'objectbox.g.dart';


class SystemDao {
  static  SystemBox _box = SystemBox();

  /// save to object box
  static void _update() => objectbox.systemBox.put(_box);

  static void saveTheme(int themeModeIndex) {
    /// in order to only save one record
    _read();
    _box.themeModeIndex = themeModeIndex;
    _update();
  }

  static ThemeMode getTheme() {
    _read();
    final int i =_box.themeModeIndex??0;
    return ThemeMode.values[i];
  }

  static void saveLocale(Locale? locale) {
    _read();
    _box.languageCode = locale?.languageCode??null;
    _update();
  }

  static Locale? getLocale() {
    _read();
    switch (_box.languageCode) {
      case 'ja':
        return const Locale('ja', 'JP');
      case 'zh':
        return const Locale('zh', 'Hans');
      default:
        return const Locale('en', 'US');
    }
  }


  static void _read() {
    final query = objectbox.systemBox.query(SystemBox_.id.equals(1)).build();
    final SystemBox? res = query.findFirst();
    query.close();
    if (res != null) _box = res;
  }

 
}
