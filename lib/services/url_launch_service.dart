import 'package:url_launcher/url_launcher.dart' show launchUrl;

class UrlLauncher {
  UrlLauncher._();

  static const _termsOfService = 'https://applaunchprogram.com/';
  static const _privacyPolicy = 'https://applaunchprogram.com/';

  static void showTermsOfService() => _show(_termsOfService);

  static void showPrivacyPolicy() => _show(_privacyPolicy);

  static void _show(String url) {
    launchUrl(Uri.parse(url));
  }

  static void openUrl({String? url}) {
    launchUrl(Uri.parse("http://$url"));
  }

  static void openMailApp({String? receiver, String? title, String? body}) {
    launchUrl(Uri.parse("mailto:$receiver?subject=$title&body=$body"));
  }
}
