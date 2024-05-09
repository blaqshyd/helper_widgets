import 'package:flutter/services.dart';
import 'package:helper/shared/widgets/app_toast.dart';

class ClipboardService {
  static Future<void> copy(String text) async {
    await Clipboard.setData(ClipboardData(text: text)).then((value) {
      AppToast.defaultSnack('Copied to Clipboard');
    });
  }

  static Future<String?> paste() async {
    ClipboardData? clipboardData = await Clipboard.getData('text/plain');
    return clipboardData?.text;
  }
}
