import 'package:flutter/material.dart';
import 'student.dart';
import 'package:url_launcher/link.dart';

class AcademicScreen extends StatelessWidget {
  const AcademicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Academic Options')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MenuButton(
            label: 'Faculty',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FacultyMenuScreen()),
              );
            },
          ),
          MenuButton(
            label: 'Student',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => StudentScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class FacultyMenuScreen extends StatelessWidget {
  final List<Map<String, String>> facultyOptions = [
    {'label': 'Course File', 'url': 'https://drive.google.com/drive/folders/1__F7ABADytBRNioz83oqRmH9xMu9PXfx?usp=sharing'},
    {'label': 'Faculty Profile', 'url': 'https://drive.google.com/drive/folders/1HQRi_cCFoyL9P7OzoMsll8Y2tELpZviS?usp=sharing'},
    {'label': 'Professional Societies', 'url': 'https://drive.google.com/drive/folders/1esI6mVKAd4Htuurp4ALRzwjyz6zwqWz4?usp=sharing'},
    {'label': 'SDP', 'url': 'https://drive.google.com/drive/folders/1dBzkSjqFOh2cjgqRWCZlxdDarJIYM3eq?usp=sharing'},
    {'label': 'Workload', 'url': 'https://drive.google.com/drive/folders/15mlRugISnDNRcR8JBvnaJjGDy2QjBZ2g?usp=sharing'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Faculty Options')),
      body: ListView(
        children: facultyOptions.map((option) {
          return HyperlinkButton(label: option['label']!, url: option['url']!);
        }).toList(),
      ),
    );
  }
}

// Updated HyperlinkButton to use the Link widget
class HyperlinkButton extends StatelessWidget {
  final String label;
  final String url;

  const HyperlinkButton({super.key, required this.label, required this.url});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Link(
        uri: Uri.parse(url),
        target: LinkTarget.blank, // Opens in external browser
        builder: (context, followLink) {
          return ElevatedButton(
            style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 50)),
            onPressed: followLink,
            child: Text(label, style: TextStyle(fontSize: 18)),
          );
        },
      ),
    );
  }
}

// Updated DriveLinkScreen to use Link widget
class DriveLinkScreen extends StatelessWidget {
  final String title;
  final String driveLink;

  const DriveLinkScreen({super.key, required this.title, required this.driveLink});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Link(
          uri: Uri.parse(driveLink.startsWith('http') ? driveLink : 'https://$driveLink'),
          target: LinkTarget.blank,
          builder: (context, followLink) {
            return InkWell(
              onTap: followLink,
              child: Text(
                'Open Drive Link',
                style: TextStyle(color: Colors.blue, fontSize: 18),
              ),
            );
          },
        ),
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const MenuButton({super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 50)),
        onPressed: onPressed,
        child: Text(label, style: TextStyle(fontSize: 18)),
      ),
    );
  }
}
