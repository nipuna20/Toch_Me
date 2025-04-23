// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:responsive_framework/responsive_framework.dart';
//
// import 'Page7.dart';

// class Page8 extends StatefulWidget {
//   final List<Map<String, dynamic>> appointmentDetails;
//
//   final String appointmentTitle;       // service name
//   final String appointmentDescription; // salon name
//   final DateTime bookingDate;
//   final DateTime appointmentDate;
//   final DateTime appointmentTime; // or just one DateTime for time
//   final String price;
//
//   Page8({
//     Key? key,
//     required this.appointmentTitle,
//     required this.appointmentDescription,
//     required String priced,
//     required this.bookingDate,
//     required this.appointmentDate,
//     required this.appointmentTime,
//     required this.price,
//     required this.appointmentDetails,
//   }) : super(key: key);
//
//   @override
//   _Page8State createState() => _Page8State();
// }
//
// class _Page8State extends State<Page8> with SingleTickerProviderStateMixin {
//   DateTime _currentMonth = DateTime.now();
//   DateTime _selectedDate = DateTime.now();
//   late AnimationController _animationController;
//   late Animation<double> _animation;
//
//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(
//       vsync: this,
//       duration: Duration(milliseconds: 300),
//     );
//     _animation = CurvedAnimation(parent: _animationController, curve: Curves.easeInOut);
//     _animationController.forward(from: 0.0);
//   }
//
//   void _goToPreviousMonth() {
//     setState(() {
//       _currentMonth = DateTime(_currentMonth.year, _currentMonth.month - 1);
//       _animationController.forward(from: 0.0);
//     });
//   }
//
//   void _goToNextMonth() {
//     setState(() {
//       _currentMonth = DateTime(_currentMonth.year, _currentMonth.month + 1);
//       _animationController.forward(from: 0.0);
//     });
//   }
//
//   List<Widget> _buildCalendarDays() {
//     final firstDayOfMonth = DateTime(_currentMonth.year, _currentMonth.month, 1);
//     final firstWeekday = firstDayOfMonth.weekday % 7;
//     final daysInMonth = DateTime(_currentMonth.year, _currentMonth.month + 1, 0).day;
//     final daysInPrevMonth = DateTime(_currentMonth.year, _currentMonth.month, 0).day;
//
//     List<Widget> dayWidgets = [];
//
//     final List<String> weekdays = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
//     dayWidgets.addAll(weekdays.map((day) => Center(
//       child: Text(
//         day,
//         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//       ),
//     )));
//
//     for (int i = 0; i < firstWeekday; i++) {
//       int prevMonthDay = daysInPrevMonth - firstWeekday + i + 1;
//       dayWidgets.add(Center(
//         child: Text(
//           '$prevMonthDay',
//           style: TextStyle(color: Colors.grey, fontSize: 16),
//         ),
//       ));
//     }
//
//     for (int i = 1; i <= daysInMonth; i++) {
//       bool isToday = _currentMonth.month == DateTime.now().month &&
//           _currentMonth.year == DateTime.now().year &&
//           i == DateTime.now().day;
//
//       dayWidgets.add(GestureDetector(
//         onTap: () {
//           setState(() {
//             _selectedDate = DateTime(_currentMonth.year, _currentMonth.month, i);
//           });
//         },
//         child: Center(
//           child: Container(
//             decoration: BoxDecoration(
//               color: isToday ? Colors.blue : _selectedDate.day == i ? Colors.purple : Colors.transparent,
//               borderRadius: BorderRadius.circular(8),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 '$i',
//                 style: TextStyle(
//                   color: isToday ? Colors.white : Colors.black,
//                   fontSize: 20,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ));
//     }
//
//     int totalCells = dayWidgets.length;
//     int remainingCells = 7 - (totalCells % 7);
//     if (remainingCells < 7) {
//       for (int i = 1; i <= remainingCells; i++) {
//         dayWidgets.add(Center(
//           child: Text(
//             '$i',
//             style: TextStyle(color: Colors.purple, fontSize: 16),
//           ),
//         ));
//       }
//     }
//
//     return dayWidgets;
//   }
//
//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     String monthYear = DateFormat('MMMM yyyy').format(_currentMonth);
//
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: ResponsiveWrapper.builder(
//         SafeArea(
//           child: Column(
//             children: [
//               // Top Title Bar
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     IconButton(
//                       icon: Image.asset('assets/left_arrow.png', width: 35, height: 35),
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => Page7()),
//                         );
//                       },
//                     ),
//                     Expanded(
//                       child: Center(
//                         child: Text(
//                           'My All Bookings',
//                           style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                     ),
//                     SizedBox(width: 38),
//                   ],
//                 ),
//               ),
//
//               // Month Navigation
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     IconButton(
//                       icon: Image.asset('assets/back.png', width: 30, height: 30),
//                       onPressed: _goToPreviousMonth,
//                     ),
//                     Text(
//                       monthYear,
//                       style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                     ),
//                     IconButton(
//                       icon: Image.asset('assets/next.png', width: 30, height: 30),
//                       onPressed: _goToNextMonth,
//                     ),
//                   ],
//                 ),
//               ),
//
//               // Calendar View
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 16),
//                   child: FadeTransition(
//                     opacity: _animation,
//                     child: GridView.count(
//                       crossAxisCount: 7,
//                       childAspectRatio: 1,
//                       shrinkWrap: true,
//                       physics: NeverScrollableScrollPhysics(),
//                       children: _buildCalendarDays(),
//                     ),
//                   ),
//                 ),
//               ),
//
//               // Appointment Details Cards Under the Calendar
//               Padding(
//                 padding: const EdgeInsets.all(6.0),
//                 child: Column(
//                   children: widget.appointmentDetails
//                       .where((appointment) =>
//                   appointment['appointmentDate'].year == _selectedDate.year &&
//                       appointment['appointmentDate'].month == _selectedDate.month &&
//                       appointment['appointmentDate'].day == _selectedDate.day)
//                       .map((appointment) {
//
//                     // Make sure the appointment has the required fields
//                     if (appointment['service'] == null ||
//                         appointment['salon'] == null ||
//                         appointment['bookingDate'] == null ||
//                         appointment['appointmentDate'] == null ||
//                         appointment['price'] == null) {
//                       return Container(); // Skip if any field is missing
//                     }
//
//                     DateTime apptDate = appointment['appointmentDate'];
//
//                     return Container(
//                       width: double.infinity, // Ensure it takes full width
//                       margin: EdgeInsets.symmetric(vertical: 12.0),
//                       child: Card(
//                         elevation: 5,
//                         child: Padding(
//                           padding: const EdgeInsets.all(16.0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               // Service Name
//                               Text(
//                                 'Service Name: ${appointment['service']}',
//                                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                               ),
//                               SizedBox(height: 8),
//                               // Salon Name
//                               Text(
//                                 'Salon Name: ${appointment['salon']}',
//                                 style: TextStyle(fontSize: 20),
//                               ),
//                               SizedBox(height: 8),
//                               // Booking Date & Time
//                               Text(
//                                 'Booking Date & Time: ${DateFormat('yyyy-MM-dd – kk:mm').format(appointment['bookingDate'])}',
//                                 style: TextStyle(fontSize: 20),
//                               ),
//                               SizedBox(height: 8),
//                               // Appointment Date & Time
//                               Text(
//                                 'Appointment Date & Time: ${DateFormat('yyyy-MM-dd – kk:mm').format(appointment['appointmentDate'])}',
//                                 style: TextStyle(fontSize: 20),
//                               ),
//                               SizedBox(height: 8),
//                               // Price
//                               Text(
//                                 'Price: ${appointment['price']}',
//                                 style: TextStyle(fontSize: 20),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     );
//                   }).toList(),
//                 ),
//               )
//
//             ],
//           ),
//         ),
//         maxWidth: 1200,
//         minWidth: 480,
//         defaultScale: true,
//         breakpoints: [
//           ResponsiveBreakpoint.autoScale(480, name: MOBILE),
//           ResponsiveBreakpoint.resize(800, name: TABLET),
//           ResponsiveBreakpoint.autoScale(1000, name: DESKTOP),
//         ],
//       ),
//     );
//   }
// }


//
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:responsive_framework/responsive_framework.dart';
//
// import 'Page7.dart';
//
//
// class Page8 extends StatelessWidget {
//   final String appointmentTitle;
//   final String appointmentDescription;
//   final DateTime bookingDate;
//   final DateTime appointmentDate;
//   final DateTime appointmentTime;
//   final String price;
//   final List<Map<String, dynamic>> appointmentDetails;
//
//   // Constructor to receive the data
//   Page8({
//     required this.appointmentTitle,
//     required this.appointmentDescription,
//     required this.bookingDate,
//     required this.appointmentDate,
//     required this.appointmentTime,
//     required this.price,
//     required this.appointmentDetails,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(appointmentTitle)),
//       body: Padding(
//         padding: const EdgeInsets.all(2.0),
//         child: Column(
//           children: [
//
//           Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical:10),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     IconButton(
//                       icon: Image.asset('assets/left_arrow.png', width: 35, height: 35),
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => Page7()),
//                         );
//                       },
//                     ),
//                     Expanded(
//                       child: Center(
//                         child: Text(
//                           'My All Bookings',
//                           style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                     ),
//                     SizedBox(width: 38),
//                   ],
//                 ),
//               ),
//
//
//
//             // Display the main appointment details in a card
//             Card(
//               elevation: 5,
//               child: Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Appointment Title: $appointmentTitle',
//                       style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                     ),
//                     SizedBox(height: 8),
//                     Text(
//                       'Description: $appointmentDescription',
//                       style: TextStyle(fontSize: 18),
//                     ),
//                     SizedBox(height: 8),
//                     Text(
//                       'Booking Date: ${DateFormat('yyyy-MM-dd – kk:mm').format(bookingDate)}',
//                       style: TextStyle(fontSize: 18),
//                     ),
//                     SizedBox(height: 8),
//                     Text(
//                       'Appointment Date: ${DateFormat('yyyy-MM-dd – kk:mm').format(appointmentDate)}',
//                       style: TextStyle(fontSize: 18),
//                     ),
//                     // SizedBox(height: 8),
//                     // Text(
//                     //   'Appointment Time: ${DateFormat('kk:mm').format(appointmentTime)}',
//                     //   style: TextStyle(fontSize: 18),
//                     // ),
//                     SizedBox(height: 8),
//                     Text(
//                       'Price: $price',
//                       style: TextStyle(fontSize: 18),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             // Display the detailed list of appointments
//             Expanded(
//               child: ListView.builder(
//                 itemCount: appointmentDetails.length,
//                 itemBuilder: (context, index) {
//                   var appointment = appointmentDetails[index];
//                   return Card(
//                     elevation: 3,
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'Service: ${appointment['service']}',
//                             style: TextStyle(fontSize: 18),
//                           ),
//                           Text(
//                             'Salon: ${appointment['salon']}',
//                             style: TextStyle(fontSize: 18),
//                           ),
//                           Text(
//                             'Booking Date: ${DateFormat('yyyy-MM-dd – kk:mm').format(appointment['bookingDate'])}',
//                             style: TextStyle(fontSize: 18),
//                           ),
//                           Text(
//                             'Appointment Date: ${DateFormat('yyyy-MM-dd – kk:mm').format(appointment['appointmentDate'])}',
//                             style: TextStyle(fontSize: 18),
//                           ),
//                           Text(
//                             'Price: ${appointment['price']}',
//                             style: TextStyle(fontSize: 18),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


