import '../../../lib.dart';



showModal(Widget widget, double height) => showModalBottomSheet<void>(
    context: Get.context!,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (_) {
      return Container(
          height: height,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: widget);
    });
