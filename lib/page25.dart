import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'Page11.dart';
import 'Page26.dart';
import 'Page27.dart';
import 'Page28.dart';
class Page25 extends StatefulWidget {
  const Page25({super.key});

  @override
  _Page25State createState() => _Page25State();
}

class _Page25State extends State<Page25> {
  String _activeNavItem = 'Reviews';
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
      body: Column(
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Page25()));
                }),
                _buildNavBarItem('Portfolio', () {
                  setState(() {
                    _activeNavItem = 'Portfolio';
                  });
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Page26()));
                }),
                _buildNavBarItem('Gift Cards', () {
                  setState(() {
                    _activeNavItem = 'Gift Cards';
                  });
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Page27()));
                }),
                _buildNavBarItem('Details', () {
                  setState(() {
                    _activeNavItem = 'Details';
                  });
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Page28()));
                }),
              ],
            ),
          ),

          // Display full-width scrollable image
          Image.asset(
            'assets/reviews.png',
            //fit: BoxFit.cover,
            width: 800,
            height:180,

          ),

          // Optionally: Display current page below
          Expanded(
            child: PageView(
              controller: _pageController,
              children: const [
                //Center(child: Text("Services Page")),
                Center(child: Text("Reviews Page")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
