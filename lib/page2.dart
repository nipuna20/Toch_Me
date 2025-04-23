import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter/material.dart';
import 'Page1.dart';
import 'Page3.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  final PageController _pageController = PageController(initialPage: 1); // Start at Page2

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          Page1(), // Swipe back to Page1
          _buildPage2Content(), // Current Page2 Content
          Page3(), // Swipe forward to Page3
        ],
      ),
    );
  }

  Widget _buildPage2Content() {
    bool isHovered = false;

    return ResponsiveVisibility(
      visible: true,
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset(
                  'assets/p2i1.png',
                  width: ResponsiveValue<double>(context,
                      defaultValue: MediaQuery.of(context).size.width * 0.8,
                      valueWhen: const [
                        Condition.smallerThan(name: MOBILE, value: 300.0),
                        Condition.largerThan(name: TABLET, value: 600.0),
                      ]).value,
                  height: MediaQuery.of(context).size.height * 0.5,
                  errorBuilder: (context, error, stackTrace) =>
                  const Center(child: Text('Image not found')),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: Image.asset(
                  'assets/p2i2.png',
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.2,
                  errorBuilder: (context, error, stackTrace) =>
                  const Center(child: Text('Image not found')),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: Image.asset(
                  'assets/p2i3.png',
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: MediaQuery.of(context).size.height * 0.05,
                  errorBuilder: (context, error, stackTrace) =>
                  const Center(child: Text('Image not found')),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: MouseRegion(
                  onEnter: (_) => setState(() => isHovered = true),
                  onExit: (_) => setState(() => isHovered = false),
                  child: GestureDetector(
                    onTap: () {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Image.asset(
                      isHovered
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
            ],
          ),
        ),
      ),
    );
  }

}
