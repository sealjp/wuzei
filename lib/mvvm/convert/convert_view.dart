import 'package:flutter/cupertino.dart';

import '../../lib.dart';

class TransferView extends StatelessWidget {
  const TransferView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TransferViewModel m = Get.put(TransferViewModel());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          title: Row(
        children: [
          const InputTitle(),
          IconButton(
            icon: Icon(Icons.arrow_forward,
                color: Theme.of(context).colorScheme.primary),
            onPressed: m.changeMode,
          ),
          const OutputTitle()
        ],
      )),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: const [InputField(), Divider(), OutputContent()],
          ),
        ),
      ),
    );
  }
}

class ContactsListView extends StatelessWidget {
  const ContactsListView({super.key});

  @override
  Widget build(BuildContext context) {
    final TransferViewModel m = Get.find();
    return Column(
      children: [
        Container(
          height: 50.hPt,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('convert_selectContact'.tr,
                  style: const TextStyle(fontSize: 16))
            ],
          ),
        ),
        Expanded(
            child: ListView.separated(
                separatorBuilder: (_, __) => const Divider(),
                itemCount: m.users.length,
                itemBuilder: (_, index) =>
                    UserListTile(m.users[index], m.selectUser))),
      ],
    );
  }
}

class InputTitle extends StatelessWidget {
  const InputTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final TransferViewModel m = Get.find();
    return Obx(() => Text(m.encodeMode.value
        ? 'convert_decodedText'.tr
        : 'convert_encodedText'.tr));
  }
}

class OutputTitle extends StatelessWidget {
  const OutputTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final TransferViewModel m = Get.find();
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Obx(() => Text(m.encodeMode.value
            ? 'convert_encodedText'.tr
            : 'convert_decodedText'.tr)),
        Obx(() => Visibility(
            visible: m.encodeMode.value,
            child: TextButton(
                onPressed: () {
                  m.loadUsers();
                  showModal(const ContactsListView(), 600);
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('(${m.user.value.nameStr})'),
                    const Icon(Icons.expand_more_rounded)
                  ],
                ))))
      ],
    );
  }
}

class InputField extends StatelessWidget {
  const InputField({super.key});

  @override
  Widget build(BuildContext context) {
    final TransferViewModel m = Get.find();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            const InputTitle(),
            const SizedBox(width: 5,),
            Obx(() => Text(
                  '${m.inputBytes.value}/245 B',
                  style: TextStyle(
                      color: m.inputBytes.value >= 245
                          ? Theme.of(context).colorScheme.error
                          : Theme.of(context).colorScheme.onBackground),
                )), 
            IconButton(
                onPressed: m.paste, icon: const Icon(Icons.paste)),
            IconButton(
                onPressed: m.clearInput,
                icon: const Icon(CupertinoIcons.trash)),
          ],
        ),
        TextFormField(
            keyboardType: TextInputType.text,
            controller: m.inputCtrl,
            maxLines: 10,
            minLines: 10),
      ],
    );
  }
}

class OutputContent extends StatelessWidget {
  const OutputContent({super.key});

  @override
  Widget build(BuildContext context) {
    final TransferViewModel m = Get.find();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(children: [
          const OutputTitle(),
          IconButton(onPressed: m.copy, icon: const Icon(Icons.copy)),
        ]),
        Container(
            decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.all(Radius.circular(8.hPt))),
            child: Obx(() => Text(m.output.value))),
      ],
    );
  }
}
