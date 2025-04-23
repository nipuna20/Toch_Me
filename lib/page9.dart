import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:newtouchme/SalonHome_Screen.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'SalonHomeScreen.dart';
class Page9 extends StatefulWidget {
  const Page9({super.key});

  @override
  _Page9State createState() => _Page9State();
}

class _Page9State extends State<Page9> {
  final DateTime _currentMonth = DateTime.now();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ResponsiveWrapper.builder(
        SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Image.asset('assets/left_arrow.png', width: 35, height: 35),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SalonHomeScreen()),
                        );
                      },
                    ),
                    const Expanded(
                      child: Center(
                        child: Text(
                          'Favourite',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2E0A34), // Hex color 2E0A34 with full opacity
                          ),
                        ),

                      ),
                    ),
                    const SizedBox(width: 38), // Dummy space to balance the left IconButton
                  ],
                ),
              ),


              // // Schedule Button
              // Padding(
              //   padding: const EdgeInsets.only(bottom: 24.0),
              //   child: ElevatedButton(
              //     onPressed: () {
              //       // TODO: Add scheduling logic here
              //     },
              //     style: ElevatedButton.styleFrom(
              //       backgroundColor: Colors.purple,
              //       padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(12),
              //       ),
              //     ),
              //     child: Text(
              //       'Schedule',
              //       style: TextStyle(color: Colors.white, fontSize: 18),
              //     ),
              //   ),
              // ),
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
