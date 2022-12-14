import 'package:flutter/cupertino.dart';

import '../../../lib.dart';

class CommonListTile extends StatelessWidget {
  const CommonListTile(
      {this.icon,
      required this.title,
      this.trailing,
      this.nextPage,
      super.key});
  final IconData? icon;
  final String title;
  final Widget? trailing;
  final dynamic nextPage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.wPt),
      child: ListTile(
          onTap: ()=>Get.to(nextPage),
          leading: icon == null ? null : Icon(icon),
          title: Text(title),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (trailing != null) trailing!,
              if (nextPage != null)
                const Icon(CupertinoIcons.chevron_right, size: 16)
            ],
          )),
    );
  }
}
