import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:ui';
import 'academic.dart';

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
    'Industry Interaction ',
    'Magazine',
    'Minutes of Meeting',
    'Monthly Activities',
    'Policies',
    'Test OPTIO',
    'IQAC',
    'Portfolio',
  ];

  @override
  Widget build(BuildContext context) {
    const double centerX = 146;
    const double centerY = 355;
    const double outerRadius1 = 150.0;
    const double outerRadius2 = 250.0;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true, // Center the title
        title: Text(
          'EduStats',
          style: TextStyle(
            color: Colors.white, // White font color
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue[900], // Dark blue background

      ),
      body: Stack(
        children: [
          // Background with blur effect
          Positioned.fill(
            child: Stack(
              children: [
                Image.network(
                  'https://www.fillandfind.com/uploads/institute/Sri-Sivasubramaniya-Nadar-College-of-Engineeringdetail-at-fillandfind-com-201705250752052022275612.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    color: Colors.black.withOpacity(0.3),
                  ),
                ),
                // Add logo at the bottom
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    color: Colors.white.withValues(),// Optional background for better visibility
                    height: 50, // Adjust height to control vertical space usage
                    child: FittedBox(
                      fit: BoxFit.contain, // Ensures the entire image is visible
                      child: Image.network(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ3c5_MdlzCQkdD7gDIOA_wQ_-ysGn6CdrHHg&s',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Hexagonal menu
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  // Center hexagon
                  Positioned(
                    top: centerY,
                    left: centerX,
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
                  // Outer hexagon 1 (Options 2-7)
                  for (int i = 1; i <= 6; i++)
                    Positioned(
                      top: centerY + _calculateOuterTopPosition(i, outerRadius1),
                      left: centerX + _calculateOuterLeftPosition(i, outerRadius1),
                      child: HexagonalButton(
                        label: menuOptions[i],
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  OptionScreen(option: menuOptions[i]),
                            ),
                          );
                        },
                      ),
                    ),
                  // Option 8 (positioned above center, slightly higher)
                  Positioned(
                    top: centerY - outerRadius1 - 100, // Increased offset (higher)
                    left: centerX,
                    child: HexagonalButton(
                      label: menuOptions[7],
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                OptionScreen(option: menuOptions[7]),
                          ),
                        );
                      },
                    ),
                  ),
                  // Outer hexagon 2 (Options 9-11)
                  for (int i = 8; i <= 10; i++)
                    Positioned(
                      top: centerY + _calculateOuterTopPosition(i - 7, outerRadius2),
                      left: centerX + _calculateOuterLeftPosition(i - 7, outerRadius2),
                      child: HexagonalButton(
                        label: menuOptions[i],
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  OptionScreen(option: menuOptions[i]),
                            ),
                          );
                        },
                      ),
                    ),
                  // Option 9 (Positioned below Option 7, slightly lower)
                  Positioned(
                    top: centerY + outerRadius1 + 100, // Increased offset (lower)
                    left: centerX,
                    child: HexagonalButton(
                      label: menuOptions[8], // Option 9
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                OptionScreen(option: menuOptions[8]),
                          ),
                        );
                      },
                    ),
                  ),
                  // Outer hexagon 3 (Options 12-13)
                  for (int i = 11; i <= 12; i++)
                    Positioned(
                      top: centerY + _calculateOuterTopPosition(i - 7, outerRadius2),
                      left: centerX + _calculateOuterLeftPosition(i - 7, outerRadius2),
                      child: HexagonalButton(
                        label: menuOptions[i],
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  OptionScreen(option: menuOptions[i]),
                            ),
                          );
                        },
                      ),
                    ),
                  // Option 14 (Positioned similarly to options 10-13, below Option 7)
                  Positioned(
                    top: centerY + outerRadius1 + 68, // Move Option 14 up by 200px
                    left: centerX + _calculateOuterLeftPosition(7, outerRadius1) - 23,
                    child: HexagonalButton(
                      label: menuOptions[13], // Option 14
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                OptionScreen(option: menuOptions[13]),
                          ),
                        );
                      },
                    ),
                  ),
                ],
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