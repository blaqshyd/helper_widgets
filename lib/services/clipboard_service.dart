import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:helper/common/common.dart';

class ClipboardService {
  static Future<void> copy(String text) async {
    await Clipboard.setData(ClipboardData(text: text)).then((value) {
      log(text);
      pop();
    });
  }

  static Future<String?> paste() async {
    ClipboardData? clipboardData = await Clipboard.getData('text/plain');
    pop();
    return clipboardData?.text;
  }
}
