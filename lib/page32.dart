import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'Page31.dart';
import 'Page30.dart';
import 'Page32.dart';
import 'Page33.dart';

class Page32 extends StatefulWidget {
  const Page32({super.key});

  @override
  _Page32State createState() => _Page32State();
}

class _Page32State extends State<Page32> {
  String? _selectedService;
  int _selectedIndex = 0;

  List<String> services = [
    'Wellness & Spa',
    'Braids & Locs',
    'Tattoo Shop',
    'Aesthetic Medicine',
    'Hair Removal',
    'Nail Salon',
    'Brows & Lashes',
    'Piercing',
    'Makeup',
  ];

  void _onFooterTap(int index) {
    setState(() => _selectedIndex = index);
    navigateToPage(index);
  }

  void navigateToPage(int index) {
    Widget page;
    switch (index) {
      case 0:
        page = Page31();
        break;
      case 1:
        page = Page30();
        break;
      case 2:
        page = Page32();
        break;
      case 3:
        page = Page33();
        break;
      default:
        return;
    }
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => page));
  }

  Widget _buildFooterIcon(int index, String label, String iconPath, String inactiveIconPath) {
    return GestureDetector(
      onTap: () => _onFooterTap(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            _selectedIndex == index ? iconPath : inactiveIconPath,
            width: 28,
            height: 28,
            errorBuilder: (_, __, ___) => const Icon(Icons.image_not_supported),
          ),
          const SizedBox(height: 5),
          Text(label, style: TextStyle(color: _selectedIndex == index ? Colors.black : Colors.grey)),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return ResponsiveWrapper.builder(
      Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.zero,
                            child: ClipRect(
                              child: Align(
                                alignment: Alignment.topCenter,
                                heightFactor: 1.0,
                                child: Image.asset(
                                  'assets/p7i1.png',
                                  fit: BoxFit.cover,
                                  width: 550,
                                  height: 295,
                                  errorBuilder: (_, __, ___) => const Text('Image not found'),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(builder: (context) => Page31()),
                                    );
                                  },
                                  child: Image.asset(
                                    'assets/left.png',
                                    width: 30,
                                    height: 30,
                                    errorBuilder: (_, __, ___) => const Icon(Icons.arrow_back, color: Colors.white),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                const Text(
                                  'Favourite ',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          //


                        ],
                      ),



                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '  ',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),

                      // Add more content here if needed...
                    ],
                  ),
                ),
              ),

              // Footer - Stays Fixed
              Container(
                height: 80,
                decoration: BoxDecoration(
                  border: Border(top: BorderSide(color: Colors.grey.shade300)),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildFooterIcon(0, 'Home', 'assets/home.png', 'assets/home_ash.png'),
                    _buildFooterIcon(1, 'Appointments', 'assets/calender.png', 'assets/calender_ash.png'),
                    GestureDetector(
                      onTap: () {},
                      child: Transform.translate(
                        offset: const Offset(0, -30),
                        child: Container(
                          width: 70,
                          height: 70,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 6, offset: Offset(0, 3))],
                          ),
                          child: Image.asset('assets/search_color.png', fit: BoxFit.contain,
                              errorBuilder: (_, __, ___) => const Icon(Icons.search, color: Colors.black)),
                        ),
                      ),
                    ),
                    _buildFooterIcon(2, 'Favorite', 'assets/heart.png', 'assets/heart_ash.png'),
                    _buildFooterIcon(3, 'Profile', 'assets/person.png', 'assets/person_ash.png'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      breakpoints: [
        const ResponsiveBreakpoint.resize(360, name: MOBILE),
        const ResponsiveBreakpoint.autoScale(600, name: TABLET),
        const ResponsiveBreakpoint.autoScale(900, name: DESKTOP),
        const ResponsiveBreakpoint.autoScale(1200, name: "XL"),
      ],
    );
  }

}