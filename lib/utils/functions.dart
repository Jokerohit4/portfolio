import 'package:flutter/material.dart';
import 'package:nimbus/presentation/widgets/show_toast.dart';
import 'package:url_launcher/url_launcher.dart';

const kDuration = Duration(milliseconds: 600);

Future<void> openUrlLink(String url, BuildContext context) async {
  if (await canLaunchUrl(Uri.parse(url))) {
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

scrollToSection(BuildContext context) {
  Scrollable.ensureVisible(
    context,
    duration: kDuration,
  );
}
