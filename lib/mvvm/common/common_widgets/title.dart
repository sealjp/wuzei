import '../../../lib.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget(this.title,{super.key});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(title.tr),
        ),
      ],
    );
  }
}
