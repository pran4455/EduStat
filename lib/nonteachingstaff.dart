import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NonTeachingStaffScreen extends StatelessWidget {
  final List<Map<String, String>> nonteaching = [
    {'name': 'Profile', 'url': 'https://drive.google.com/drive/folders/1iw_zxGYsq4nPlhw-DdwOHS1exmoMpHe2?usp=sharing'},
    {'name': 'Skill upgradation', 'url': 'https://drive.google.com/drive/folders/1iw_zxGYsq4nPlhw-DdwOHS1exmoMpHe2?usp=sharing'},
    {'name': 'Workload', 'url': 'https://drive.google.com/drive/folders/1iw_zxGYsq4nPlhw-DdwOHS1exmoMpHe2?usp=sharing'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Non Teaching Staff')),
      body: ListView.builder(
        itemCount: nonteaching.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(nonteaching[index]['name']!),
            trailing: Icon(Icons.open_in_new),
            onTap: () {
              _launchURL(nonteaching[index]['url']!);
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
