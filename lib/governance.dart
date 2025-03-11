import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

class GovernanceScreen extends StatelessWidget {
  final List<Map<String, String>> governanceOptions = [
    {'label': 'AICTE / UGC', 'url': 'https://drive.google.com/drive/folders/1jwebDDA65HyOJOV23QZteHlJg0Uaeefi?usp=sharing'},
    {'label': 'AU', 'url': 'https://drive.google.com/drive/folders/1Gx18eCKdn4oylmdQDYkblU3kaxJyS5vf?usp=sharing'},
    {'label': 'NAAC', 'url': 'https://drive.google.com/drive/folders/1lokSYFtwOwD_O39a-UbYjpkn-m5EagoA?usp=sharing'},
    {'label': 'NBA PG', 'url': 'https://drive.google.com/drive/folders/17t3GzfDWd87BF_-KawBNZHuiy6rAOAXf?usp=sharing'},
    {'label': 'NBA UG', 'url': 'https://drive.google.com/drive/folders/1xZgbtMTtzmrQn13kF7PQDndUwsgNmnXA?usp=sharing'},
    {'label': 'NIRF', 'url': 'https://drive.google.com/drive/folders/1duKcWgCFH4LH-UEnxgogkynZEpWlmg4W?usp=sharing'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Governance')),
      body: Stack(
        children: [
          BackgroundImage(),
          ListView(
            children: governanceOptions
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
