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

class ContactsView extends StatelessWidget {
  const ContactsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ApplicationViewModel m = Get.find();
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text('common_contacts'.tr)),
      body: SafeArea(child: Obx(() {
        final int length = m.users.value.length + 1;
        return Visibility(
            visible: m.users.value.isNotEmpty,
            child: ListView.separated(
                separatorBuilder: (_, __) => const Divider(),
                itemCount: length,
                itemBuilder: (_, index) => index == length - 1
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextButton(
                          onPressed: m.toAddView,
                          child: Row(
                            children: [
                              const Icon(Icons.add),
                              Text('contacts_add'.tr),
                            ],
                          ),
                        ))
                    : UserListTile(index, m.toEditView)));
      })),
    );
  }
}

class UserListTile extends StatelessWidget {
  const UserListTile(this.index, this.onTap, {super.key});
  final int index;
  final Function(int) onTap;
  @override
  Widget build(BuildContext context) {
    final ApplicationViewModel m = Get.find();
    final UserBox user = m.users[index];
    return ListTile(
      onTap: () => onTap(index),
      leading: SizedBox(child: CircleAvatar(child: Text(user.initial))),
      title: Text(user.nameStr),
      trailing: Text(user.contactTime?.yyyyMmDdHhMmSs ?? ''),
    );
  }
}
