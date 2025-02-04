import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PortfolioScreen extends StatelessWidget {
  final List<Map<String, String>> portfolio = [
    {'name': 'Portfolio', 'url': 'https://drive.google.com/drive/folders/1flAtPpnxyCwrbTwgCBPqyP8tzgg8t9Do?usp=sharing'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Portfolio')),
      body: ListView.builder(
        itemCount: portfolio.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(portfolio[index]['name']!),
            trailing: Icon(Icons.open_in_new),
            onTap: () {
              _launchURL(portfolio[index]['url']!);
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
