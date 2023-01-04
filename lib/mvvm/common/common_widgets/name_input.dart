import '../../../lib.dart';

class NameInput extends StatelessWidget {
  const NameInput({super.key});

  @override
  Widget build(BuildContext context) {
    final ApplicationViewModel m = Get.find();
    return TextFormField(
        controller: m.nameCtrl,
        validator: Validator.name,
        maxLength: 32,
        decoration: InputDecoration(
            suffixIcon: IconButton(
                onPressed: m.clearName,
                icon: const Icon(Icons.close_rounded))));
  }
}
