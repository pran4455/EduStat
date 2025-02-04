import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class IQACScreen extends StatelessWidget {
  final List<Map<String, String>> iqac = [
    {'name': 'IQAC', 'url': 'https://drive.google.com/drive/folders/1wMYf4fom3DP-rHzDM4b6ncF7KeTnf7ux?usp=drive_link'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('IQAC')),
      body: ListView.builder(
        itemCount: iqac.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(iqac[index]['name']!),
            trailing: Icon(Icons.open_in_new),
            onTap: () {
              _launchURL(iqac[index]['url']!);
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
