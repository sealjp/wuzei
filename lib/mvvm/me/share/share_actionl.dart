import '../../../lib.dart';
import 'package:share_plus/share_plus.dart';

extension ShareAction on MeController {
  void share() {
    final String message = 'me_shareContent'
        .trParams({'name': me.value.nameStr, 'publicKey': me.value.publicKey!});
    debugPrint(message);
    Share.share(message);
  }
}
