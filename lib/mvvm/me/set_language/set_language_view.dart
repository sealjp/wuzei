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
