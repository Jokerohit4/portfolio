import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

class EmailButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'support@example.com',
      queryParameters: {
        'subject': 'Need Help',
        'body': 'Describe your issue here...',
      },
    );

    return Link(
      uri: emailLaunchUri,
      target: LinkTarget.self,
      builder: (context, followLink) => TextButton(
        onPressed: followLink,
        child: Text(
          'Contact Support',
          style: TextStyle(color: Colors.blue),
        ),
      ),
    );
  }
}
