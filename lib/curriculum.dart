import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'examcell.dart'; // Importing the Exam Cell screen

class CurriculumScreen extends StatelessWidget {
  final List<Map<String, String>> curriculum = [
    {'name': 'AIT', 'url': 'https://drive.google.com/drive/folders/11INFF-S35Wu5ygduQEFnydVn7dgAEmJ6?usp=sharing'},
    {'name': 'External Competitions', 'url': 'https://drive.google.com/drive/folders/1jKsBVMzvPumdb8kFHkzLTR6scqE0f4D1?usp=sharing'},
    {'name': 'Guest Lecture', 'url': 'https://drive.google.com/drive/folders/1d70hndkMOPEL48jqGz59jXCsSfgbziPT?usp=sharing'},
    {'name': 'Class Advisor', 'url': 'https://drive.google.com/drive/folders/1sMiNii8omITltDYym6O9GcK-K4IxL_SQ?usp=sharing'},
    {'name': 'Class Committee Meeting', 'url': 'https://drive.google.com/drive/folders/1TUG2wXdQ0sU-kjDY8ThMdr23-lrqXFY4?usp=sharing'},
    {'name': 'EDC', 'url': 'https://drive.google.com/drive/folders/1NsHd-sTGgp1rXPR_M79_S0us8ZKAiqzv?usp=sharing'},
    {'name': 'Internship', 'url': 'https://drive.google.com/drive/folders/1saZYZLlMhPC8xdoVquJzD-DnClR1X1uN?usp=sharing'},
    {'name': 'NPTEL', 'url': 'https://drive.google.com/drive/folders/14PTlEGQY-ewop5G-o3BWUgrIvweaJ5Me?usp=sharing'},
    {'name': 'Placement', 'url': 'https://drive.google.com/drive/folders/17_qWzKftVduHvM7HcL7Nomu-ro6a5hQF?usp=sharing'},
    {'name': 'Project Review', 'url': 'https://drive.google.com/drive/folders/1s-trW667vA0rIYzlzGlODIMD-PJ7fisP?usp=sharing'},
    {'name': 'Student Feedback', 'url': 'https://drive.google.com/drive/folders/1UFLde6xtcHHYds3ZeG8zji09DX7SEFmZ?usp=sharing'},
    {'name': 'Syllabus', 'url': 'https://drive.google.com/drive/folders/1aTKDI9JpU4AQbR8b5DRvsiMwRg15ycY4?usp=drive_link'},
    {'name': 'Value Added Course', 'url': 'https://example.com/value-added-course'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Curriculum')),
      body: ListView.builder(
        itemCount: curriculum.length + 1, // +1 for Exam Cell
        itemBuilder: (context, index) {
          if (index == 6) {
            // Exam Cell at position 6
            return ListTile(
              title: Text('Exam Cell'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ExamCellScreen()),
                );
              },
            );
          } else {
            int adjustedIndex = index < 6 ? index : index - 1;
            return ListTile(
              title: Text(curriculum[adjustedIndex]['name']!),
              trailing: Icon(Icons.open_in_new),
              onTap: () {
                _launchURL(curriculum[adjustedIndex]['url']!);
              },
            );
          }
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
