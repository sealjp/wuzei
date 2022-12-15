import '../../lib.dart';


ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.blue,
  brightness: Brightness.light,
  primaryColor: primaryColor,
  primaryColorLight: Color(0xffbbdefb),
  primaryColorDark: Color(0xff1976d2),
  canvasColor: Color(0xfffafafa),
  scaffoldBackgroundColor: Color(0xfffafafa),
  // bottomAppBarColor: Color(0xffffffff),
  cardColor: Color(0xffffffff),
  dividerColor: Color(0x1f000000),
  highlightColor: Color(0x66bcbcbc),
  splashColor: Color(0x66c8c8c8),
  selectedRowColor: primaryColor,

  unselectedWidgetColor: Colors.grey,
  disabledColor: Color(0x61000000),
  toggleableActiveColor: Color(0xff1e88e5),
  secondaryHeaderColor: Color(0xffe3f2fd),
  backgroundColor: Color(0xff90caf9),
  dialogBackgroundColor: Color(0xffffffff),
  indicatorColor: primaryColor,
  hintColor: Color(0x8a000000),
  errorColor: Color(0xffd32f2f),
  buttonTheme: ButtonThemeData(
    textTheme: ButtonTextTheme.normal,
    minWidth: 88,
    height: 36,
    padding: EdgeInsets.only(top: 0, bottom: 0, left: 16, right: 16),
    shape: RoundedRectangleBorder(
      side: BorderSide(
        color: Color(0xff000000),
        width: 0,
        style: BorderStyle.none,
      ),
      borderRadius: BorderRadius.all(Radius.circular(2.0)),
    ),
    alignedDropdown: false,
    buttonColor: Color(0xffe0e0e0),
    disabledColor: Color(0x61000000),
    highlightColor: Color(0x29000000),
    splashColor: Color(0x1f000000),
    focusColor: Color(0x1f000000),
    hoverColor: Color(0x0a000000),
    colorScheme: ColorScheme(
      primary: primaryColor,
      secondary: Color(0xff2196f3),
      surface: Color(0xffffffff),
      background: Color(0xff90caf9),
      error: Color(0xffd32f2f),
      onPrimary: Color(0xffffffff),
      onSecondary: Color(0xffffffff),
      onSurface: Color(0xff000000),
      onBackground: Color(0xffffffff),
      onError: Color(0xffffffff),
      brightness: Brightness.light,
    ),
  ),
  textTheme: TextTheme(
    caption: TextStyle(
      color: Color(0x8a000000),
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    button: TextStyle(
      color: Color(0xdd000000),
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    overline: TextStyle(
      color: Color(0xff000000),
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: TextStyle(
      color: Color(0xdd000000),
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    helperStyle: TextStyle(
      color: Color(0xdd000000),
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    hintStyle: TextStyle(
      color: Color(0xdd000000),
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    errorStyle: TextStyle(
      color: Color(0xdd000000),
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    errorMaxLines: null,
    isDense: false,
    contentPadding: EdgeInsets.only(top: 12, bottom: 12, left: 0, right: 0),
    isCollapsed: false,
    prefixStyle: TextStyle(
      color: Color(0xdd000000),
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    suffixStyle: TextStyle(
      color: Color(0xdd000000),
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    counterStyle: TextStyle(
      color: Color(0xdd000000),
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    filled: false,
    fillColor: Color(0x00000000),
    errorBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: Color(0xff000000),
        width: 1,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.all(Radius.circular(4.0)),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: Color(0xff000000),
        width: 1,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.all(Radius.circular(4.0)),
    ),
    focusedErrorBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: Color(0xff000000),
        width: 1,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.all(Radius.circular(4.0)),
    ),
    disabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: Color(0xff000000),
        width: 1,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.all(Radius.circular(4.0)),
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: Color(0xff000000),
        width: 1,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.all(Radius.circular(4.0)),
    ),
    border: UnderlineInputBorder(
      borderSide: BorderSide(
        color: Color(0xff000000),
        width: 1,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.all(Radius.circular(4.0)),
    ),
  ),
  iconTheme: IconThemeData(
    color: Color(0xdd000000),
    opacity: 1,
    size: 24,
  ),
  primaryIconTheme: IconThemeData(
    color: Color(0xffffffff),
    opacity: 1,
    size: 24,
  ),



  dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(
    side: BorderSide(
      color: Color(0xff000000),
      width: 0,
      style: BorderStyle.none,
    ),
    borderRadius: BorderRadius.all(Radius.circular(0.0)),
  )),
);

const Color darkCardColor = Color(0xff424242);
const Color primaryColor = Color(0xff2196f3);
// const Color darkBlueColor = Color.fromARGB(255, 8, 90, 206);

ThemeData darkTheme = ThemeData(
  // primarySwatch: MaterialColor(4280361249, {
  //   50: Color(0xfff2f2f2),
  //   100: Color(0xffe6e6e6),
  //   200: Color(0xffcccccc),
  //   300: Color(0xffb3b3b3),
  //   400: Color(0xff999999),
  //   500: Color(0xff808080),
  //   600: Color(0xff666666),
  //   700: Color(0xff4d4d4d),
  //   800: Color(0xff333333),
  //   900: Color(0xff191919)
  // }),
  brightness: Brightness.dark,
  primaryColor: Color(0xff212121),
  primaryColorLight: Color(0xff9e9e9e),
  primaryColorDark: Color(0xff000000),
  canvasColor: Color(0xff303030),
  scaffoldBackgroundColor: Color(0xff303030),
  bottomAppBarColor: darkCardColor,
  cardColor: darkCardColor,
  dividerColor: Color(0x1fffffff),
  highlightColor: Color(0x40cccccc),
  splashColor: Color(0x40cccccc),
  selectedRowColor: Color(0xfff5f5f5),
  
  unselectedWidgetColor: Colors.grey,
  disabledColor: Color(0x62ffffff),
  toggleableActiveColor: Color(0xff1e88e5),
  secondaryHeaderColor: Color(0xff616161),
  backgroundColor: Color(0xff616161),
  dialogBackgroundColor: darkCardColor,
  indicatorColor: Color(0xff1e88e5), //Color(0xff64ffda),
  hintColor: Color(0x80ffffff),
  errorColor: Color(0xffd32f2f),
  appBarTheme: const AppBarTheme(
      centerTitle: false,
      backgroundColor: darkCardColor,
      elevation: 0,
      foregroundColor: Colors.grey,
      titleTextStyle: TextStyle(fontSize: 16, color: Colors.grey)),
  bottomAppBarTheme:
      const BottomAppBarTheme(color: darkCardColor, elevation: 0),
  buttonTheme: ButtonThemeData(
    textTheme: ButtonTextTheme.normal,
    minWidth: 88,
    height: 36,
    padding: EdgeInsets.only(top: 0, bottom: 0, left: 16, right: 16),
    shape: RoundedRectangleBorder(
      side: BorderSide(
        color: Color(0xff000000),
        width: 0,
        style: BorderStyle.none,
      ),
      borderRadius: BorderRadius.all(Radius.circular(2.0)),
    ),
    alignedDropdown: false,
    buttonColor: Color(0xff1e88e5),
    disabledColor: Color(0x61ffffff),
    highlightColor: Color(0x29ffffff),
    splashColor: Color(0x1fffffff),
    focusColor: Color(0x1fffffff),
    hoverColor: Color(0x0affffff),
    colorScheme: ColorScheme(
      primary: primaryColor,
      secondary: Color(0xff2196f3), //Color(0xff64ffda),
      surface: darkCardColor,
      background: Color(0xff616161),
      error: Color(0xffd32f2f),
      onPrimary: Color(0xffffffff),
      onSecondary: Color(0xff000000),
      onSurface: Color(0xffffffff),
      onBackground: Color(0xffffffff),
      onError: Color(0xff000000),
      brightness: Brightness.dark,
    ),
  ),
  textTheme: TextTheme(
    caption: TextStyle(
      color: Color(0xb3ffffff),
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    button: TextStyle(
      color: Color(0xffffffff),
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    overline: TextStyle(
      color: Color(0xffffffff),
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
  ),
  primaryTextTheme: TextTheme(
    caption: TextStyle(
      color: Color(0xb3ffffff),
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    button: TextStyle(
      color: Color(0xffffffff),
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    overline: TextStyle(
      color: Color(0xffffffff),
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: TextStyle(
      color: Color(0xffffffff),
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    helperStyle: TextStyle(
      color: Color(0xffffffff),
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    hintStyle: TextStyle(
      color: Color(0xffffffff),
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    errorStyle: TextStyle(
      color: Color(0xffffffff),
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    errorMaxLines: null,
    isDense: false,
    contentPadding: EdgeInsets.only(top: 12, bottom: 12, left: 0, right: 0),
    isCollapsed: false,
    prefixStyle: TextStyle(
      color: Color(0xffffffff),
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    suffixStyle: TextStyle(
      color: Color(0xffffffff),
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    counterStyle: TextStyle(
      color: Color(0xffffffff),
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    filled: false,
    fillColor: Color(0x00000000),
    errorBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: Color(0xff000000),
        width: 1,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.all(Radius.circular(4.0)),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: Color(0xff000000),
        width: 1,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.all(Radius.circular(4.0)),
    ),
    focusedErrorBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: Color(0xff000000),
        width: 1,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.all(Radius.circular(4.0)),
    ),
    disabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: Color(0xff000000),
        width: 1,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.all(Radius.circular(4.0)),
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: Color(0xff000000),
        width: 1,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.all(Radius.circular(4.0)),
    ),
    border: UnderlineInputBorder(
      borderSide: BorderSide(
        color: Color(0xff000000),
        width: 1,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.all(Radius.circular(4.0)),
    ),
  ),
  iconTheme: IconThemeData(
    color: Color(0xffffffff),
    opacity: 1,
    size: 24,
  ),
  primaryIconTheme: IconThemeData(
    color: Color(0xffffffff),
    opacity: 1,
    size: 24,
  ),


  dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(
    side: BorderSide(
      color: Color(0xff000000),
      width: 0,
      style: BorderStyle.none,
    ),
    borderRadius: BorderRadius.all(Radius.circular(0.0)),
  )),
);

// ThemeData(
//   bottomAppBarTheme:
//       const BottomAppBarTheme(color: appBarBackgroundColor, elevation: 0),
//   cardColor: Colors.grey[200],
//   disabledColor: Colors.grey,
//   primarySwatch: Colors.blue,
//   appBarTheme: const AppBarTheme(
//       centerTitle: false,
//       backgroundColor: appBarBackgroundColor,
//       elevation: 0,
//       foregroundColor: secondary,
//       titleTextStyle: TextStyle(fontSize: 16, color: Colors.black)),
//   colorScheme: const ColorScheme(
//     brightness: Brightness.light,

//     primary: Color(0xff08AAF5),
//     onPrimary: Color(0xffFCFCFF),
//     secondary: secondary,
//     onSecondary: Colors.white,

//     /// tab icon unselect
//     tertiary: Color(0xff1A1C1E),
//     error: Colors.red,
//     onError: Colors.red,
//     background: Colors.white,
//     onBackground: Color(0xff1A1C1E),
//     surface: Color(0xff1A1C1E),
//     onSurface: Color(0xff1A1C1E),
//   ),
//   scaffoldBackgroundColor: Colors.grey[50],
//   textTheme: const TextTheme(
//     titleSmall: TextStyle(
//         color: Color(0xa31A1C1E), fontSize: 12, fontWeight: FontWeight.w400),
//   ),
//   inputDecorationTheme: InputDecorationTheme(
//       labelStyle: const TextStyle(
//           color: Color(0xde1A1C1E), fontSize: 14, fontWeight: FontWeight.w600),
//       hintStyle: const TextStyle(
//           color: Color(0x641A1C1E), fontSize: 14, fontWeight: FontWeight.w600),
//       contentPadding: const EdgeInsets.only(left: 10),
//       filled: true,
//       fillColor: const Color(0xffF5F5F5),
//       border: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(4),
//         borderSide: BorderSide.none,
//       ),
//       focusColor: Colors.grey),
// );

// ThemeData darkTheme = ThemeData(
//   bottomAppBarTheme:
//       BottomAppBarTheme(color: Color.fromARGB(255, 21, 2, 67), elevation: 0),
//   cardColor: Colors.grey[200],
//   disabledColor: Colors.grey,
//   primarySwatch: Colors.blue,
//   appBarTheme: const AppBarTheme(
//       centerTitle: false,
//       backgroundColor: Color.fromARGB(255, 21, 2, 67),
//       elevation: 0,
//       foregroundColor: secondary,
//       titleTextStyle: TextStyle(fontSize: 16, color: Colors.black)),
//   colorScheme: const ColorScheme(
//     brightness: Brightness.dark,

//     primary: Color(0xff08AAF5),
//     onPrimary: Color(0xffFCFCFF),
//     secondary: secondary,
//     onSecondary: Colors.white,

//     /// tab icon unselect
//     tertiary: Color(0xff1A1C1E),
//     error: Colors.red,
//     onError: Colors.red,
//     background: Colors.white,
//     onBackground: Color(0xff1A1C1E),
//     surface: Color(0xff1A1C1E),
//     onSurface: Color(0xff1A1C1E),
//   ),
//   scaffoldBackgroundColor: Colors.black54,
//   textTheme: const TextTheme(
//     titleSmall: TextStyle(
//         color: Color(0xa31A1C1E), fontSize: 12, fontWeight: FontWeight.w400),
//   ),
//   inputDecorationTheme: InputDecorationTheme(
//       labelStyle: const TextStyle(
//           color: Color(0xde1A1C1E), fontSize: 14, fontWeight: FontWeight.w600),
//       hintStyle: const TextStyle(
//           color: Color(0x641A1C1E), fontSize: 14, fontWeight: FontWeight.w600),
//       contentPadding: const EdgeInsets.only(left: 10),
//       filled: true,
//       fillColor: Colors.grey,
//       border: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(4),
//         borderSide: BorderSide.none,
//       ),
//       focusColor: Colors.grey),
// );
