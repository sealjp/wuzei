import '../../../lib.dart';

class SetDisplayModeView extends StatelessWidget {
  const SetDisplayModeView({super.key});

  @override
  Widget build(BuildContext context) {
    final SetDisplayModeViewModel m = Get.put(SetDisplayModeViewModel());
    return Scaffold(
        appBar: AppBar(title: Text('common_displayMode'.tr)),
        body: SafeArea(
            child: Padding(
                padding: EdgeInsets.all(16.wPt),
                child: ListView(
                  children: [
                    ListTile(
                      leading: Text('me_sytemMode'.tr),
                      trailing: Obx(() => Switch(
                          value: m.isFollowSystem.value,
                          onChanged: m.switchSystemMode)),
                    ),
                    const _Divider(),
                    const DisplayModeListTile(ThemeMode.dark),
                    const _Divider(),
                    const DisplayModeListTile(ThemeMode.light),
                  ],
                ))));
  }
}

class DisplayModeCheckMark extends StatelessWidget {
  const DisplayModeCheckMark(this.mode, {super.key});
  final ThemeMode mode;
  @override
  Widget build(BuildContext context) {
    final SetDisplayModeViewModel m = Get.put(SetDisplayModeViewModel());
    return Obx(() => CheckMark(m.runningMode.value, mode));
  }
}

class DisplayModeListTile extends StatelessWidget {
  const DisplayModeListTile(this.mode, {super.key});
  final ThemeMode mode;

  @override
  Widget build(BuildContext context) {
    final SetDisplayModeViewModel m = Get.put(SetDisplayModeViewModel());
    return Obx(() => Visibility(
        visible: !m.isFollowSystem.value,
        child: ListTile(
            onTap: () => m.setDisplayMode(mode),
            title: Text(mode.name.tr),
            trailing: DisplayModeCheckMark(mode))));
  }
}

class _Divider extends StatelessWidget {
  const _Divider({super.key});

  @override
  Widget build(BuildContext context) {
    final SetDisplayModeViewModel m = Get.put(SetDisplayModeViewModel());
    return Obx(() =>
        Visibility(visible: !m.isFollowSystem.value, child: const Divider()));
  }
}
