import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

class NonTeachingStaffScreen extends StatelessWidget {
  final List<Map<String, String>> nonTeaching = [
    {
      'label': 'Profile',
      'url': 'https://drive.google.com/drive/folders/1iw_zxGYsq4nPlhw-DdwOHS1exmoMpHe2?usp=sharing'
    },
    {
      'label': 'Skill Upgradation',
      'url': 'https://drive.google.com/drive/folders/1iw_zxGYsq4nPlhw-DdwOHS1exmoMpHe2?usp=sharing'
    },
    {
      'label': 'Workload',
      'url': 'https://drive.google.com/drive/folders/1iw_zxGYsq4nPlhw-DdwOHS1exmoMpHe2?usp=sharing'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Non-Teaching Staff')),
      body: Stack(
        children: [
          BackgroundImage(),
          ListView(
            children: nonTeaching
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
