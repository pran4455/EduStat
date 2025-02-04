import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BudgetScreen extends StatelessWidget {
  final List<Map<String, String>> budget = [
    {'name': 'Budget', 'url': 'https://drive.google.com/drive/folders/1W3Z35roFyBh3h6B9ClbUzYxkrKCIlRNB?usp=sharing'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Facilities')),
      body: ListView.builder(
        itemCount: budget.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(budget[index]['name']!),
            trailing: Icon(Icons.open_in_new),
            onTap: () {
              _launchURL(budget[index]['url']!);
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
