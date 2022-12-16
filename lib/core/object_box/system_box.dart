
import 'package:objectbox/objectbox.dart';

import 'objectbox.g.dart';

// ignore_for_file: public_member_api_docs

@Entity()
class SystemBox {
  int? id;
  String? languageCode;
  int? themeModeIndex;



  /// Note: Stored in milliseconds without time zone info.
  DateTime date;
  SystemBox(
      {this.id = 0,
      this.languageCode,
      this.themeModeIndex,
      DateTime? date})
      : date = date ?? DateTime.now();

  
}
