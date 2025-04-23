import 'package:flutter/material.dart';
import 'package:newtouchme/SalonHome_Screen.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'SalonHomeScreen.dart';
import 'Page30.dart';
import 'Page31.dart';
class Page6 extends StatelessWidget {
  const Page6({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return MaterialApp(
      debugShowCheckedModeBanner: false, // Remove the app banner
      builder: (context, child) => ResponsiveWrapper.builder(
        child,
        maxWidth: 1200,
        minWidth: 400,
        defaultScale: true,
        breakpoints: [
          const ResponsiveBreakpoint.autoScale(400, name: MOBILE),
          const ResponsiveBreakpoint.autoScale(800, name: TABLET),
          const ResponsiveBreakpoint.autoScale(1000, name: DESKTOP),
        ],
      ),
      home: Scaffold(
        body: SafeArea(
          // 👇 Wrap entire screen in GestureDetector to detect swipe
          child: GestureDetector(
            onHorizontalDragEnd: (details) {
              // Detect swipe to left (next page)
              if (details.primaryVelocity! < 0) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SalonHomeScreen(),),
                );
              }
            },
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // First Image
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Image.asset(
                        'assets/p6i1.png',
                        width: screenWidth * 0.8,
                        height: screenHeight * 0.35,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) =>
                            const Center(child: Text('Image not found')),
                      ),
                    ),

                    // Second Image
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        'assets/p6i2.png',
                        width: screenWidth * 0.8,
                        height: screenHeight * 0.22,
                        errorBuilder: (context, error, stackTrace) =>
                            const Center(child: Text('Image not found')),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // "Turn On Location" button
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SalonHomeScreen(),),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF38084B),
                        padding: EdgeInsets.symmetric(
                          vertical: 14,
                          horizontal: screenWidth * 0.18,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      child: const Text(
                        "Turn On Location",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),

                    const SizedBox(height: 12),

                    // "Not Now" button
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SalonHomeScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xF3EAEAF4),
                        padding: EdgeInsets.symmetric(
                          vertical: 14,
                          horizontal: screenWidth * 0.26,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      child: const Text(
                        "Not Now",
                        style: TextStyle(fontSize: 18, color: Colors.purple),
                      ),
                    ),

                    const SizedBox(height: 20),


                    // "Turn On Location" button
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Page31(),),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF38084B),
                        padding: EdgeInsets.symmetric(
                          vertical: 14,
                          horizontal: screenWidth * 0.18,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      child: const Text(
                        "Salon Owner",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),



                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
