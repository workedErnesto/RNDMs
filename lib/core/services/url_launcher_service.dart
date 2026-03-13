import 'package:url_launcher/url_launcher.dart';

class UrlLauncherService {
  static Future<void> openUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('не удалось открыть $url');
    }
  }

  static Future<void> openEmail(String email) async {
    final uri = Uri(
      scheme: 'malito',
      path: email,
      queryParameters: {'subject': 'ваш вопрос'},
    );
    if (!await launchUrl(uri)) {
      throw Exception('не удалось открыть почту $email');
    }
  }
}
