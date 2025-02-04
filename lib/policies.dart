import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PoliciesScreen extends StatelessWidget {
  final List<Map<String, String>> policies = [
    {'name': 'Policies', 'url': 'https://drive.google.com/drive/folders/1rzHmYRjC2JHRDY3gwM3QV27H2sn-PhRp?usp=sharing'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Facilities')),
      body: ListView.builder(
        itemCount: policies.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(policies[index]['name']!),
            trailing: Icon(Icons.open_in_new),
            onTap: () {
              _launchURL(policies[index]['url']!);
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
