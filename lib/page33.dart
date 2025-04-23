import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'Page16.dart';
import 'Page14.dart';
import 'Page15.dart';
import 'SalonHomeScreen.dart';
import 'Page9.dart';
import 'Page10.dart';
import 'Page31.dart';
import 'Page38.dart';
import 'Page39.dart';
import 'Page40.dart';
class Page33 extends StatefulWidget {
  const Page33({super.key});

  @override
  _Page33State createState() => _Page33State();
}

class _Page33State extends State<Page33> {
  final PageController _pageController = PageController(initialPage: 1);
  File? _profileImage;
  int _selectedIndex = 0;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  void _onFooterTap(int index) {
    setState(() {
      _selectedIndex = index;
    });

    navigateToPage(index, context); // Call the navigation function
  }

  void navigateToPage(int index, BuildContext context) {
    switch (index) {
      case 0:
        Navigator.push(context, MaterialPageRoute(builder: (_) => Page38()));
        break;
      case 1:
        onPress: () {
          Navigator.pushNamed(context, '/Page8');
        };
        break;
      case 2:
        Navigator.push(context, MaterialPageRoute(builder: (_) => Page9()));
        break;
      case 3:
        Navigator.push(context, MaterialPageRoute(builder: (_) => Page10()));
        break;
      default:
        print("Invalid index");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveWrapper.builder(
        Column(
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                children: [
                  Container(color: Colors.white), // Placeholder
                  _buildProfileContent(),
                  Container(color: Colors.white), // Placeholder
                ],
              ),
            ),
            //_buildBottomNavigationBar(), // Footer here
          ],
        ),
        maxWidth: 1200,
        minWidth: 450,
        defaultScale: true,
        breakpoints: [
          const ResponsiveBreakpoint.resize(450, name: MOBILE),
          const ResponsiveBreakpoint.autoScale(800, name: TABLET),
          const ResponsiveBreakpoint.autoScale(1000, name: DESKTOP),
        ],
      ),
    );
  }

  Widget _buildProfileContent() {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 50),

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
                      MaterialPageRoute(builder: (context) => Page31()),
                    );
                  },
                ),
                const Expanded(
                  child: Center(
                    child: Text(
                      ' Salon Profile',
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
          const SizedBox(height: 30),
          GestureDetector(
            onTap: _pickImage,
            child: CircleAvatar(
              radius: 60,
              backgroundColor: Colors.grey[300],
              backgroundImage: _profileImage != null
                  ? FileImage(_profileImage!)
                  : const AssetImage('assets/person.png') as ImageProvider,
            ),
          ),
          const SizedBox(height: 40),
          _buildSection("Salon Profile Details", "assets/profile.png", () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => Page38()));
          }),
          _buildSection("Giftcards", "assets/giftcards.png", () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => Page39()));
          }),
          _buildSection("Services", "assets/services_1.png", () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => Page40()));
          }),
          _buildSection("Logout", "assets/logout.png", () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => Page31()));
          }),
        ],
      ),
    );
  }

  Widget _buildSection(String title, String iconPath, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.purple[100],
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                offset: Offset(0, 2),
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset('assets/circle.png', width: 40, height: 40),
                      Image.asset(iconPath, width: 22, height: 22),
                    ],
                  ),
                  const SizedBox(width: 12),
                  Text(
                    title,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Image.asset(
                'assets/next.png',
                width: 24,
                height: 24,
                errorBuilder: (_, __, ___) => const Icon(Icons.arrow_forward_ios, size: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFooterImageIcon(int index, String label, String coloredIcon, String greyIcon) {
    bool isSelected = index == _selectedIndex;

    return GestureDetector(
      onTap: () => _onFooterTap(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 20),
          Image.asset(
            isSelected ? coloredIcon : greyIcon,
            width: 28,
            height: 28,
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: isSelected ? Colors.black : Colors.grey,
            ),
          )
        ],
      ),
    );
  }

  //
  // Widget _buildBottomNavigationBar() {
  //   return Container(
  //     height: 120,
  //     decoration: BoxDecoration(
  //       border: Border(top: BorderSide(color: Colors.grey.shade300)),
  //       color: Colors.white,
  //     ),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceAround,
  //       children: [
  //         _buildFooterImageIcon(0, 'Home', 'assets/home.png', 'assets/home_ash.png'),
  //         _buildFooterImageIcon(1, 'Appointments', 'assets/calender.png', 'assets/calender_ash.png'),
  //
  //         // Center search icon
  //         GestureDetector(
  //           onTap: () {
  //             // Search action
  //           },
  //           child: Transform.translate(
  //             offset: Offset(0, -50),
  //             child: Container(
  //               width: 80,
  //               height: 80,
  //               decoration: BoxDecoration(
  //                 shape: BoxShape.circle,
  //                 color: Colors.white,
  //                 boxShadow: [
  //                   BoxShadow(
  //                     color: Colors.black26,
  //                     blurRadius: 6,
  //                     offset: Offset(0, 3),
  //                   ),
  //                 ],
  //               ),
  //               child: Image.asset(
  //                 'assets/search_color.png',
  //                 fit: BoxFit.contain,
  //               ),
  //             ),
  //           ),
  //         ),
  //
  //         _buildFooterImageIcon(2, 'Favorite', 'assets/heart.png', 'assets/heart_ash.png'),
  //         _buildFooterImageIcon(3, 'Profile', 'assets/person.png', 'assets/person_ash.png'),
  //       ],
  //     ),
  //   );
  // }

  Future<bool> _showExitConfirmation(BuildContext context) async {
    return (await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Confirm"),
        content: const Text("Do you want to exit the app?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false); // Don't pop (don't exit)
            },
            child: const Text("No"),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true); // Pop (exit)
            },
            child: const Text("Yes"),
          ),
        ],
      ),
    )) ??
        false; // Default to false if the dialog is dismissed
  }

}
