import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
      body: ListView.builder(
        itemCount: examCellOptions.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(examCellOptions[index]['name']!),
            trailing: Icon(Icons.open_in_new),
            onTap: () {
              _launchURL(examCellOptions[index]['url']!);
            },
          );
        },
      ),
    );
  }

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      print("Could not launch $url");
    }
  }
}
