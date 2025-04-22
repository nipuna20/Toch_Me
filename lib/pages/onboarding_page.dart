import 'package:flutter/material.dart';
import '../widgets/onboarding_content.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _nextPage() {
    if (_currentPage < 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      // TODO: Navigate to Home/Login screen
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) => setState(() => _currentPage = index),
              children: const [
                OnboardingContent(
                  imagePath: 'assets/images/barber.png',
                  title:
                      'Timeless Sophistication,\nEach Moment Transcends Expectations',
                  description:
                      'Discover your true beauty at Touch Me. Our skilled professionals enhance your natural glow.',
                ),
                OnboardingContent(
                  imagePath: 'assets/images/spa.png',
                  title:
                      'Where Tranquility Meets Luxury,\nOne Treatment at a Time.',
                  description:
                      'Discover ultimate relaxation at Touch Me. Our expert therapists nurture your well-being.',
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              2,
              (index) => Container(
                margin: const EdgeInsets.all(4),
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: _currentPage == index
                      ? Colors.deepPurple
                      : Colors.grey[400],
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20),
            child: ElevatedButton(
              onPressed: _nextPage,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                minimumSize: const Size.fromHeight(50),
              ),
              child: const Text("Continue"),
            ),
          ),
        ],
      ),
    );
  }
}
