import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import 'project.dart';

class ResearchScreen extends StatelessWidget {
  final List<Map<String, String>> researchOptions = [
    {'name': 'Consultancy', 'url': 'https://drive.google.com/drive/folders/1SLnntglXe8UIfDx-qGaftXZZj5H8LRE9?usp=sharing'},
    {'name': 'MoU', 'url': 'https://drive.google.com/drive/folders/1Cl59UDhSH1KHmm9KETldcXzlXlWHkkF-?usp=sharing'},
    {'name': 'Patents', 'url': 'https://drive.google.com/drive/folders/1byokVx6oofQ_8K2zY5GagtW2XUfwiriR?usp=sharing'},
    {'name': 'Projects', 'url': 'None'}, // Redirects to another menu
    {'name': 'Publication', 'url': 'https://drive.google.com/drive/folders/1cMuN9DsSUESnT7yZv1OVYpGvQgBme73Y?usp=sharing'},
    {'name': 'Research Centre', 'url': 'https://drive.google.com/drive/folders/1Lr1fo_kDq9TmsXkhss39KCIQJQP7R-NW?usp=sharing'},
    {'name': 'Research Scholar', 'url': 'https://drive.google.com/drive/folders/1YGmmKt6jxlDQ_DsAdON_oPRZALjc4Ct6?usp=sharing'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Research')),
      body: Stack(
        children: [
          BackgroundImage(),
          ListView(
            children: researchOptions.map((item) {
              if (item['name'] == 'Projects') {
                return HyperlinkButton(
                  label: item['name']!,
                  url: item['url']!,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProjectsScreen()),
                    );
                  },
                );
              } else {
                return HyperlinkButton(
                  label: item['name']!,
                  url: item['url']!,
                );
              }
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
  final VoidCallback? onTap;

  const HyperlinkButton({required this.label, required this.url, this.onTap});

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
            onPressed: onTap ?? followLink,
            child: Text(label, style: TextStyle(fontSize: 18)),
          );
        },
      ),
    );
  }
}
