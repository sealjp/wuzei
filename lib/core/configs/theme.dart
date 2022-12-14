import '../../lib.dart';

const Color appBarBackgroundColor = Color.fromARGB(255, 218, 240, 250);
const Color secondary = Color(0xff1A1C1E);

ThemeData themeData = ThemeData(
  bottomAppBarTheme:
      const BottomAppBarTheme(color: appBarBackgroundColor, elevation: 0),
  cardColor: Colors.grey[200],
  disabledColor: Colors.grey,
  primarySwatch: Colors.blue,
  appBarTheme: const AppBarTheme(
      centerTitle: false,
      backgroundColor: appBarBackgroundColor,
      elevation: 0,
      foregroundColor: secondary,
      titleTextStyle: TextStyle(fontSize: 16, color: Colors.black)),
  colorScheme: const ColorScheme(
    brightness: Brightness.light,

    primary: Color(0xff08AAF5),
    onPrimary: Color(0xffFCFCFF),
    secondary: secondary,
    onSecondary: Colors.white,

    /// tab icon unselect
    tertiary: Color(0xff1A1C1E),
    error: Colors.red,
    onError: Colors.red,
    background: Colors.white,
    onBackground: Color(0xff1A1C1E),
    surface: Color(0xff1A1C1E),
    onSurface: Color(0xff1A1C1E),
  ),
  scaffoldBackgroundColor: Colors.grey[50],
  textTheme: const TextTheme(
    displayLarge:
        TextStyle(color: Color(0xff1A1C1E), fontSize: 16, fontWeight: FontWeight.w600),

    /// welcome text
    displaySmall: TextStyle(
        color: Color(0xff1A1C1E), fontSize: 16, fontWeight: FontWeight.w600),

    /// welcome text
    bodySmall: TextStyle(color: Color(0xa31A1C1E), fontSize: 12),

    titleLarge:
        TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
    //ListTile
    titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),

    /// tab button text 1A1C1E;  unselected: 400, 64% a3; selected: 700 87% de
    /// this is for unselected
    titleSmall: TextStyle(
        color: Color(0xa31A1C1E), fontSize: 12, fontWeight: FontWeight.w400),
  ),

  inputDecorationTheme: InputDecorationTheme(
      labelStyle: const TextStyle(
          color: Color(0xde1A1C1E),
          fontSize: 14,
          fontWeight: FontWeight.w600), //87%
      hintStyle: const TextStyle(
          color: Color(0x641A1C1E),
          fontSize: 14,
          fontWeight: FontWeight.w600), //38% Color(0x641A1C1E)
      contentPadding: const EdgeInsets.only(left: 10),
      filled: true,
      fillColor: const Color(0xffF5F5F5),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide.none,
      ),
      focusColor: Colors.grey),

  //  listTileTheme: ListTileThemeData(tileColor:Colors.grey[200], )
);