//2025.04.06
//
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:responsive_framework/responsive_framework.dart';
//
// import 'Page7.dart';
// import 'Page11.dart';
//
// class Page8 extends StatefulWidget {
//   final String appointmentTitle;
//   final String appointmentDescription;
//   final DateTime bookingDate;
//   final DateTime appointmentDate;
//   final DateTime appointmentTime;
//   final String price;
//   final List<Map<String, dynamic>> appointmentDetails;
//
//   Page8({
//     required this.appointmentTitle,
//     required this.appointmentDescription,
//     required this.bookingDate,
//     required this.appointmentDate,
//     required this.appointmentTime,
//     required this.price,
//     required this.appointmentDetails,
//   });
//
//   @override
//   _Page8State createState() => _Page8State();
// }
//
//
//
// class _Page8State extends State<Page8> with SingleTickerProviderStateMixin {
//   DateTime _currentMonth = DateTime.now();
//   DateTime _selectedDate = DateTime.now();
//   List<DateTime> bookedDates = [];
//
//   late AnimationController _animationController;
//   late Animation<double> _animation;
//
//   TimeOfDay? _selectedTime;
//
//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(
//       vsync: this,
//       duration: Duration(milliseconds: 300),
//     );
//
//     _animation = CurvedAnimation(
//       parent: _animationController,
//       curve: Curves.easeInOut,
//     );
//
//     _animationController.forward(from: 0.0);
//   }
//
//   void _goToPreviousMonth() {
//     setState(() {
//       _currentMonth = DateTime(_currentMonth.year, _currentMonth.month - 1);
//       _animationController.forward(from: 0.0);
//     });
//   }
//
//   void _goToNextMonth() {
//     setState(() {
//       _currentMonth = DateTime(_currentMonth.year, _currentMonth.month + 1);
//       _animationController.forward(from: 0.0);
//     });
//   }
//
//   List<Widget> _buildCalendarDays() {
//     final firstDayOfMonth =
//     DateTime(_currentMonth.year, _currentMonth.month, 1);
//     final firstWeekday = firstDayOfMonth.weekday % 7;
//     final daysInMonth =
//         DateTime(_currentMonth.year, _currentMonth.month + 1, 0).day;
//     final daysInPrevMonth =
//         DateTime(_currentMonth.year, _currentMonth.month, 0).day;
//
//     List<Widget> dayWidgets = [];
//
//     final List<String> weekdays = [
//       'Sun',
//       'Mon',
//       'Tue',
//       'Wed',
//       'Thu',
//       'Fri',
//       'Sat'
//     ];
//     dayWidgets.addAll(
//       weekdays.map(
//             (day) => Center(
//           child: Text(
//             day,
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
//           ),
//         ),
//       ),
//     );
//
//     for (int i = 0; i < firstWeekday; i++) {
//       int prevMonthDay = daysInPrevMonth - firstWeekday + i + 1;
//       dayWidgets.add(
//         Center(
//           child: Text(
//             '$prevMonthDay',
//             style: TextStyle(color: Colors.grey, fontSize: 34),
//           ),
//         ),
//       );
//     }
//
//     for (int i = 1; i <= daysInMonth; i++) {
//       bool isToday = _currentMonth.month == DateTime.now().month &&
//           _currentMonth.year == DateTime.now().year &&
//           i == DateTime.now().day;
//       bool isBooked = bookedDates.any((date) =>
//       date.year == _currentMonth.year &&
//           date.month == _currentMonth.month &&
//           date.day == i);
//
//       dayWidgets.add(
//         GestureDetector(
//           onTap: () async {
//             DateTime tappedDate =
//             DateTime(_currentMonth.year, _currentMonth.month, i);
//             TimeOfDay? pickedTime = await showTimePicker(
//               context: context,
//               initialTime: TimeOfDay.now(),
//             );
//
//             if (pickedTime != null) {
//               setState(() {
//                 _selectedDate = tappedDate;
//                 _selectedTime = pickedTime;
//
//                 DateTime fullDateTime = DateTime(
//                   tappedDate.year,
//                   tappedDate.month,
//                   tappedDate.day,
//                   pickedTime.hour,
//                   pickedTime.minute,
//                 );
//
//                 widget.appointmentDetails.add({
//                   'service': widget.appointmentTitle,
//                   'salon': widget.appointmentDescription,
//                   'bookingDate': DateTime.now(),
//                   'appointmentDate': fullDateTime,
//                   'price': widget.price,
//                 });
//
//                 // Ensure date is marked as booked
//                 if (!bookedDates.any((date) =>
//                 date.year == fullDateTime.year &&
//                     date.month == fullDateTime.month &&
//                     date.day == fullDateTime.day)) {
//                   bookedDates.add(fullDateTime);
//                 }
//               });
//             }
//           },
//           child: Center(
//             child: Container(
//               decoration: BoxDecoration(
//                 color: isToday
//                     ? Colors.blue
//                     : isBooked
//                     ? Colors.purple.shade100
//                     : (_selectedDate.day == i &&
//                     _selectedDate.month == _currentMonth.month &&
//                     _selectedDate.year == _currentMonth.year)
//                     ? Colors.purple
//                     : Colors.transparent,
//                 borderRadius: BorderRadius.circular(29),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(22.0),
//                 child: Text(
//                   '$i',
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 38,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       );
//     }
//
//     int totalCells = dayWidgets.length;
//     int remainingCells = 7 - (totalCells % 7);
//     if (remainingCells < 7) {
//       for (int i = 1; i <= remainingCells; i++) {
//         dayWidgets.add(
//           Center(
//             child: Text(
//               '$i',
//               style: TextStyle(color: Colors.purple, fontSize: 38),
//             ),
//           ),
//         );
//       }
//     }
//
//     return dayWidgets;
//   }
//
//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     String monthYear = DateFormat('MMMM yyyy').format(_currentMonth);
//
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: ResponsiveWrapper.builder(
//         SafeArea(
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.symmetric(
//                     horizontal: 60.0, vertical: 20.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     IconButton(
//                       icon: Image.asset('assets/left_arrow.png',
//                           width: 70, height: 70),
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => Page11()),
//                         );
//                       },
//                     ),
//                     Expanded(
//                       child: Center(
//                         child: Text(
//                           '   My All Bookings',
//                           style: TextStyle(
//                             fontSize: 48,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(width: 32),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding:
//                 const EdgeInsets.symmetric(horizontal: 60.0, vertical: 20),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     IconButton(
//                       icon:
//                       Image.asset('assets/back.png', width: 60, height: 60),
//                       onPressed: _goToPreviousMonth,
//                     ),
//                     Text(
//                       monthYear,
//                       style:
//                       TextStyle(fontSize: 44, fontWeight: FontWeight.bold),
//                     ),
//                     IconButton(
//                       icon:
//                       Image.asset('assets/next.png', width: 60, height: 60),
//                       onPressed: _goToNextMonth,
//                     ),
//                   ],
//                 ),
//               ),
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 40),
//                   child: FadeTransition(
//                     opacity: _animation,
//                     child: GridView.count(
//                       crossAxisCount: 7,
//                       childAspectRatio: 1,
//                       shrinkWrap: true,
//                       physics: NeverScrollableScrollPhysics(),
//                       children: _buildCalendarDays(),
//                     ),
//                   ),
//                 ),
//               ),
//               // Continue Button
//               Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: Align(
//                   alignment: Alignment.bottomRight,
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 20.0, right: 250.0, bottom: 20.0, top:500,),
//                     child: SizedBox(
//                       width: 400,
//                       child: ElevatedButton(
//                         onPressed: () {
//                           // Proceed with the selected date
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Color(0xFF4C1356),
//                           padding: EdgeInsets.symmetric(vertical: 20),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(100),
//                           ),
//                         ),
//                         child: Text(
//                           "Continue",
//                           style: TextStyle(fontSize:32, color: Colors.white),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         maxWidth: 1200,
//         minWidth: 4290,
//         defaultScale: true,
//         breakpoints: [
//           ResponsiveBreakpoint.autoScale(4290, name: MOBILE),
//           ResponsiveBreakpoint.resize(2900, name: TABLET),
//           ResponsiveBreakpoint.autoScale(1000, name: DESKTOP),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'Page11.dart';
// import 'package:responsive_framework/responsive_framework.dart';
//
// class Page8 extends StatefulWidget {
//   final String appointmentTitle;
//   final String appointmentDescription;
//   final DateTime bookingDate;
//   final DateTime appointmentDate;
//   final DateTime appointmentTime;
//   final String price;
//   final List<Map<String, dynamic>> appointmentDetails;
//
//   Page8({
//     required this.appointmentTitle,
//     required this.appointmentDescription,
//     required this.bookingDate,
//     required this.appointmentDate,
//     required this.appointmentTime,
//     required this.price,
//     required this.appointmentDetails,
//   });
//
//   @override
//   _Page8State createState() => _Page8State();
// }
//
// class _Page8State extends State<Page8> with SingleTickerProviderStateMixin {
//   DateTime _currentMonth = DateTime.now();
//   DateTime _selectedDate = DateTime.now();
//   List<DateTime> appointmentDates = [];
//
//   late AnimationController _animationController;
//   late Animation<double> _animation;
//
//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(
//       vsync: this,
//       duration: Duration(milliseconds: 300),
//     );
//     _animation = CurvedAnimation(
//       parent: _animationController,
//       curve: Curves.easeInOut,
//     );
//     _animationController.forward(from: 0.0);
//
//     // Collect all appointment dates
//     appointmentDates = widget.appointmentDetails.map((appointment) {
//       return appointment['appointmentDate'] as DateTime;
//     }).toList();
//   }
//
//   void _goToPreviousMonth() {
//     setState(() {
//       _currentMonth = DateTime(_currentMonth.year, _currentMonth.month - 1);
//       _animationController.forward(from: 0.0);
//     });
//   }
//
//   void _goToNextMonth() {
//     setState(() {
//       _currentMonth = DateTime(_currentMonth.year, _currentMonth.month + 1);
//       _animationController.forward(from: 0.0);
//     });
//   }
//
//   List<Widget> _buildCalendarDays() {
//     final firstDayOfMonth = DateTime(_currentMonth.year, _currentMonth.month, 1);
//     final firstWeekday = firstDayOfMonth.weekday % 7;
//     final daysInMonth = DateTime(_currentMonth.year, _currentMonth.month + 1, 0).day;
//     final daysInPrevMonth = DateTime(_currentMonth.year, _currentMonth.month, 0).day;
//
//     List<Widget> dayWidgets = [];
//
//     final List<String> weekdays = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
//     dayWidgets.addAll(weekdays.map((day) => Center(
//       child: Text(
//         day,
//         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//       ),
//     )));
//
//     // Add previous month's days to fill the first week
//     for (int i = 0; i < firstWeekday; i++) {
//       int prevMonthDay = daysInPrevMonth - firstWeekday + i + 1;
//       dayWidgets.add(
//         Center(
//           child: Text(
//             '$prevMonthDay',
//             style: TextStyle(color: Colors.grey, fontSize: 16),
//           ),
//         ),
//       );
//     }
//
//     // Add days for the current month
//     for (int i = 1; i <= daysInMonth; i++) {
//       bool isToday = _currentMonth.month == DateTime.now().month &&
//           _currentMonth.year == DateTime.now().year &&
//           i == DateTime.now().day;
//       bool isAppointmentDate = appointmentDates.any((date) =>
//       date.year == _currentMonth.year &&
//           date.month == _currentMonth.month &&
//           date.day == i);
//
//       dayWidgets.add(
//         Center(
//           child: Container(
//             decoration: BoxDecoration(
//               color: isToday
//                   ? Colors.blue
//                   : isAppointmentDate
//                   ? Colors.purple.shade100
//                   : Colors.transparent,
//               borderRadius: BorderRadius.circular(8),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(12.0),
//               child: Text(
//                 '$i',
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 18,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       );
//     }
//
//     // Fill remaining spaces if the grid is not complete
//     int totalCells = dayWidgets.length;
//     int remainingCells = 7 - (totalCells % 7);
//     if (remainingCells < 7) {
//       for (int i = 1; i <= remainingCells; i++) {
//         dayWidgets.add(
//           Center(
//             child: Text(
//               '$i',
//               style: TextStyle(color: Colors.purple, fontSize: 16),
//             ),
//           ),
//         );
//       }
//     }
//
//     return dayWidgets;
//   }
//
//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     String monthYear = DateFormat('MMMM yyyy').format(_currentMonth);
//
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: ResponsiveWrapper.builder(
//           BouncingScrollWrapper.builder(context, SingleChildScrollView(
//             child: Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.symmetric(
//                       horizontal: 60.0, vertical: 20.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       IconButton(
//                         icon: Image.asset('assets/left_arrow.png',
//                             width: 70, height: 70),
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(builder: (context) => Page11()),
//                           );
//                         },
//                       ),
//                       Expanded(
//                         child: Center(
//                           child: Text(
//                             '   My All Bookings',
//                             style: TextStyle(
//                               fontSize: 48,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(width: 32),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding:
//                   const EdgeInsets.symmetric(horizontal: 60.0, vertical: 20),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       IconButton(
//                         icon:
//                         Image.asset('assets/back.png', width: 60, height: 60),
//                         onPressed: _goToPreviousMonth,
//                       ),
//                       Text(
//                         monthYear,
//                         style:
//                         TextStyle(fontSize: 44, fontWeight: FontWeight.bold),
//                       ),
//                       IconButton(
//                         icon:
//                         Image.asset('assets/next.png', width: 60, height: 60),
//                         onPressed: _goToNextMonth,
//                       ),
//                     ],
//                   ),
//                 ),
//                 Expanded(
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 40),
//                     child: FadeTransition(
//                       opacity: _animation,
//                       child: GridView.count(
//                         crossAxisCount: 7,
//                         childAspectRatio: 1,
//                         shrinkWrap: true,
//                         physics: NeverScrollableScrollPhysics(),
//                         children: _buildCalendarDays(),
//                       ),
//                     ),
//                   ),
//                 ),
//                 // Appointment Cards Display
//                 Expanded(
//                   child: ListView.builder(
//                     itemCount: widget.appointmentDetails.length,
//                     itemBuilder: (context, index) {
//                       return Card(
//                         elevation: 5,
//                         margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//                         child: ListTile(
//                           title: Text(widget.appointmentDetails[index]['service']),
//                           subtitle: Text(
//                             '${widget.appointmentDetails[index]['salon']} - ${widget.appointmentDetails[index]['appointmentDate']}',
//                           ),
//                           trailing: Text('\$${widget.appointmentDetails[index]['price']}'),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           )),
//           maxWidth: 1200,
//           minWidth: 400,
//           defaultScale: true,
//           breakpoints: [
//             ResponsiveBreakpoint.resize(400, name: MOBILE),
//             ResponsiveBreakpoint.autoScale(600, name: TABLET),
//             ResponsiveBreakpoint.autoScale(800, name: DESKTOP),
//             ResponsiveBreakpoint.autoScale(1200, name: "XL"),
//           ],
//         ),
//       ),
//     );
//   }
// }


