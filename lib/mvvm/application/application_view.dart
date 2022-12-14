import 'package:flutter/cupertino.dart';

import '../../lib.dart';

class ApplicationView extends StatelessWidget {
  const ApplicationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ApplicationViewModel m = Get.put((ApplicationViewModel()));
    return Obx(
      () => DefaultTabController(
        initialIndex: m.tabIndex.value,
        length: 3,
        child: Scaffold(
          body: const TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [TransferView(), ContactsView(), MeView()],
          ),
          bottomNavigationBar: BottomAppBar(
            // elevation: 3,
            notchMargin: 6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                BottomItem(0, CupertinoIcons.chat_bubble_2,
                    CupertinoIcons.chat_bubble_2_fill, 'common_convert'.tr),
                BottomItem(1, CupertinoIcons.person_2,
                    CupertinoIcons.person_2_fill, 'common_contacts'.tr),
                BottomItem(2, CupertinoIcons.person, CupertinoIcons.person_fill,
                    'common_me'.tr),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BottomItem extends StatelessWidget {
  final int index;
  final IconData iconData;
  final IconData selectedIconData;
  final String title;
  const BottomItem(this.index, this.iconData, this.selectedIconData, this.title,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ApplicationViewModel m = Get.find();
    final colorSelected = Theme.of(context).colorScheme.secondary;
    final colorUnselected = Theme.of(context).colorScheme.tertiary;
    final TextStyle styleUnselected = Theme.of(context).textTheme.titleSmall!;
    final TextStyle styleSelected = Theme.of(context)
        .textTheme
        .titleSmall!
        .copyWith(color: const Color(0xde1A1C1E), fontWeight: FontWeight.w600);
    // final Color color = Colors.grey.shade400;
    // const Color colorSelected = Colors.white;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          m.onTap(index);
          DefaultTabController.of(context)!.animateTo(index);
        },
        child: SizedBox(
          height: 60,
          child: Padding(
            padding: const EdgeInsets.only(top: 3.0),
            child: Center(
              child: Obx(
                () {
                  return Column(
                    children: <Widget>[
                      if (index == m.tabIndex.value)
                        Icon(selectedIconData, color: colorSelected)
                      else
                        Icon(iconData, color: colorUnselected),
                      Text(title,
                          style: index == m.tabIndex.value
                              ? styleSelected
                              : styleUnselected),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
