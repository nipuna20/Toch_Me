import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newtouchme/SalonHomeScreen.dart';
import 'package:newtouchme/SalonHome_Screen.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter/material.dart';
import 'Page1.dart';
import 'Page3.dart';


class Page12 extends StatefulWidget {
  const Page12({super.key});

  @override
  _Page12State createState() => _Page12State();
}

class _Page12State extends State<Page12> {
  final PageController _pageController = PageController(initialPage: 1); // Start at Page2

  bool _isHovered = false; // Moved here for state access

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          Page1(), // Swipe back to Page1
          _buildPage10Content(), // Current Page2 Content
          Page3(), // Swipe forward to Page3
        ],
      ),
    );
  }

  Widget _buildPage10Content() {
    return Stack(
      children: [
        Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/p7i12.png',
                          fit: BoxFit.cover,
                          height: 250,
                          width: 750,
                          errorBuilder: (_, __, ___) =>
                              Container(color: Colors.grey, height: 100),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Continue button at bottom
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: MouseRegion(
                onEnter: (_) => setState(() => _isHovered = true),
                onExit: (_) => setState(() => _isHovered = false),
                child: GestureDetector(
                  onTap: () {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.06,
                    decoration: BoxDecoration(
                      color: _isHovered
                          ? Colors.deepPurple.shade700
                          : Colors.deepPurple,
                      borderRadius: BorderRadius.circular(100),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 6,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      'Continue',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),

        // Top-left back button (left.png)
        Positioned(
          top: 20,
          left: 20,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SalonHomeScreen()),
              );
            },
            child: Image.asset(
              'assets/left.png',
              width: 40,
              height: 40,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.arrow_back, size: 50),
            ),
          ),
        ),
      ],
    );
  }
}