//
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
//
// class Page8 extends StatefulWidget {
//   final String appointmentTitle;
//   final String appointmentDescription;
//   final DateTime bookingDate;
//   final DateTime appointmentDate;
//   final DateTime appointmentTime;
//   final String price;
//   final List<Map<String, dynamic>> appointmentDetails;
//
//   Page8({
//     required this.appointmentTitle,
//     required this.appointmentDescription,
//     required this.bookingDate,
//     required this.appointmentDate,
//     required this.appointmentTime,
//     required this.price,
//     required this.appointmentDetails,
//   });
//
//   @override
//   _Page8State createState() => _Page8State();
// }
//
// class _Page8State extends State<Page8> {
//   DateTime _currentMonth = DateTime.now();
//   List<DateTime> appointmentDates = [];
//
//   @override
//   void initState() {
//     super.initState();
//     appointmentDates = widget.appointmentDetails.map((appointment) {
//       return appointment['appointmentDate'] as DateTime;
//     }).toList();
//   }
//
//   List<Widget> _buildCalendarDays() {
//     final firstDayOfMonth = DateTime(_currentMonth.year, _currentMonth.month, 1);
//     final firstWeekday = firstDayOfMonth.weekday % 7;
//     final daysInMonth = DateTime(_currentMonth.year, _currentMonth.month + 1, 0).day;
//     final daysInPrevMonth = DateTime(_currentMonth.year, _currentMonth.month, 0).day;
//
//     List<Widget> dayWidgets = [];
//
//     final List<String> weekdays = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
//     dayWidgets.addAll(weekdays.map((day) => Center(
//       child: Text(
//         day,
//         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//       ),
//     )));
//
//     // Add previous month's days to fill the first week
//     for (int i = 0; i < firstWeekday; i++) {
//       int prevMonthDay = daysInPrevMonth - firstWeekday + i + 1;
//       dayWidgets.add(
//         Center(
//           child: Text(
//             '$prevMonthDay',
//             style: TextStyle(color: Colors.grey, fontSize: 16),
//           ),
//         ),
//       );
//     }
//
//     // Add days for the current month
//     for (int i = 1; i <= daysInMonth; i++) {
//       bool isToday = _currentMonth.month == DateTime.now().month &&
//           _currentMonth.year == DateTime.now().year &&
//           i == DateTime.now().day;
//       bool isAppointmentDate = appointmentDates.any((date) =>
//       date.year == _currentMonth.year &&
//           date.month == _currentMonth.month &&
//           date.day == i);
//
//       dayWidgets.add(
//         Center(
//           child: Container(
//             decoration: BoxDecoration(
//               color: isToday
//                   ? Colors.blue
//                   : isAppointmentDate
//                   ? Colors.purple.shade100
//                   : Colors.transparent,
//               borderRadius: BorderRadius.circular(8),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(12.0),
//               child: Text(
//                 '$i',
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 18,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       );
//     }
//
//     // Fill remaining spaces if the grid is not complete
//     int totalCells = dayWidgets.length;
//     int remainingCells = 7 - (totalCells % 7);
//     if (remainingCells < 7) {
//       for (int i = 1; i <= remainingCells; i++) {
//         dayWidgets.add(
//           Center(
//             child: Text(
//               '$i',
//               style: TextStyle(color: Colors.purple, fontSize: 16),
//             ),
//           ),
//         );
//       }
//     }
//
//     return dayWidgets;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     String monthYear = DateFormat('MMMM yyyy').format(_currentMonth);
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('My All Bookings'),
//         backgroundColor: Colors.purple,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             // Calendar section
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Text(
//                 monthYear,
//                 style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: GridView.count(
//                 crossAxisCount: 7,
//                 shrinkWrap: true,
//                 physics: NeverScrollableScrollPhysics(),
//                 children: _buildCalendarDays(),
//               ),
//             ),
//             // Appointment details section
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Text(
//                 'Appointment Details',
//                 style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//               ),
//             ),
//             ListView.builder(
//               shrinkWrap: true,
//               itemCount: widget.appointmentDetails.length,
//               itemBuilder: (context, index) {
//                 return Card(
//                   elevation: 5,
//                   margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//                   child: ListTile(
//                     title: Text(widget.appointmentDetails[index]['service']),
//                     subtitle: Text(
//                       '${widget.appointmentDetails[index]['salon']} - ${widget.appointmentDetails[index]['appointmentDate']}',
//                     ),
//                     trailing: Text('\$${widget.appointmentDetails[index]['price']}'),
//                   ),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Page8 extends StatefulWidget {
  final String appointmentTitle;
  final String appointmentDescription;
  final DateTime bookingDate;
  final DateTime appointmentDate;
  final DateTime appointmentTime;
  final String price;
  final List<Map<String, dynamic>> appointmentDetails;

  const Page8({super.key, 
    required this.appointmentTitle,
    required this.appointmentDescription,
    required this.bookingDate,
    required this.appointmentDate,
    required this.appointmentTime,
    required this.price,
    required this.appointmentDetails,
  });

  @override
  _Page8State createState() => _Page8State();
}

class _Page8State extends State<Page8> {
  DateTime _currentMonth = DateTime.now();
  List<DateTime> appointmentDates = [];

  @override
  void initState() {
    super.initState();
    appointmentDates = widget.appointmentDetails.map((appointment) {
      return appointment['appointmentDate'] as DateTime;
    }).toList();
  }

  // Navigate to the previous month
  void _previousMonth() {
    setState(() {
      _currentMonth = DateTime(_currentMonth.year, _currentMonth.month - 1, _currentMonth.day);
    });
  }

  // Navigate to the next month
  void _nextMonth() {
    setState(() {
      _currentMonth = DateTime(_currentMonth.year, _currentMonth.month + 1, _currentMonth.day);
    });
  }

  // Build the calendar days
  List<Widget> _buildCalendarDays() {
    final firstDayOfMonth = DateTime(_currentMonth.year, _currentMonth.month, 1);
    final firstWeekday = firstDayOfMonth.weekday % 7;
    final daysInMonth = DateTime(_currentMonth.year, _currentMonth.month + 1, 0).day;
    final daysInPrevMonth = DateTime(_currentMonth.year, _currentMonth.month, 0).day;

    List<Widget> dayWidgets = [];

    final List<String> weekdays = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
    dayWidgets.addAll(weekdays.map((day) => Center(
      child: Text(
        day,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    )));

    // Add previous month's days to fill the first week
    for (int i = 0; i < firstWeekday; i++) {
      int prevMonthDay = daysInPrevMonth - firstWeekday + i + 1;
      dayWidgets.add(
        Center(
          child: Text(
            '$prevMonthDay',
            style: const TextStyle(color: Colors.grey, fontSize: 16),
          ),
        ),
      );
    }

    // Add days for the current month
    for (int i = 1; i <= daysInMonth; i++) {
      bool isToday = _currentMonth.month == DateTime.now().month &&
          _currentMonth.year == DateTime.now().year &&
          i == DateTime.now().day;
      bool isAppointmentDate = appointmentDates.any((date) =>
      date.year == _currentMonth.year &&
          date.month == _currentMonth.month &&
          date.day == i);

      dayWidgets.add(
        Center(
          child: Container(
            decoration: BoxDecoration(
              color: isToday
                  ? Colors.blue
                  : isAppointmentDate
                  ? Colors.purple.shade100
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                '$i',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      );
    }

    // Fill remaining spaces if the grid is not complete
    int totalCells = dayWidgets.length;
    int remainingCells = 7 - (totalCells % 7);
    if (remainingCells < 7) {
      for (int i = 1; i <= remainingCells; i++) {
        dayWidgets.add(
          Center(
            child: Text(
              '$i',
              style: const TextStyle(color: Colors.purple, fontSize: 16),
            ),
          ),
        );
      }
    }

    return dayWidgets;
  }

  @override
  Widget build(BuildContext context) {
    String monthYear = DateFormat('MMMM yyyy').format(_currentMonth);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '  My All Bookings',
          style: TextStyle(
            color: Colors.white, // Set the text color to white
          ),
        ),
        backgroundColor: Colors.purple, // Purple background color for the AppBar
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            // Calendar section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_left),
                    onPressed: _previousMonth,
                  ),
                  Text(
                    monthYear,
                    style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: const Icon(Icons.arrow_right),
                    onPressed: _nextMonth,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.count(
                crossAxisCount: 7,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: _buildCalendarDays(),
              ),
            ),
            // Appointment details section
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Appointment Details',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            // Displaying appointment details as cards
            Column(
              children: widget.appointmentDetails.map((appointment) {
                return Card(
                  elevation: 5,
                  margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: ListTile(
                    title: Text(appointment['service']),
                    subtitle: Text(
                      '${appointment['salon']} - ${DateFormat('yyyy-MM-dd').format(appointment['appointmentDate'])}',
                    ),
                    trailing: Text('\$${appointment['price']}'),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
