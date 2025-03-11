import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

class CoCurriculumScreen extends StatelessWidget {
  final List<Map<String, String>> cocurriculum = [
    {'name': 'AIT', 'url': 'https://drive.google.com/drive/folders/11INFF-S35Wu5ygduQEFnydVn7dgAEmJ6?usp=sharing'},
    {'name': 'External Competitions', 'url': 'https://drive.google.com/drive/folders/1jKsBVMzvPumdb8kFHkzLTR6scqE0f4D1?usp=sharing'},
    {'name': 'Guest Lecture', 'url': 'https://drive.google.com/drive/folders/1d70hndkMOPEL48jqGz59jXCsSfgbziPT?usp=sharing'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Co-curriculum')),
      body: Stack(
        children: [
          BackgroundImage(),
          ListView(
            children: cocurriculum.map((item) {
              return HyperlinkButton(
                label: item['name']!,
                url: item['url']!,
              );
            }).toList(),
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
