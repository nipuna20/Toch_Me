// import 'package:flutter/material.dart';
// import 'package:responsive_framework/responsive_framework.dart';
// import 'package:dropdown_search/dropdown_search.dart';
//
// import 'Page8.dart';
// import 'Page9.dart';
// import 'Page10.dart';
// import 'Page11.dart';
// import 'Page12.dart';
//
// import 'Page17.dart';
// import 'Page18.dart';
// import 'Page19.dart';
// import 'Page20.dart';
// import 'Page21.dart';
// import 'Page22.dart';
// import 'Page23.dart';
// import 'Page24.dart';
// import 'Page25.dart';
// import 'Page34.dart';
//
//
//
// class Page36 extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       builder: (context, child) => ResponsiveWrapper.builder(
//         BouncingScrollWrapper.builder(context, child!),
//         maxWidth: 1200,
//         minWidth: 400,
//         defaultScale: true,
//         breakpoints: [
//           ResponsiveBreakpoint.autoScale(400, name: MOBILE),
//           ResponsiveBreakpoint.autoScale(800, name: TABLET),
//           ResponsiveBreakpoint.autoScale(1000, name: DESKTOP),
//         ],
//       ),
//       home: Page36Content(),
//     );
//   }
// }
//
// class Page36Content extends StatefulWidget {
//   @override
//   _Page36ContentState createState() => _Page36ContentState();
// }
//
// class _Page36ContentState extends State<Page36Content> {
//   String? _selectedService;
//   int _selectedIndex = 0;
//   bool isHeartFilled1 = false;  // Initially set to false (heart is white)
//   bool isHeartFilled2 = false;  // Initially set to false (heart is white)
//   bool isHeartFilled3 = false;  // Initially set to false (heart is white)
//   bool isHeartFilled4 = false;  // Initially set to false (heart is white)
//
//
//   List<String> services = [
//     'Wellness & Spa',
//     'Braids & Locs',
//     'Tattoo Shop',
//     'Aesthetic Medicine',
//     'Hair Removal',
//     'Nail Salon',
//     'Brows & Lashes',
//     'Piercing',
//     'Makeup',
//   ];
//
//   String _getGreeting() {
//     final hour = DateTime.now().hour;
//     if (hour < 12) return 'Good Morning';
//     if (hour < 17) return 'Good Afternoon';
//     return 'Good Evening';
//   }
//
//   void _onFooterTap(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//
//     navigateToPage(index, context); // Call the navigation function
//   }
//
//   void navigateToPage(int index, BuildContext context) {
//     switch (index) {
//       case 0:
//         Navigator.push(context, MaterialPageRoute(builder: (_) => Page36()));
//         break;
//       case 1:
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (_) => Page8(
//               appointmentDate: DateTime.now(), // Set to the current date or provide a valid date
//               bookingDate: DateTime.now(),
//             ),
//           ),
//         );
//         break;
//       case 2:
//         Navigator.push(context, MaterialPageRoute(builder: (_) => Page9()));
//         break;
//       case 3:
//         Navigator.push(context, MaterialPageRoute(builder: (_) => Page10()));
//         break;
//       default:
//         print("Invalid index");
//     }
//   }
//
//   Widget _buildFooterImageIcon(int index, String label, String iconPath, String inactiveIconPath) {
//     return GestureDetector(
//       onTap: () => _onFooterTap(index),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Image.asset(
//             _selectedIndex == index ? iconPath : inactiveIconPath,
//             width: 28,
//             height: 28,
//             errorBuilder: (_, __, ___) => Icon(Icons.image_not_supported),
//           ),
//           SizedBox(height: 5),
//           Text(
//             label,
//             style: TextStyle(
//               color: _selectedIndex == index ? Colors.black : Colors.grey,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     String greeting = _getGreeting();
//
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     // Header with image, greeting, and dropdown
//                     Stack(
//                       children: [
//                         // Background image clipped from top
//                         Padding(
//                           padding: EdgeInsets.zero,
//                           child: ClipRect(
//                             child: Align(
//                               alignment: Alignment.topCenter,
//                               heightFactor: 1.0,
//                               child: Image.asset(
//                                 'assets/p7i1.png',
//                                 fit: BoxFit.cover,
//                                 width: 400,
//                                 height: 250,
//                                 errorBuilder: (_, __, ___) => Text('Image not found'),
//                               ),
//                             ),
//                           ),
//                         ),
//
//                         // Top Row: App Icon (left) and Location (right)
//                         // Top Row: App Icon (left) and Location (right)
//                         Positioned(
//                           top: 15,
//                           left: 20,
//                           right: 30,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               // App Icon with soft glow
//                               ClipRRect(
//                                 borderRadius: BorderRadius.circular(15), // Clip the image to match curved edges
//                                 child: ColorFiltered(
//                                   colorFilter: ColorFilter.mode(
//                                     Colors.white, // Tint color
//                                     BlendMode.srcIn, // Make image content white
//                                   ),
//                                   child: Image.asset(
//                                     'assets/app_icon.png',
//                                     width: 80,
//                                     height: 80,
//                                     fit: BoxFit.contain,
//                                   ),
//                                 ),
//                               ),
//
//
//                               // Location (unchanged - sample text)
//                               Row(
//                                 children: [
//                                   Image.asset(
//                                     'assets/location_on.png',
//                                     color: Colors.white,
//                                     width: 24,
//                                     height: 24,
//                                     errorBuilder: (_, __, ___) =>
//                                         Icon(Icons.location_on, color: Colors.white),
//                                   ),
//                                   SizedBox(width: 6),
//                                   Text(
//                                     'Your Location',
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 16,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//
//                         // Centered Greeting below top row
//                         Positioned(
//                           top: 100,
//                           left: 0,
//                           right: 0,
//                           child: Center(
//                             child: Text(
//                               greeting,
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 28,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ),
//
//                         // Dropdown with search & visible icon on the right
//                         Positioned(
//                           bottom: 25,
//                           left: MediaQuery.of(context).size.width * 0.05,
//                           right: MediaQuery.of(context).size.width * 0.05,
//                           child: Container(
//                             height: 50,
//                             padding: EdgeInsets.symmetric(horizontal: 20),
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(25),
//                               border: Border.all(color: Colors.grey.shade300),
//                             ),
//                             child: DropdownSearch<String>(
//                               items: services,
//                               selectedItem: _selectedService,
//                               onChanged: (value) {
//                                 setState(() {
//                                   _selectedService = value!;
//                                 });
//                               },
//                               popupProps: PopupProps.menu(
//                                 showSearchBox: true,
//                                 searchFieldProps: TextFieldProps(
//                                   decoration: InputDecoration(
//                                     hintText: "Type to search...",
//                                     prefixIcon: Padding(
//                                       padding: const EdgeInsets.all(10),
//                                       child: Image.asset(
//                                         'assets/search.png',
//                                         width: 20,
//                                         height: 20,
//                                         errorBuilder: (_, __, ___) => Icon(Icons.search, color: Colors.grey),
//                                       ),
//                                     ),
//                                     border: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(10),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               dropdownDecoratorProps: DropDownDecoratorProps(
//                                 dropdownSearchDecoration: InputDecoration(
//                                   hintText: "Search your services",
//                                   prefixIcon: Padding(
//                                     padding: const EdgeInsets.all(12),
//                                     child: Image.asset(
//                                       'assets/search.png',
//                                       width: 20,
//                                       height: 20,
//                                       errorBuilder: (_, __, ___) => Icon(Icons.search, color: Colors.grey),
//                                     ),
//                                   ),
//                                   contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//                                   border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(25),
//                                     borderSide: BorderSide.none,
//                                   ),
//                                   filled: true,
//                                   fillColor: Colors.white,
//                                 ),
//                               ),
//                               dropdownBuilder: (context, selectedItem) {
//                                 return Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Text(selectedItem ?? ' Select service '),
//                                     Image.asset(
//                                       'assets/dropdown.png',
//                                       width: 10,
//                                       height: 10,
//                                       errorBuilder: (_, __, ___) => Icon(Icons.arrow_drop_down, color: Colors.grey),
//                                     ),
//                                   ],
//                                 );
//                               },
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//
//
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 0.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             'Services',
//                             style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           TextButton(
//                             onPressed: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(builder: (context) => Page34()),
//                               );
//                             },
//                             child: Text(
//                               'View All',
//                               style: TextStyle(
//                                 color: Colors.blue,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//
//
//                  //   SizedBox(height: 2),
//
//                     Container(
//                       height: 100,
//                       child: ListView.builder(
//                         scrollDirection: Axis.horizontal,
//                         itemCount: 9,
//                         itemBuilder: (context, index) {
//                           List<String> images = [
//                             'assets/p7i2.png',
//                             'assets/p7i3.png',
//                             'assets/p7i4.png',
//                             'assets/p7i5.png',
//                             'assets/p7i6.png',
//                             'assets/p7i7.png',
//                             'assets/p7i8.png',
//                             'assets/p7i9.png',
//                             'assets/p7i10.png',
//                           ];
//
//                           // List of pages to navigate to based on index
//                           List<Widget> pages = [
//                             Page17(), Page18(), Page19(), Page20(), Page21(),
//                             Page22(), Page23(), Page24(), Page25(),
//                           ];
//
//                           return GestureDetector(
//                             onTap: () {
//                               // Navigate to the corresponding page based on the index
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(builder: (_) => pages[index]),
//                               );
//                             },
//                             child: Padding(
//                               padding: const EdgeInsets.symmetric(horizontal: 6.0),
//                               child: Image.asset(
//                                 images[index],
//                                 fit: BoxFit.contain,
//                                 width: MediaQuery.of(context).size.width / 5 - 12,
//                                 errorBuilder: (_, __, ___) => Icon(Icons.broken_image),
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//
//                     // Section title
//                     SingleChildScrollView(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
//                             child: Align(
//                               alignment: Alignment.centerLeft,
//                               child: Text(
//                                 'Special Offers',
//                                 style: TextStyle(
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ),
//                           ),
//
//
//                           Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                             child: Row(
//                               children: [
//                                 // First box with image, text, and icons (save and heart toggle)
//                                 Expanded(
//                                   child: GestureDetector(
//                                     onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => Page11())),
//                                     child: Container(
//                                       decoration: BoxDecoration(
//                                         color: Colors.white,  // Box color
//                                         borderRadius: BorderRadius.circular(10),  // Rounded corners
//                                         boxShadow: [
//                                           BoxShadow(blurRadius: 5, color: Colors.black.withOpacity(0.2), spreadRadius: 2)
//                                         ], // Optional: shadow for a nice card effect
//                                       ),
//                                       padding: EdgeInsets.all(12),  // Padding inside the box
//                                       child: Column(
//                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                         children: [
//                                           Image.asset(
//                                             'assets/p7i11.png',
//                                             fit: BoxFit.cover,
//                                             height: 100,
//                                             errorBuilder: (_, __, ___) => Container(color: Colors.grey, height: 100),
//                                           ),
//                                           SizedBox(height: 8),
//
//                                           // Salon Name
//                                           Text(
//                                             'Salon Niro',
//                                             style: TextStyle(
//                                               fontSize: 20,
//                                               fontWeight: FontWeight.bold,
//                                               color: Colors.black,
//                                             ),
//                                           ),
//                                           SizedBox(height: 4),
//
//                                           // Location Text
//                                           Text(
//                                             'Location',
//                                             style: TextStyle(
//                                               fontSize: 16,
//                                               color: Colors.grey[600],
//                                             ),
//                                           ),
//                                           SizedBox(height: 8),
//
//                                           // Row for Save and Heart Icon
//                                           Row(
//                                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                             children: [
//                                               // Save Icon
//                                               Image.asset(
//                                                 'assets/save.png',
//                                                 width: 110,  // Adjusted size
//                                                 height: 24, // Adjusted size
//                                               ),
//
//                                               // Heart Icon (with toggle effect)
//                                               GestureDetector(
//                                                 onTap: () {
//                                                   setState(() {
//                                                     isHeartFilled1 = !isHeartFilled1;  // Toggle the heart status
//                                                   });
//                                                 },
//                                                 child: Image.asset(
//                                                   isHeartFilled1 ? 'assets/heartpurple.png' : 'assets/heartwhite.png',
//                                                   width: 44,  // Adjusted size for better visibility
//                                                   height: 24, // Adjusted size for better visibility
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//
//                                 SizedBox(width: 10),
//
//                                 // Second box with image (Page12 navigation)
//                                 Expanded(
//                                   child: GestureDetector(
//                                     onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => Page11())),
//                                     child: Container(
//                                       decoration: BoxDecoration(
//                                         color: Colors.white,  // Box color
//                                         borderRadius: BorderRadius.circular(10),  // Rounded corners
//                                         boxShadow: [
//                                           BoxShadow(blurRadius: 5, color: Colors.black.withOpacity(0.2), spreadRadius: 2)
//                                         ], // Optional: shadow for a nice card effect
//                                       ),
//                                       padding: EdgeInsets.all(12),  // Padding inside the box
//                                       child: Column(
//                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                         children: [
//                                           Image.asset(
//                                             'assets/p7i12.png',
//                                             fit: BoxFit.cover,
//                                             height: 100,
//                                             errorBuilder: (_, __, ___) => Container(color: Colors.grey, height: 100),
//                                           ),
//                                           SizedBox(height: 8),
//
//                                           // Salon Name
//                                           Text(
//                                             'Prasa With Duli',
//                                             style: TextStyle(
//                                               fontSize: 20,
//                                               fontWeight: FontWeight.bold,
//                                               color: Colors.black,
//                                             ),
//                                           ),
//                                           SizedBox(height: 4),
//
//                                           // Location Text
//                                           Text(
//                                             'Location',
//                                             style: TextStyle(
//                                               fontSize: 16,
//                                               color: Colors.grey[600],
//                                             ),
//                                           ),
//                                           SizedBox(height: 8),
//
//                                           // Row for Save and Heart Icon
//                                           Row(
//                                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                             children: [
//                                               // Save Icon
//                                               Image.asset(
//                                                 'assets/save.png',
//                                                 width: 110,  // Adjusted size
//                                                 height: 24, // Adjusted size
//                                               ),
//
//                                               // Heart Icon (with toggle effect)
//                                               GestureDetector(
//                                                 onTap: () {
//                                                   setState(() {
//                                                     isHeartFilled2 = !isHeartFilled2;  // Toggle the heart status
//                                                   });
//                                                 },
//                                                 child: Image.asset(
//                                                   isHeartFilled2 ? 'assets/heartpurple.png' : 'assets/heartwhite.png',
//                                                   width: 44,  // Adjusted size for better visibility
//                                                   height: 24, // Adjusted size for better visibility
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//
//                           Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
//                             child: Align(
//                               alignment: Alignment.centerLeft,
//                               child: Text(
//                                 'Recommended',
//                                 style: TextStyle(
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ),
//                           ),
//
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                       child: Row(
//                         children: [
//                           Expanded(
//                             child: GestureDetector(
//                               onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => Page11())),
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                   color: Colors.white,  // Box color
//                                   borderRadius: BorderRadius.circular(10),  // Rounded corners
//                                   boxShadow: [
//                                     BoxShadow(blurRadius: 5, color: Colors.black.withOpacity(0.2), spreadRadius: 2)
//                                   ], // Optional: shadow for a nice card effect
//                                 ),
//                                 padding: EdgeInsets.all(12),  // Padding inside the box
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Image.asset(
//                                       'assets/p7i13.png',
//                                       fit: BoxFit.cover,
//                                       height: 100,
//                                       errorBuilder: (_, __, ___) => Container(color: Colors.grey, height: 100),
//                                     ),
//                                     SizedBox(height: 10),
//
//                                     // Salon Name
//                                     Text(
//                                       'Priya Salon',
//                                       style: TextStyle(
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.bold,
//                                         color: Colors.black,
//                                       ),
//                                     ),
//                                     SizedBox(height: 4),
//
//                                     // Location Text
//                                     Text(
//                                       'Location',
//                                       style: TextStyle(
//                                         fontSize: 16,
//                                         color: Colors.grey[600],
//                                       ),
//                                     ),
//                                     SizedBox(height: 8),
//
//                                     // Row for Save and Heart Icon
//                                     Row(
//                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         // Save Icon
//                                         Image.asset(
//                                           'assets/save.png',
//                                           width: 110,  // Adjusted size
//                                           height: 24, // Adjusted size
//                                         ),
//
//                                         // Heart Icon (with toggle effect)
//                                         GestureDetector(
//                                           onTap: () {
//                                             setState(() {
//                                               isHeartFilled3 = !isHeartFilled3;  // Toggle the heart status
//                                             });
//                                           },
//                                           child: Image.asset(
//                                             isHeartFilled3 ? 'assets/heartpurple.png' : 'assets/heartwhite.png',
//                                             width: 44,  // Adjusted size for better visibility
//                                             height: 24, // Adjusted size for better visibility
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                           SizedBox(width: 10),
//                           Expanded(
//                             child: GestureDetector(
//                               onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => Page11())),
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                   color: Colors.white,  // Box color
//                                   borderRadius: BorderRadius.circular(10),  // Rounded corners
//                                   boxShadow: [
//                                     BoxShadow(blurRadius: 5, color: Colors.black.withOpacity(0.2), spreadRadius: 2)
//                                   ], // Optional: shadow for a nice card effect
//                                 ),
//                                 padding: EdgeInsets.all(12),  // Padding inside the box
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Image.asset(
//                                       'assets/p7i14.png',
//                                       fit: BoxFit.cover,
//                                       height: 100,
//                                       errorBuilder: (_, __, ___) => Container(color: Colors.grey, height: 100),
//                                     ),
//                                     SizedBox(height: 8),
//
//                                     // Salon Name
//                                     Text(
//                                       'Leo Max  Salon',
//                                       style: TextStyle(
//                                         fontSize: 18,
//
//                                         fontWeight: FontWeight.bold,
//                                         color: Colors.black,
//                                       ),
//                                     ),
//                                     SizedBox(height: 4),
//
//                                     // Location Text
//                                     Text(
//                                       'Location',
//                                       style: TextStyle(
//                                         fontSize: 16,
//                                         color: Colors.grey[600],
//                                       ),
//                                     ),
//                                     SizedBox(height: 8),
//
//                                     // Row for Save and Heart Icon
//                                     Row(
//                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         // Save Icon
//                                         Image.asset(
//                                           'assets/save.png',
//                                           width: 110,  // Adjusted size
//                                           height: 24, // Adjusted size
//                                         ),
//
//                                         // Heart Icon (with toggle effect)
//                                         GestureDetector(
//                                           onTap: () {
//                                             setState(() {
//                                               isHeartFilled4 = !isHeartFilled4;  // Toggle the heart status
//                                             });
//                                           },
//                                           child: Image.asset(
//                                             isHeartFilled4 ? 'assets/heartpurple.png' : 'assets/heartwhite.png',
//                                             width: 44,  // Adjusted size for better visibility
//                                             height: 24, // Adjusted size for better visibility
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//
//
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
//                       child: Align(
//                         alignment: Alignment.centerLeft,
//                         child: Text(
//                           'Nearest Salon',
//                           style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ),
//
// // Column to display two images with padding
//
//
//
//                     SizedBox(height: 15),
//                   ],
//                 ),
//               ),
//             ),
//
//             // Bottom navigation bar
//             Container(
//               height: 120,
//               width : 400,
//               decoration: BoxDecoration(
//                 border: Border(top: BorderSide(color: Colors.grey.shade300)),
//                 color: Colors.white,
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   _buildFooterImageIcon(0, 'Home', 'assets/home.png', 'assets/home_ash.png'),
//                   _buildFooterImageIcon(1, 'Appointments', 'assets/calender.png', 'assets/calender_ash.png'),
//
//                   // Center search icon
//                   GestureDetector(
//                     onTap: () {
//                       // Add functionality for search if needed
//                     },
//                     child: Transform.translate(
//                       offset: Offset(0, -50),
//                       child: Container(
//                         width: 80,
//                         height: 80,
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: Colors.white,
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.black26,
//                               blurRadius: 6,
//                               offset: Offset(0, 3),
//                             ),
//                           ],
//                         ),
//                         child: Image.asset(
//                           'assets/search_color.png',
//                           fit: BoxFit.contain,
//                         ),
//                       ),
//                     ),
//                   ),
//
//                   _buildFooterImageIcon(2, 'Favorite', 'assets/heart.png', 'assets/heart_ash.png'),
//                   _buildFooterImageIcon(3, 'Profile', 'assets/person.png', 'assets/person_ash.png'),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
