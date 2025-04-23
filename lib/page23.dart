import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:newtouchme/SalonHome_Screen.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'SalonHomeScreen.dart';
class Page23 extends StatefulWidget {
  const Page23({super.key});

  @override
  _Page23State createState() => _Page23State();
}

class _Page23State extends State<Page23> {
  final DateTime _currentMonth = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ResponsiveWrapper.builder(
        SafeArea(
          child: Stack(
            children: [
              // Position p7i2.png image at the top-left corner
              Positioned(
                top: 15,  // Adjust top position as needed
                left: 160,  // Adjust left position as needed
                child: Image.asset(
                  'assets/p7i8.png',
                  width: 160,  // Adjust size as needed
                  height: 160, // Adjust size as needed
                  fit: BoxFit.contain,
                ),
              ),

              // Column to hold the rest of the content
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Left arrow button at the top
                        IconButton(
                          icon: Image.asset('assets/left_arrow.png', width: 35, height: 35),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SalonHomeScreen()),
                            );
                          },
                        ),

                        // Title in the center


                        // Dummy space to balance the layout
                        const SizedBox(width: 11),
                      ],
                    ),
                  ),

                  // Placeholder for content, can add other widgets here
                  const Expanded(
                    child: Center(
                      child: Text(
                        'More content here...',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        maxWidth: 1200,
        minWidth: 480,
        defaultScale: true,
        breakpoints: [
          const ResponsiveBreakpoint.autoScale(480, name: MOBILE),
          const ResponsiveBreakpoint.resize(800, name: TABLET),
          const ResponsiveBreakpoint.autoScale(1000, name: DESKTOP),
        ],
      ),
    );
  }
}
