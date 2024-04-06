import 'package:flutter/services.dart';
import 'package:helper/core/extensions/index.dart';

class ClipboardService {
  static Future<void> copy(String text) async {
    await Clipboard.setData(ClipboardData(text: text)).then((value) {
      (text).log();
      // pop();
    });
  }

  static Future<String?> paste() async {
    ClipboardData? clipboardData = await Clipboard.getData('text/plain');
    // pop();
    return clipboardData?.text;
  }
}
