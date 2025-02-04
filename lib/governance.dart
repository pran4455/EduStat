import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class GovernanceScreen extends StatelessWidget {
  final List<Map<String, String>> governance = [
    {'name': 'AICTE / UGC', 'url': 'https://drive.google.com/drive/folders/1jwebDDA65HyOJOV23QZteHlJg0Uaeefi?usp=sharing'},
    {'name': 'AU', 'url': 'https://drive.google.com/drive/folders/1Gx18eCKdn4oylmdQDYkblU3kaxJyS5vf?usp=sharing'},
    {'name': 'NAAC', 'url': 'https://drive.google.com/drive/folders/1lokSYFtwOwD_O39a-UbYjpkn-m5EagoA?usp=sharing'},
    {'name': 'NBA PG', 'url': 'https://drive.google.com/drive/folders/17t3GzfDWd87BF_-KawBNZHuiy6rAOAXf?usp=sharing'},
    {'name': 'NBA UG', 'url': 'https://drive.google.com/drive/folders/1xZgbtMTtzmrQn13kF7PQDndUwsgNmnXA?usp=sharing'},
    {'name': 'NIRF', 'url': 'https://drive.google.com/drive/folders/1duKcWgCFH4LH-UEnxgogkynZEpWlmg4W?usp=sharing'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Facilities')),
      body: ListView.builder(
        itemCount: governance.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(governance[index]['name']!),
            trailing: Icon(Icons.open_in_new),
            onTap: () {
              _launchURL(governance[index]['url']!);
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
