import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

class ProjectsScreen extends StatelessWidget {
  final List<Map<String, String>> projectsOptions = [
    {'name': 'External Funded Projects', 'url': 'https://drive.google.com/drive/folders/1OVqCvHCRUx4KzP8IK8_kaIbNAn0QGx7Q?usp=sharing'},
    {'name': 'Internally Faculty Funded Projects', 'url': 'https://drive.google.com/drive/folders/1CmQAnzSpYr6fLY-QJUAmpTqzwKUn7F98?usp=sharing'},
    {'name': 'STIRS', 'url': 'https://drive.google.com/drive/folders/1Qt-6233qYJxV5cjg5BHoZ56AvDKdimPD?usp=sharing'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Projects')),
      body: Stack(
        children: [
          BackgroundImage(),
          ListView(
            children: projectsOptions
                .map((item) => HyperlinkButton(label: item['name']!, url: item['url']!))
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
