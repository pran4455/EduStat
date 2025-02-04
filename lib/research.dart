import 'package:flutter/material.dart';
import 'project.dart';
import 'package:url_launcher/url_launcher.dart';

class ResearchScreen extends StatelessWidget {
  final List<Map<String, String>> researchOptions = [
    {'name': 'Consultancy', 'url': 'https://drive.google.com/drive/folders/1SLnntglXe8UIfDx-qGaftXZZj5H8LRE9?usp=sharing'},
    {'name': 'MoU', 'url': 'https://drive.google.com/drive/folders/1Cl59UDhSH1KHmm9KETldcXzlXlWHkkF-?usp=sharing'},
    {'name': 'Patents', 'url': 'https://drive.google.com/drive/folders/1byokVx6oofQ_8K2zY5GagtW2XUfwiriR?usp=sharing'},
    {'name': 'Projects', 'url': 'None'}, // Redirects to another menu
    {'name': 'Publication', 'url': 'https://drive.google.com/drive/folders/1cMuN9DsSUESnT7yZv1OVYpGvQgBme73Y?usp=sharing'},
    {'name': 'Research Centre', 'url': 'https://drive.google.com/drive/folders/1Lr1fo_kDq9TmsXkhss39KCIQJQP7R-NW?usp=sharing'},
    {'name': 'Research Scholar', 'url': 'https://drive.google.com/drive/folders/1YGmmKt6jxlDQ_DsAdON_oPRZALjc4Ct6?usp=sharing'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Research')),
      body: ListView.builder(
        itemCount: researchOptions.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(researchOptions[index]['name']!),
            trailing: Icon(Icons.open_in_new),
            onTap: () {
              if (researchOptions[index]['name'] == 'Projects') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProjectsScreen()),
                );
              } else {
                _launchURL(researchOptions[index]['url']!);
              }
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
