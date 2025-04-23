import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newtouchme/SalonHome_Screen.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'Page2.dart';
import 'Page3.dart';
import 'Page4.dart';
import 'Page5.dart';
import 'Page6.dart';
import 'SalonHomeScreen.dart';


class Page1 extends StatefulWidget {
  const Page1({super.key});


  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  bool _isHovered = false;
  final PageController _pageController = PageController(initialPage: 0);


  @override
  Widget build(BuildContext context) {
    var selectedUserType;
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hide debug label
      builder: (context, child) => ResponsiveWrapper.builder(
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
      home: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.white,
        //   elevation: 0,
        //   toolbarHeight: 30,
        //   iconTheme: IconThemeData(color: Colors.black), // Black icons
        // ),
        body: SafeArea(
          child: PageView(
            controller: _pageController,
            children: [
              _buildPage1Content(),
              Page2(),
              Page3(),
              Page4(),
              Page5(userType: '',),
              Page6(),
              SalonHomeScreen(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPage1Content() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Image.asset(
              'assets/p1i1.png',
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.5,
              errorBuilder: (context, error, stackTrace) =>
                  const Center(child: Text('Image not found')),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: Image.asset(
              'assets/p1i2.png',
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.2,
              errorBuilder: (context, error, stackTrace) =>
                  const Center(child: Text('Image not found')),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: Image.asset(
              'assets/p1i3.png',
              width: MediaQuery.of(context).size.width * 0.2,
              height: MediaQuery.of(context).size.height * 0.05,
              errorBuilder: (context, error, stackTrace) =>
                  const Center(child: Text('Image not found')),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: MouseRegion(
              onEnter: (_) {
                setState(() {
                  _isHovered = true;
                });
              },
              onExit: (_) {
                setState(() {
                  _isHovered = false;
                });
              },
              child: GestureDetector(
                onTap: () {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                child: Center(
                  child: Image.asset(
                    _isHovered
                        ? 'assets/continuousbutton2.png'
                        : 'assets/continuousbutton.png',
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.12,
                    errorBuilder: (context, error, stackTrace) =>
                        const Center(child: Text('Image not found')),
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
