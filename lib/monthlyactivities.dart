import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MonthlyActivitiesScreen extends StatelessWidget {
  final List<Map<String, String>> monthlyactivites = [
    {'name': 'Monthly Activities', 'url': 'https://drive.google.com/drive/folders/1y5Q95eOcrBmnAwGw_C-hEnHbgI5vm8b8?usp=sharing'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Monthly Activities')),
      body: ListView.builder(
        itemCount: monthlyactivites.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(monthlyactivites[index]['name']!),
            trailing: Icon(Icons.open_in_new),
            onTap: () {
              _launchURL(monthlyactivites[index]['url']!);
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
