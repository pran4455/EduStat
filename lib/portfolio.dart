import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

class PortfolioScreen extends StatelessWidget {
  final List<Map<String, String>> portfolio = [
    {
      'label': 'Portfolio',
      'url': 'https://drive.google.com/drive/folders/1flAtPpnxyCwrbTwgCBPqyP8tzgg8t9Do?usp=sharing'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Portfolio')),
      body: Stack(
        children: [
          BackgroundImage(),
          ListView(
            children: portfolio
                .map((item) => HyperlinkButton(label: item['label']!, url: item['url']!))
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
