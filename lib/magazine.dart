import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MagazineScreen extends StatelessWidget {
  final List<Map<String, String>> magazine = [
    {'name': 'Magazine', 'url': 'https://drive.google.com/drive/folders/1hFxnEAl5hPHPBdRqVSpY5wGqMp4RLpSD?usp=sharing'},
    ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Magazine')),
      body: ListView.builder(
        itemCount: magazine.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(magazine[index]['name']!),
            trailing: Icon(Icons.open_in_new),
            onTap: () {
              _launchURL(magazine[index]['url']!);
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
