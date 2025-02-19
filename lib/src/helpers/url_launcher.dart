import 'package:url_launcher/url_launcher.dart';

Future<void> urlLauncher({String? urls}) async {
  if (!await launchUrl(
    mode: LaunchMode.externalApplication,
    Uri.parse(urls ?? "https://maps.google.com"))) {
    throw Exception('Could not launch $urls');
  }
}