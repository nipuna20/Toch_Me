import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:newtouchme/SalonHomeScreen.dart';
import 'package:newtouchme/SalonHome_Screen.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'Page1.dart';
import 'Page3.dart';
import 'Page25.dart';
import 'Page26.dart';
import 'Page27.dart';
import 'Page28.dart';
import 'Page29.dart';
import 'Page15.dart';
import 'package:newtouchme/pages/Map_Page.dart';
class Page11 extends StatefulWidget {
  const Page11({super.key});

  @override
  _Page11State createState() => _Page11State();
}

class _Page11State extends State<Page11> {
  final PageController _pageController = PageController(initialPage: 1);
  bool _isHeartTapped = false;
  String _activeNavItem = 'Services';
  String _hoveredItem = '';
  bool showPopularServices = false;
  bool showOtherServices = false;

  Widget _buildServiceCard(String serviceName) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: const Color(0xEEEAD7F3),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              serviceName,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Page29()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF38084B),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text("Book", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavBarItem(String title, Function onTap) {
    bool isActive = _activeNavItem == title;
    bool isHovered = _hoveredItem == title;

    return MouseRegion(
      onEnter: (_) => setState(() => _hoveredItem = title),
      onExit: (_) => setState(() => _hoveredItem = ''),
      child: GestureDetector(
        onTap: () => onTap(),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.black87,
                fontSize: 16,
                fontWeight: isActive || isHovered ? FontWeight.bold : FontWeight.normal,
                decoration: isActive || isHovered ? TextDecoration.underline : TextDecoration.none,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPage10Content() {
    return Column(
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/p7i11.png',
                fit: BoxFit.cover,
                height: 250,
                width: 700,
                errorBuilder: (_, __, ___) => Container(color: Colors.grey, height: 100),
              ),
            ),
            Positioned(
              top: 20,
              left: 20,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SalonHomeScreen()));
                },
                child: Image.asset(
                  'assets/left.png',
                  width: 40,
                  height: 40,
                  errorBuilder: (context, error, stackTrace) => const Icon(Icons.arrow_back, size: 40),
                ),
              ),
            ),
          ],
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {},
              child: Image.asset('assets/save.png', width: 140, height: 50),
            ),
            GestureDetector(
              onTap: () {},
              child: Image.asset('assets/like.png', width: 150, height: 50),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _isHeartTapped = !_isHeartTapped;
                });
              },
              child: Image.asset(
                _isHeartTapped ? 'assets/heartpurple.png' : 'assets/heartwhite.png',
                width: 100,
                height: 60,
              ),
            ),
          ],
        ),

        Padding(
          padding: const EdgeInsets.fromLTRB(3.0, 0.0, 3.0, 0.0),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(3.0, 0.0, 3.0, 0.0),
            child: Card(
              color: const Color(0xD7F3B2FF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 8,
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Salon Niro', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    Text('Location: New York, USA', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    Text('Ratings: ⭐⭐⭐⭐☆', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.525,
              child: PageView(
                controller: _pageController,
                children: [
                  Page1(),
                  _buildPage10Content(),
                  Page3(),
                ],
              ),
            ),

            // Navigation Bar
            Container(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              color: Colors.white60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildNavBarItem('Services', () {
                    setState(() {
                      _activeNavItem = 'Services';
                    });
                    _pageController.jumpToPage(1);
                  }),
                  _buildNavBarItem('Reviews', () {
                    setState(() {
                      _activeNavItem = 'Reviews';
                    });
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Page25()));
                  }),
                  _buildNavBarItem('Portfolio', () {
                    setState(() {
                      _activeNavItem = 'Portfolio';
                    });
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Page26()));
                  }),
                  _buildNavBarItem('Gift Cards', () {
                    setState(() {
                      _activeNavItem = 'Gift Cards';
                    });
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Page27()));
                  }),
                  _buildNavBarItem('Details', () {
                    setState(() {
                      _activeNavItem = 'Details';
                    });
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const MapPage()));
                  }),
                ],
              ),
            ),

            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search services...',
                  filled: true,
                  fillColor: const Color(0xD7E8C0EF),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Image.asset(
                      'assets/search.png',
                      width: 14,
                      height: 14,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(45),
                    borderSide: BorderSide.none,
                  ),
                ),
                onChanged: (value) {
                  // TODO: Implement search functionality
                },
              ),
            ),

            // Popular Services
            _buildToggleSection("Popular Services", showPopularServices, (val) {
              setState(() => showPopularServices = val);
            }),

            // Other Services
            _buildToggleSection("Other Services", showOtherServices, (val) {
              setState(() => showOtherServices = val);
            }),

            // Continue Button
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Page11()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF38084B),
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 145),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                ),
                child: const Text("Continue", style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _buildToggleSection(String title, bool isVisible, Function(bool) onToggle) {
    return StatefulBuilder(
      builder: (context, setStateSB) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        onToggle(!isVisible);
                        setStateSB(() {});
                      });
                    },
                    child: Image.asset(
                      isVisible ? 'assets/down.png' : 'assets/up.png',
                      width: 30,
                      height: 30,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            AnimatedCrossFade(
              duration: const Duration(milliseconds: 300),
              crossFadeState: isVisible ? CrossFadeState.showFirst : CrossFadeState.showSecond,
              firstChild: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    _buildServiceCard("Hair Cut"),
                    const SizedBox(height: 10),
                    _buildServiceCard("Edge Up"),
                    const SizedBox(height: 10),
                    _buildServiceCard("Hair Cut & Beard"),
                    const SizedBox(height: 10),
                    _buildServiceCard("Shave"),
                    const SizedBox(height: 10),
                    _buildServiceCard("Facial Treatment"),
                    const SizedBox(height: 10),
                    _buildServiceCard("Hair Color"),
                  ],
                ),
              ),
              secondChild: const SizedBox.shrink(),
            ),
          ],
        );
      },
    );
  }
}
