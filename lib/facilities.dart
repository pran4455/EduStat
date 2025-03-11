import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

class FacilitiesScreen extends StatelessWidget {
  final List<Map<String, String>> facilities = [
    {'name': 'Alan Turing Lab', 'url': 'https://drive.google.com/drive/folders/1QQ4UMORyM5EreMZfRvmbzOeiUw65rP8R?usp=sharing'},
    {'name': 'Operating System Lab', 'url': 'https://drive.google.com/drive/folders/1BF5O8G8RBmsu9pPnYzJpyrtq-wq3UD-X?usp=sharing'},
    {'name': 'IoT Lab', 'url': 'https://drive.google.com/drive/folders/1XFAALVG8dnnoOAWBKqdT-BGq93k8O8ax?usp=sharing'},
    {'name': 'Charles Babbage Lab', 'url': 'https://drive.google.com/drive/folders/1AL0kQwPV4JfdGDuRTthMNc_0t2dKuB4F?usp=sharing'},
    {'name': 'Software Engineering Lab', 'url': 'https://drive.google.com/drive/folders/17Eg_HdqK0-1tqpnKkjtjfMOW0qinkgjh?usp=sharing'},
    {'name': 'Von Neumann Lab', 'url': 'https://drive.google.com/drive/folders/159ij4KipSqz7O89ivEPDPOPk_IlbrUgc?usp=sharing'},
    {'name': 'PG Lab', 'url': 'https://drive.google.com/drive/folders/1bVkmi2GyWzZek1GMELIsJaOUTDDmdr5C?usp=sharing'},
    {'name': 'CyPhER Lab (Research)', 'url': 'https://drive.google.com/drive/folders/1H48h1ACAFIOHvQNk8UZO4KrNyZ3i6ITZ?usp=sharing'},
    {'name': 'TCAD Lab (Research)', 'url': 'https://drive.google.com/drive/folders/1U5y1GH4u8VUFoAq_vCU0d55qiwcPA8V3?usp=sharing'},
    {'name': 'MIR Lab (Research)', 'url': 'https://drive.google.com/drive/folders/1Lo67Wg8kmJlK2Un9yEdYSbi6RkQSMnqC?usp=sharing'},
    {'name': 'Library', 'url': 'https://drive.google.com/drive/folders/1IHbQ1bGq6V8MNd34qqZ04_KrIaRT7MCx?usp=sharing'},
    {'name': 'Automation', 'url': 'https://drive.google.com/drive/folders/1pDNAMxktt25fN8CtOQkWQEsXMXqD5G5o?usp=sharing'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Facilities')),
      body: Stack(
        children: [
          BackgroundImage(),
          ListView(
            children: facilities.map((item) {
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
