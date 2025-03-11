import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

class IQACScreen extends StatelessWidget {
  final List<Map<String, String>> iqacOptions = [
    {
      'label': 'IQAC',
      'url': 'https://drive.google.com/drive/folders/1wMYf4fom3DP-rHzDM4b6ncF7KeTnf7ux?usp=drive_link'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('IQAC')),
      body: Stack(
        children: [
          BackgroundImage(),
          ListView(
            children: iqacOptions
                .map((option) => HyperlinkButton(label: option['label']!, url: option['url']!))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class BackgroundImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Container(
        color: Colors.black.withOpacity(0.3), // Adjust blur effect
      ),
    );
  }
}

class HyperlinkButton extends StatelessWidget {
  final String label;
  final String url;

  const HyperlinkButton({required this.label, required this.url});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Link(
        uri: Uri.parse(url),
        target: LinkTarget.blank,
        builder: (context, followLink) {
          return ElevatedButton(
            style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 50)),
            onPressed: followLink,
            child: Text(label, style: TextStyle(fontSize: 18)),
          );
        },
      ),
    );
  }
}
