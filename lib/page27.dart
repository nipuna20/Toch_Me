import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'Page11.dart';
import 'Page11.dart';
import 'Page25.dart';
import 'Page26.dart';
import 'Page28.dart';
class Page27 extends StatefulWidget {
  const Page27({super.key});

  @override
  _Page27State createState() => _Page27State();
}

class _Page27State extends State<Page27> {
  String _activeNavItem = 'Gift Cards';
  String _hoveredItem = '';
  final PageController _pageController = PageController();

  Widget _buildNavBarItem(String title, Function onTap) {
    bool isActive = _activeNavItem == title;
    bool isHovered = _hoveredItem == title;

    return MouseRegion(
      onEnter: (_) => setState(() => _hoveredItem = title),
      onExit: (_) => setState(() => _hoveredItem = ''),
      child: GestureDetector(
        onTap: () => onTap(),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.black87,
                fontSize: 16,
                fontWeight: isActive || isHovered ? FontWeight.bold : FontWeight
                    .normal,
                decoration: isActive || isHovered
                    ? TextDecoration.underline
                    : TextDecoration.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Reviews Title
            Padding(
              padding: const EdgeInsets.only(top: 40.0, bottom: 10.0, left: 16.0, right: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Page11()),
                      );
                    },
                    child: Image.asset(
                      'assets/left_black.png',
                      width: 24,
                      height: 24,
                    ),
                  ),
                  const SizedBox(width: 58),
                  const Text(
                    'Salon Niro',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            // Navigation Bar
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              color: Colors.white60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildNavBarItem('Services', () {
                    setState(() {
                      _activeNavItem = 'Services';
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Page11()),
                    );
                  }),



                  _buildNavBarItem('Reviews', () {
                    setState(() {
                      _activeNavItem = 'Reviews';
                    });
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Page25()));
                  }),
                  _buildNavBarItem('Portfolio', () {
                    setState(() {
                      _activeNavItem = 'Portfolio';
                    });
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Page26()));
                  }),
                  _buildNavBarItem('Gift Cards', () {
                    setState(() {
                      _activeNavItem = 'Gift Cards';
                    });
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Page27()));
                  }),
                  _buildNavBarItem('Details', () {
                    setState(() {
                      _activeNavItem = 'Details';
                    });
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Page28()));
                  }),
                ],
              ),
            ),

            // Display full-width scrollable image
            Padding(
              padding: const EdgeInsets.all(4.0), // small padding on all sides
              child: Image.asset(
                'assets/gift.png',
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                //height: 150,
              ),
            ),


            // Display full-width scrollable image
            Padding(
              padding: const EdgeInsets.all(4.0), // small padding on all sides
              child: Image.asset(
                'assets/gift.png',
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                //height: 150,
              ),
            ),
            // Display full-width scrollable image
            Padding(
              padding: const EdgeInsets.all(4.0), // small padding on all sides
              child: Image.asset(
                'assets/gift.png',
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                //height: 150,
              ),
            ),
            // Display full-width scrollable image
            Padding(
              padding: const EdgeInsets.all(4.0), // small padding on all sides
              child: Image.asset(
                'assets/gift.png',
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                //height: 150,
              ),
            ),





          ],
        ),
      ),
    );
  }
}
