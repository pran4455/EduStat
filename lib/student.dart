import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import 'curriculum.dart'; // import the Curriculum screen
import 'cocurriculum.dart'; // import the Co-Curriculum screen

class StudentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Student Options')),
      body: Stack(
        children: [
          BackgroundImage(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MenuButton(
                label: 'Alumni Students',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AlumniScreen()),
                  );
                },
              ),
              MenuButton(
                label: 'Current Students',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CurrentStudentScreen()),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AlumniScreen extends StatelessWidget {
  final List<Map<String, String>> alumniOptions = [
    {'label': 'Alumni Profile', 'url': 'https://drive.google.com/drive/folders/1HQMl38Y8unKYAqvJQkfOy3HjQsEzcQ_g?usp=sharing'},
    {'label': 'Guest Lecture', 'url': 'https://drive.google.com/drive/folders/1mrPGc-AYqQezd_U_WtdjW8qf7vpSb5L_?usp=sharing'},
    {'label': 'Higher Studies', 'url': 'https://drive.google.com/drive/folders/1OtAwOK1En9ttv3JynGeorWdJiXod2L7m?usp=sharing'},
    {'label': 'Industry Connector', 'url': 'https://drive.google.com/drive/folders/1qTS7-Ydic8ZMgyX_T8TRxBrpWbmDUvQo?usp=sharing'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Alumni Options')),
      body: Stack(
        children: [
          BackgroundImage(),
          ListView(
            children: alumniOptions.map((option) {
              return HyperlinkButton(label: option['label']!, url: option['url']!);
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class CurrentStudentScreen extends StatelessWidget {
  final List<Map<String, String>> studentOptions = [
    {'label': 'Co-Curricular', 'url': ''},
    {'label': 'Curriculum', 'url': ''},
    {'label': 'Extra Curricular Activities', 'url': 'https://drive.google.com/drive/folders/1IiW0SLMv9sYJj_cQxDTvatrxwtCAAqLx?usp=sharing'},
    {'label': 'Grievance and Discipline Committee', 'url': 'https://drive.google.com/drive/folders/1X2G2rkitkGgTfjS23J1qqkui2FsTcoAi?usp=sharing'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Current Student Options')),
      body: Stack(
        children: [
          BackgroundImage(),
          ListView(
            children: studentOptions.map((option) {
              if (option['label'] == 'Curriculum') {
                return MenuButton(
                  label: option['label']!,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CurriculumScreen()), // Navigate to Curriculum screen
                    );
                  },
                );
              } else if (option['label'] == 'Co-Curricular') {
                return MenuButton(
                  label: option['label']!,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CoCurriculumScreen()), // Navigate to Co-Curriculum screen
                    );
                  },
                );
              }
              return HyperlinkButton(label: option['label']!, url: option['url']!);
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class BackgroundImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Stack(
        children: [
          Container(
            color: Colors.black.withOpacity(0.3), // Adjust blur effect
          ),
        ],
      ),
    );
  }
}

class HyperlinkButton extends StatelessWidget {
  final String label;
  final String url;

  const HyperlinkButton({required this.label, required this.url});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Link(
        uri: Uri.parse(url),
        target: LinkTarget.blank,
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

class MenuButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const MenuButton({required this.label, required this.onPressed});

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
