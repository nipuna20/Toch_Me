import 'package:flutter/material.dart';
import 'dart:async';
import 'package:responsive_framework/responsive_framework.dart';
import 'Page1.dart'; // ✅ Make sure Page1 exists in your project
// import 'package:newtouchme/pages/Map_Page.dart'; // Optional, can stay if used

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder:
          (context, child) => ResponsiveWrapper.builder(
            child,
            maxWidth: 1200,
            minWidth: 400,
            defaultScale: true,
            breakpoints: [
              const ResponsiveBreakpoint.autoScale(600, name: MOBILE),
              const ResponsiveBreakpoint.autoScale(800, name: TABLET),
              const ResponsiveBreakpoint.autoScale(1000, name: DESKTOP),
            ],
          ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Page1()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          double scaleFactor = (constraints.maxWidth / 1080).clamp(0.5, 1.5);
          return Stack(
            fit: StackFit.expand,
            children: [
              Image.asset("assets/backgroundpotrait.png", fit: BoxFit.cover),
              Center(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Image.asset(
                    "assets/touchme.png",
                    width: 500 * scaleFactor,
                    height: 500 * scaleFactor,
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        "assets/whitebg.png",
                        width: 420 * scaleFactor,
                        height: 420 * scaleFactor,
                      ),
                      Image.asset(
                        "assets/vvhlogo.png",
                        width: 300 * scaleFactor,
                        height: 300 * scaleFactor,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
