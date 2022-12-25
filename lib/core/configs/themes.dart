/*
 * This file is part of the Wuzei (https://github.com/sealjp/wuzei.git or 
 * git@github.com:sealjp/wuzei.git).
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

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.blue,
  primaryColor: Colors.blue,
  primaryColorLight: Colors.blue[400],
  primaryColorDark: Colors.blue[600],
  canvasColor: const Color(0xfffafafa),
  scaffoldBackgroundColor: Colors.grey[50],
  cardColor: Colors.grey[100],
  dividerColor: Colors.grey[200],
  highlightColor: Colors.black87,
  splashColor: const Color(0x66c8c8c8),
  
  // selectedRowColor: primaryColor,
  unselectedWidgetColor: Colors.grey,
  disabledColor: Colors.grey[300],
  toggleableActiveColor: const Color(0xff1e88e5),
  secondaryHeaderColor: const Color(0xffe3f2fd),
  
  backgroundColor: const Color(0xff90caf9),
  
  dialogBackgroundColor: const Color(0xffffffff),
  indicatorColor: Colors.blue,
  hintColor: const Color(0x8a000000),
  errorColor: const Color(0xffd32f2f),
  appBarTheme: AppBarTheme(
    centerTitle: false,
    backgroundColor: Colors.grey[100],
    elevation: 0,
    foregroundColor: Colors.grey[800],
    titleTextStyle: TextStyle(
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
    // colorScheme: ColorScheme(
    //   primary: primaryColor,
    //   secondary: Color(0xff2196f3),
    //   surface: Color(0xffffffff),
    //   background: Color(0xff90caf9),
    //   error: Color(0xffd32f2f),
    //   onPrimary: Color(0xffffffff),
    //   onSecondary: Color(0xffffffff),
    //   onSurface: Color(0xff000000),
    //   onBackground: Colors.black12,
    //   onError: Color(0xffffffff),
    //   brightness: Brightness.light,
    // ),
  ),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: const Color(0xff212121),
  primaryColorLight: const Color(0xff9e9e9e),
  primaryColorDark: const Color(0xff000000),
  canvasColor: const Color(0xff303030),
  scaffoldBackgroundColor: const Color(0xff303030),
  bottomAppBarColor: Colors.grey[800],
  cardColor: Colors.grey[800],
  dividerColor: const Color(0x1fffffff),
  highlightColor: const Color(0x40cccccc),
  splashColor: const Color(0x40cccccc),
  selectedRowColor: const Color(0xfff5f5f5),
  unselectedWidgetColor: Colors.grey,
  disabledColor: const Color(0x62ffffff),
  toggleableActiveColor: const Color(0xff1e88e5),
  secondaryHeaderColor: const Color(0xff616161),
  backgroundColor: const Color(0xff616161),
  dialogBackgroundColor: Colors.grey[800],
  indicatorColor: const Color(0xff1e88e5), //Color(0xff64ffda),
  hintColor: const Color(0x80ffffff),
  errorColor: const Color(0xffd32f2f),
  appBarTheme:   AppBarTheme(
      centerTitle: false,
      backgroundColor: Colors.grey[800],
      elevation: 0,
      foregroundColor: Colors.grey,
      titleTextStyle:const TextStyle(fontSize: 16, color: Colors.grey)),
  bottomAppBarTheme:
       BottomAppBarTheme(color: Colors.grey[800], elevation: 0),
);
