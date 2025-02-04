import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:ui';
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
      theme: ThemeData(primarySwatch: Colors.blue),
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

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double centerX = screenWidth / 2;
    final double centerY = (screenHeight / 2) - 60;
    const double innerRadius = 150.0;
    const double outerRadius = 250.0;

    return BaseScaffold(
      title: 'EduStats',
      body: Stack(
        children: [
          /// Existing Background Image
          Positioned.fill(
            child: Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCD416TOZ8OkDSL_sqRxmB14xmvgE-iriE3g&s',
              fit: BoxFit.cover,
            ),
          ),

          /// Background Blur Effect
          Positioned.fill(
            child: Stack(
              children: [
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    color: Colors.black12.withOpacity(0.3),
                  ),
                ),
              ],
            ),
          ),

          /// Hexagonal Menu
          Center(
            child: SizedBox(
              width: screenWidth,
              height: screenHeight,
              child: Stack(
                children: [
                  Positioned(
                    top: centerY - 60,
                    left: centerX - 60,
                    child: HexagonalButton(
                      label: menuOptions[0],
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AcademicScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                  for (int i = 1; i <= 6; i++)
                    Positioned(
                      top: centerY + _calculateOuterTopPosition(i, innerRadius) - 60,
                      left: centerX + _calculateOuterLeftPosition(i, innerRadius) - 60,
                      child: HexagonalButton(
                        label: menuOptions[i],
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => menuScreens[i](),
                            ),
                          );
                        },
                      ),
                    ),
                  for (int i = 7; i < menuOptions.length; i++)
                    Positioned(
                      top: centerY +
                          (menuOptions[i] == 'Magazine'
                              ? -outerRadius
                              : (menuOptions[i] == 'Policies'
                              ? outerRadius
                              : _calculateOuterTopPosition(i - 6, outerRadius))) -
                          60,
                      left: centerX +
                          (menuOptions[i] == 'Magazine' || menuOptions[i] == 'Policies'
                              ? 0
                              : _calculateOuterLeftPosition(i - 6, outerRadius)) -
                          60,
                      child: HexagonalButton(
                        label: menuOptions[i],
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => menuScreens[i](),
                            ),
                          );
                        },
                      ),
                    ),
                ],
              ),
            ),
          ),

          Positioned(
            bottom: 0, // Position the image at the bottom
            left: 0,
            right: 0,
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), // Rounded top-left corner
                  topRight: Radius.circular(15), // Rounded top-right corner
                ),
                child: Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR0UaUqMumSn3P4Mh-aDhy6fVyUuqytkRA1hg&s',
                  width: 150, // Centered image width
                  height: 50, // Set the height of the image
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 14, // Slightly above the bottom edge
            right: 10, // Align to the right
            child: Text(
              "By U Pranaav",
              style: TextStyle(
                fontSize: 18, // Font size for the text
                fontWeight: FontWeight.bold,
                color: Colors.white, // Ensuring visibility over the blurred background
              ),
            ),
          ),

          Positioned(
            bottom: 1, // Slightly above the bottom edge
            right: 10, // Align to the right
            child: Text(
              "2210205",
              style: TextStyle(
                fontSize: 14, // Font size for the text
                fontWeight: FontWeight.bold,
                color: Colors.white, // Ensuring visibility over the blurred background
              ),
            ),
          ),
        ],
      ),
    );
  }

  double _calculateOuterTopPosition(int index, double radius) {
    const double angleStep = 60.0;
    double angle = angleStep * (index - 1) * (pi / 180);
    return radius * -1 * sin(angle);
  }

  double _calculateOuterLeftPosition(int index, double radius) {
    const double angleStep = 60.0;
    double angle = angleStep * (index - 1) * (pi / 180);
    return radius * cos(angle);
  }
}

class HexagonalButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const HexagonalButton({super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: ClipPath(
        clipper: HexagonClipper(),
        child: Container(
          color: Colors.blue,
          width: 120.0,
          height: 120.0,
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}

class HexagonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    final double w = size.width;
    final double h = size.height;

    path.moveTo(w * 0.5, 0);
    path.lineTo(w, h * 0.25);
    path.lineTo(w, h * 0.75);
    path.lineTo(w * 0.5, h);
    path.lineTo(0, h * 0.75);
    path.lineTo(0, h * 0.25);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class OptionScreen extends StatelessWidget {
  final String option;

  const OptionScreen({super.key, required this.option});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(option)),
      body: Center(
        child: Text(
          'You selected $option',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
