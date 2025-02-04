import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
      body: ListView.builder(
        itemCount: projectsOptions.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(projectsOptions[index]['name']!),
            trailing: Icon(Icons.open_in_new),
            onTap: () {
              _launchURL(projectsOptions[index]['url']!);
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
