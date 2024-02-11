import 'package:share_plus/share_plus.dart';

class ShareService {
  static void shareText(String text, {String? subject}) {
    Share.share(text, subject: subject);
  }

  static void shareLink(String url, {String? subject}) {
    Share.share(url, subject: subject);
  }
}
