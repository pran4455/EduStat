import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
      body: ListView.builder(
        itemCount: cocurriculum.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(cocurriculum[index]['name']!),
            trailing: Icon(Icons.open_in_new),
            onTap: () {
              _launchURL(cocurriculum[index]['url']!);
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
