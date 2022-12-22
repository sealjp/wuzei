/*
 * This file is part of the Wuzei (https://github.com/sealjp/Wuzei.git or 
 * git@github.com:sealjp/Wuzei.git).
 * 
 * Copyright (C) 2022 Zhang Xi (sealnippon@gmail.com)
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 3 as
 * published by the Free Software Foundation.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */


import '../../lib.dart';

const Color darkCardColor = Color(0xff424242);
const Color primaryColor = Color(0xff2196f3);
ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.blue,
  primaryColor: primaryColor,
  primaryColorLight: const Color(0xffbbdefb),
  primaryColorDark: const Color(0xff1976d2),
  canvasColor: const Color(0xfffafafa),
  scaffoldBackgroundColor: const Color(0xfffafafa),
  cardColor: const Color(0xffffffff),
  dividerColor: const Color(0x1f000000),
  highlightColor: const Color(0x66bcbcbc),
  splashColor: const Color(0x66c8c8c8),
  selectedRowColor: primaryColor,
  unselectedWidgetColor: Colors.grey,
  disabledColor: const Color(0x61000000),
  toggleableActiveColor: const Color(0xff1e88e5),
  secondaryHeaderColor: const Color(0xffe3f2fd),
  backgroundColor: const Color(0xff90caf9),
  dialogBackgroundColor: const Color(0xffffffff),
  indicatorColor: primaryColor,
  hintColor: const Color(0x8a000000),
  errorColor: const Color(0xffd32f2f),
  appBarTheme: AppBarTheme(
    centerTitle: false,
    backgroundColor: Colors.grey[100],
    elevation: 0,
    foregroundColor: Colors.grey[800],
    titleTextStyle:  TextStyle(
      fontSize: 16,
      color: Colors.grey[800],
    ),
  ),
  buttonTheme: const ButtonThemeData(
    padding: EdgeInsets.only(left: 16, right: 16),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2.0)),
    ),
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
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: const Color(0xff212121),
  primaryColorLight: const Color(0xff9e9e9e),
  primaryColorDark: const Color(0xff000000),
  canvasColor: const Color(0xff303030),
  scaffoldBackgroundColor: const Color(0xff303030),
  bottomAppBarColor: darkCardColor,
  cardColor: darkCardColor,
  dividerColor: const Color(0x1fffffff),
  highlightColor: const Color(0x40cccccc),
  splashColor: const Color(0x40cccccc),
  selectedRowColor: const Color(0xfff5f5f5),
  unselectedWidgetColor: Colors.grey,
  disabledColor: const Color(0x62ffffff),
  toggleableActiveColor: const Color(0xff1e88e5),
  secondaryHeaderColor: const Color(0xff616161),
  backgroundColor: const Color(0xff616161),
  dialogBackgroundColor: darkCardColor,
  indicatorColor: const Color(0xff1e88e5), //Color(0xff64ffda),
  hintColor: const Color(0x80ffffff),
  errorColor: const Color(0xffd32f2f),
  appBarTheme: const AppBarTheme(
      centerTitle: false,
      backgroundColor: darkCardColor,
      elevation: 0,
      foregroundColor: Colors.grey,
      titleTextStyle: TextStyle(fontSize: 16, color: Colors.grey)),
  bottomAppBarTheme:
      const BottomAppBarTheme(color: darkCardColor, elevation: 0),
);
