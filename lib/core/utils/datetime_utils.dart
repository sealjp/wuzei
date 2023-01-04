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

extension DateTimeUtils on DateTime {
  String _addZero(int v) => v >= 10 ? '$v' : '0$v';
  String get mm => _addZero(month);
  String get dd => _addZero(day);
  String get yyyyMmDd => '$year-$mm-$dd';

  String get hh => _addZero(hour);
  String get min => _addZero(minute);
  String get ss => _addZero(second);

  String get yyyyMmDdHhMmSs => '$yyyyMmDd $hh:$min:$ss';
}

extension DoubleUtils on String {
  List<String> get yyyyMmDdStrs => this.split('-');
  int get year => int.parse(yyyyMmDdStrs[0]);
  int get month => int.parse(yyyyMmDdStrs[1]);
  int get day => int.parse(yyyyMmDdStrs[2]);

  DateTime get dateTime => DateTime(year, month, day);
}
