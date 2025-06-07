import 'package:flutter/material.dart';
import 'package:nimbus/presentation/widgets/show_toast.dart';
import 'package:url_launcher/url_launcher.dart';

const kDuration = Duration(milliseconds: 600);

Future<void> openUrlLink(String url, BuildContext context) async {
  if (await canLaunch(url)) {
    await launch(
      url,
      forceSafariVC: false,
      forceWebView: false,
    );
  } else {
    showCustomToast(context, 'Could not launch $url');
  }
}

final Uri mail = Uri(
  scheme: 'mailto',
  path: 'support@example.com',
  query: 'subject=Support Needed&body=Describe your issue...',
);

// void openEmail() async {
//   final Uri emailUri = Uri(
//     scheme: 'mailto',
//     path: StringConst.DEV_EMAIL,
//     query: _encodeQueryParameters(<String, String>{
//       'subject': 'Reaching out via the website',
//       'body': 'This is a pre-filled email body.'
//     }),
//   );
//
//   if (await canLaunch(emailUri)) {
//     await launch(emailUri);
//   } else {
//     throw 'Could not launch email client.';
//   }
// }

String? _encodeQueryParameters(Map<String, String> params) {
  return params.entries
      .map((e) =>
          '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
      .join('&');
}

scrollToSection(BuildContext context) {
  Scrollable.ensureVisible(
    context,
    duration: kDuration,
  );
}
