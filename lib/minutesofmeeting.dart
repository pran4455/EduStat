import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MinutesOfMeetingScreen extends StatelessWidget {
  final List<Map<String, String>> minutesofmeeting = [
    {'name': 'Minutes of Meeting', 'url': 'https://drive.google.com/drive/folders/1eDBeFQib6zdYaxrxqZ5p50bA5iVxJ-fO?usp=sharing'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Facilities')),
      body: ListView.builder(
        itemCount: minutesofmeeting.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(minutesofmeeting[index]['name']!),
            trailing: Icon(Icons.open_in_new),
            onTap: () {
              _launchURL(minutesofmeeting[index]['url']!);
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
