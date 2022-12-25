import 'dart:typed_data';

import '../../lib.dart';

extension SplitByLength on String {
  List<String> splitByLength(int len) {
    final List<String> results = [];
    final int num = (length / len).ceil();
    for (int i = 0; i < num; i++) {
      final int start = i * len;
      int end = (i + 1) * len;
      if (end > length) end = length;
      final String result = this.substring(start, end);
      results.add(result);
    }
    return results;
  }

  int bytes() {
    final List<String> messages = this.splitByLength(82);
    int length = 0;
    for (int i = 0; i < messages.length; i++) {
      final x = utf8.encode(messages[i]) as Uint8List;
      length += x.length;
    }
    return length;
  }
}
