import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io' show Platform; // Import Platform class
import 'academic.dart';
import 'base_scaffold.dart';
import 'facilities.dart';
import 'governance.dart';
import 'nonteachingstaff.dart';
import 'research.dart';
import 'budget.dart';
import 'industryinteraction.dart';
import 'magazine.dart';
import 'minutesofmeeting.dart';
import 'monthlyactivities.dart';
import 'policies.dart';
import 'iqac.dart';
import 'portfolio.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EduStats',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            color: Colors.black, // White color
            fontSize: 24, // Larger font size
            fontWeight: FontWeight.bold, // Bold text
          ),
        ),
      ),
      home: MenuScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MenuScreen extends StatelessWidget {
  final List<String> menuOptions = [
    'Academics',
    'Facilities',
    'Governance / Accreditation Bodies',
    'Non-Teaching Staff',
    'Research',
    'Budget',
    'Industry Interaction',
    'Magazine',
    'Minutes of Meeting',
    'Monthly Activities',
    'Policies',
    'IQAC',
    'Portfolio',
  ];

  final List<Widget Function()> menuScreens = [
        () => AcademicScreen(),
        () => FacilitiesScreen(),
        () => GovernanceScreen(),
        () => NonTeachingStaffScreen(),
        () => ResearchScreen(),
        () => BudgetScreen(),
        () => IndustryInteractionScreen(),
        () => MagazineScreen(),
        () => MinutesOfMeetingScreen(),
        () => MonthlyActivitiesScreen(),
        () => PoliciesScreen(),
        () => IQACScreen(),
        () => PortfolioScreen(),
  ];

  void _launchURL() async {
    const url = 'https://www.linkedin.com/in/pranaavu'; // Replace with your desired URL
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  // Platform-aware font size scaling
  double _getFooterFontSize(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    if (Platform.isAndroid || Platform.isIOS) {
      // Mobile devices
      return screenWidth * 0.05; // Adjust for mobile
    } else if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
      // Desktop applications
      return screenWidth * 0.017; // Adjust for desktop
    } else {
      // Web or other platforms
      return screenWidth * 0.02; // Adjust for web
    }
  }

  @override
  Widget build(BuildContext context) {
    final fontSize = _getFooterFontSize(context); // Get platform-aware font size

    return BaseScaffold(
      title: 'EduStats',
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              padding: EdgeInsets.only(bottom: 80), // Add extra padding at the bottom
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: List.generate(menuOptions.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => menuScreens[index]()),
                        );
                      },
                      child: Text(
                        menuOptions[index],
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0), // Add padding to the footer
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(15),
                  bottom: Radius.circular(15),
                ), // Rounded corners
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  color: Colors.white.withOpacity(0.6), // Pale white background
                  child: GestureDetector(
                    onTap: _launchURL,
                    child: Center(
                      child: Text(
                        'Made by U Pranaav',
                        style: TextStyle(
                          fontSize: fontSize, // Platform-aware font size
                          color: Colors.deepPurpleAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}