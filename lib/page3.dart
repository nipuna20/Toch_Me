import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'page2.dart';
import 'page4.dart';

class Page3 extends StatefulWidget {
  const Page3({super.key});

  @override
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  final PageController _pageController = PageController(initialPage: 1); // Start at Page2

  String _selectedOption = 'Customer'; // Default selected option
  //final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
        body: SafeArea(
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              if (index == 0) {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => Page2()));
              } else if (index == 2) {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => Page4()));
              }
            },
            children: [
              Page2(), // Swipe back to Page2
              _buildPage3Content(),
              Page4(), // Swipe forward to Page4
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPage3Content() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Image.asset(
              'assets/p3i1.png',
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.height * 0.2,
              errorBuilder: (_, __, ___) => const Text('Image not found'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/p4i1.png',
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.3,
              errorBuilder: (_, __, ___) => const Text('Image not found'),
            ),
          ),
          _buildRadioTile('Saloon Owners', 'Those who have the shop', 'assets/saloon_icon.png'),
          _buildRadioTile('Spa Owners', 'Those who sell service', 'assets/spa_icon.png'),
          _buildRadioTile('Customer', 'Those who need service', 'assets/customer_icon.png'),
          const SizedBox(height: 30),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Page4()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF38084B),
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 145),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
              ),
              child: const Text("Continue", style: TextStyle(fontSize: 18, color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRadioTile(String title, String subtitle, String iconPath) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.purple),
          borderRadius: BorderRadius.circular(150.0),
        ),
        child: SizedBox(
          height: 60,
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 4.0),
            leading: Image.asset(iconPath, width: 40, height: 30, errorBuilder: (_, __, ___) => const Icon(Icons.image, size: 40)),
            title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.purple, fontSize: 16)),
            subtitle: Text(subtitle, style: const TextStyle(color: Colors.blueGrey, fontSize: 14)),
            trailing: Radio<String>(
              value: title,
              groupValue: _selectedOption,
              onChanged: (String? value) {
                setState(() {
                  _selectedOption = value!;
                });
              },
              activeColor: Colors.purple,
            ),
          ),
        ),
      ),
    );
  }
}



