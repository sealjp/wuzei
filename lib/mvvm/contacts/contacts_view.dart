import '../../lib.dart';

class ContactsView extends StatelessWidget {
  const ContactsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UsersController m = Get.put(UsersController(),permanent: true);
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text('common_contacts'.tr)),
      body: SafeArea(
        child:  Obx(() {
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
                          : UserListTile(m.users.value[index], m.toEditView)));
            })
        ),
      
    );
  }
}



class UserListTile extends StatelessWidget {
  const UserListTile(this.user, this.onTap, {super.key});
  final UserBox user;
  final Function(UserBox) onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => onTap(user),
      leading: SizedBox(child: CircleAvatar(child: Text(user.initial))),
      title: Text(user.nameStr),
      trailing: Text(user.contactTime?.yyyyMmDdHhMmSs ?? ''),
    );
  }
}
