import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

class ExamCellScreen extends StatelessWidget {
  final List<Map<String, String>> examCellOptions = [
    {'name': 'CAT Marks', 'url': 'https://drive.google.com/drive/folders/1COlDh8B3OpcoyXw1RjF_N4aH7H5vVKMQ?usp=sharing'},
    {'name': 'End Semester Results', 'url': 'https://drive.google.com/drive/folders/18DdtQUJXMuFuubTQ8gANkFL2pOdrwqfr?usp=sharing'},
    {'name': 'Question Bank', 'url': 'https://drive.google.com/drive/folders/1buo6b_CZMwHpODGyRN7m0Crt9ylXb-YU?usp=sharing'},
    {'name': 'Remedial Class', 'url': 'https://drive.google.com/drive/folders/1ENFrila_mhCsQyuwcozDefnVblMKdPzU?usp=sharing'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Exam Cell')),
      body: Stack(
        children: [
          BackgroundImage(),
          ListView.builder(
            itemCount: examCellOptions.length,
            itemBuilder: (context, index) {
              return HyperlinkButton(
                label: examCellOptions[index]['name']!,
                url: examCellOptions[index]['url']!,
              );
            },
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
