import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class IndustryInteractionScreen extends StatelessWidget {
  final List<Map<String, String>> industryinteraction = [
    {
      'name': 'Industry Interaction',
      'url': 'https://drive.google.com/drive/folders/1LbBB4n6mF671Hr8gPjnI4DI1QAWjrhj2?usp=sharing'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Industry Interaction')),
      body: ListView.builder(
        itemCount: industryinteraction.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(industryinteraction[index]['name']!),
            trailing: Icon(Icons.open_in_new),
            onTap: () {
              _launchURL(industryinteraction[index]['url']!);
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
