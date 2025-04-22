import 'package:flutter/material.dart';
import 'pages/onboarding_page.dart';

void main() {
  runApp(const TouchMeApp());
}

class TouchMeApp extends StatelessWidget {
  const TouchMeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Touch Me',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        useMaterial3: true,
      ),
      home: const OnboardingPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
