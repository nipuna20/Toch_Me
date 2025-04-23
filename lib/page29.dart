import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'SalonHomeScreen.dart';
import 'Page8.dart';
import 'Page11.dart';

class Page29 extends StatefulWidget {
  const Page29({super.key});

  @override
  _Page29State createState() => _Page29State();
}

class _Page29State extends State<Page29> with SingleTickerProviderStateMixin {
  DateTime _currentMonth = DateTime.now();
  DateTime _selectedDate = DateTime.now();
  List<DateTime> bookedDates = [];

  late AnimationController _animationController;
  late Animation<double> _animation;

  TimeOfDay? _selectedTime;
  List<Map<String, dynamic>> appointmentDetails = [];

  void bookDate(DateTime selectedDate) {
    if (!bookedDates.contains(selectedDate)) {
      bookedDates.add(selectedDate);
      print('Booked: $selectedDate');
    } else {
      print('Date already booked!');
    }
  }

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    _animationController.forward(from: 0.0);
  }

  void _goToPreviousMonth() {
    setState(() {
      _currentMonth = DateTime(_currentMonth.year, _currentMonth.month - 1);
      _animationController.forward(from: 0.0);
    });
  }

  void _goToNextMonth() {
    setState(() {
      _currentMonth = DateTime(_currentMonth.year, _currentMonth.month + 1);
      _animationController.forward(from: 0.0);
    });
  }

  List<Widget> _buildCalendarDays() {
    final firstDayOfMonth =
        DateTime(_currentMonth.year, _currentMonth.month, 1);
    final firstWeekday = firstDayOfMonth.weekday % 7;
    final daysInMonth =
        DateTime(_currentMonth.year, _currentMonth.month + 1, 0).day;
    final daysInPrevMonth =
        DateTime(_currentMonth.year, _currentMonth.month, 0).day;

    List<Widget> dayWidgets = [];

    final List<String> weekdays = [
      'Sun',
      'Mon',
      'Tue',
      'Wed',
      'Thu',
      'Fri',
      'Sat'
    ];
    dayWidgets.addAll(
      weekdays.map(
        (day) => Center(
          child: Text(
            day,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
          ),
        ),
      ),
    );

    for (int i = 0; i < firstWeekday; i++) {
      int prevMonthDay = daysInPrevMonth - firstWeekday + i + 1;
      dayWidgets.add(
        Center(
          child: Text(
            '$prevMonthDay',
            style: const TextStyle(color: Colors.grey, fontSize: 34),
          ),
        ),
      );
    }

    for (int i = 1; i <= daysInMonth; i++) {
      bool isToday = _currentMonth.month == DateTime.now().month &&
          _currentMonth.year == DateTime.now().year &&
          i == DateTime.now().day;
      bool isBooked = bookedDates.any((date) =>
          date.year == _currentMonth.year &&
          date.month == _currentMonth.month &&
          date.day == i);

      dayWidgets.add(
        GestureDetector(
          onTap: () async {
            DateTime tappedDate =
                DateTime(_currentMonth.year, _currentMonth.month, i);
            TimeOfDay? pickedTime = await showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
            );

            if (pickedTime != null) {
              setState(() {
                _selectedDate = tappedDate;
                _selectedTime = pickedTime;

                DateTime fullDateTime = DateTime(
                  tappedDate.year,
                  tappedDate.month,
                  tappedDate.day,
                  pickedTime.hour,
                  pickedTime.minute,
                );

                appointmentDetails.add({
                  'service': 'Example Service',
                  'salon': 'Example Salon',
                  'bookingDate': DateTime.now(),
                  'appointmentDate': fullDateTime,
                  'price': 'Rs. 5000',
                });

                // Ensure date is marked as booked
                if (!bookedDates.any((date) =>
                    date.year == fullDateTime.year &&
                    date.month == fullDateTime.month &&
                    date.day == fullDateTime.day)) {
                  bookedDates.add(fullDateTime);
                }
              });
            }
          },
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                color: isToday
                    ? Colors.blue
                    : isBooked
                        ? Colors.purple.shade100
                        : (_selectedDate.day == i &&
                                _selectedDate.month == _currentMonth.month &&
                                _selectedDate.year == _currentMonth.year)
                            ? Colors.purple
                            : Colors.transparent,
                borderRadius: BorderRadius.circular(29),
              ),
              child: Padding(
                padding: const EdgeInsets.all(22.0),
                child: Text(
                  '$i',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 38,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }

    int totalCells = dayWidgets.length;
    int remainingCells = 7 - (totalCells % 7);
    if (remainingCells < 7) {
      for (int i = 1; i <= remainingCells; i++) {
        dayWidgets.add(
          Center(
            child: Text(
              '$i',
              style: const TextStyle(color: Colors.purple, fontSize: 38),
            ),
          ),
        );
      }
    }

    return dayWidgets;
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String monthYear = DateFormat('MMMM yyyy').format(_currentMonth);

    return Scaffold(
      backgroundColor: Colors.white,
      body: ResponsiveWrapper.builder(
        SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 60.0, vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Image.asset('assets/left_arrow.png',
                          width: 70, height: 70),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Page11()),
                        );
                      },
                    ),
                    const Expanded(
                      child: Center(
                        child: Text(
                          '   Book an Appointment',
                          style: TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 32),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 60.0, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon:
                          Image.asset('assets/back.png', width: 60, height: 60),
                      onPressed: _goToPreviousMonth,
                    ),
                    Text(
                      monthYear,
                      style:
                          const TextStyle(fontSize: 44, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      icon:
                          Image.asset('assets/next.png', width: 60, height: 60),
                      onPressed: _goToNextMonth,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: FadeTransition(
                    opacity: _animation,
                    child: GridView.count(
                      crossAxisCount: 7,
                      childAspectRatio: 1,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: _buildCalendarDays(),
                    ),
                  ),
                ),
              ),
              // Scrollable area for cards and continue button
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // Display booked appointments as cards
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Column(
                          children: appointmentDetails.map((appointment) {
                            DateTime apptDate = appointment['appointmentDate'];
                            return SizedBox(
                              width: 700,
                              height: 280,
                              child: Card(
                                margin: const EdgeInsets.symmetric(vertical: 12.0),
                                elevation: 5,
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          'Service Name: ${appointment['service']}',
                                          style: const TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold)),
                                      Text(
                                          'Salon Name: ${appointment['salon']}',
                                          style: const TextStyle(fontSize: 24)),
                                      Text(
                                          'Booking Date & Time: ${DateFormat('yyyy-MM-dd – kk:mm').format(appointment['bookingDate'])}',
                                          style: const TextStyle(fontSize: 24)),
                                      Text(
                                          'Appointment Date & Time: ${DateFormat('yyyy-MM-dd – kk:mm').format(apptDate)}',
                                          style: const TextStyle(fontSize: 24)),
                                      Text('Price: ${appointment['price']}',
                                          style: const TextStyle(fontSize: 24)),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          TextButton(
                                            onPressed: () async {
                                              TimeOfDay? newTime =
                                                  await showTimePicker(
                                                context: context,
                                                initialTime:
                                                    TimeOfDay.fromDateTime(
                                                        apptDate),
                                              );
                                              if (newTime != null) {
                                                setState(() {
                                                  appointment[
                                                          'appointmentDate'] =
                                                      DateTime(
                                                    apptDate.year,
                                                    apptDate.month,
                                                    apptDate.day,
                                                    newTime.hour,
                                                    newTime.minute,
                                                  );
                                                });
                                              }
                                            },
                                            child: const Text("Edit",
                                                style: TextStyle(
                                                    fontSize: 24,
                                                    color: Colors.blue)),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              setState(() {
                                                appointmentDetails
                                                    .remove(appointment);
                                              });
                                            },
                                            child: const Text("Cancel",
                                                style: TextStyle(
                                                    fontSize: 24,
                                                    color: Colors.red)),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0, right: 250.0, bottom: 20.0, top:500,),
                            child: SizedBox(
                              width: 400,
                              child: ElevatedButton(
                                onPressed: () async {
                                  var appointment;
                                  final selectedDate = await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Page8(
                                        appointmentTitle: "Hair Spa",
                                        appointmentDescription: "Salon XYZ",
                                        bookingDate: DateTime.now(),
                                        appointmentDate: DateTime.now().add(const Duration(days: 3)),
                                        appointmentTime: DateTime.now().add(const Duration(days: 3, hours: 14)),
                                        price: '',
                                        appointmentDetails: const [],

                                        // price: "Rs. 2000",
                                        // appointmentDetails: appointmentDetails, // ← pass this list
                                      ),
                                    ),
                                  );



                                  if (selectedDate != null) {
                                    setState(() {
                                      _selectedDate = selectedDate;
                                    });
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF4C1356),
                                  padding: const EdgeInsets.symmetric(vertical: 20),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                ),
                                child: const Text(
                                  "Continue",
                                  style: TextStyle(fontSize:32, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ],
          ),

        ),
        maxWidth: 1200,
        minWidth: 4290,
        defaultScale: true,
        breakpoints: [
          const ResponsiveBreakpoint.autoScale(4290, name: MOBILE),
          const ResponsiveBreakpoint.resize(2900, name: TABLET),
          const ResponsiveBreakpoint.autoScale(1000, name: DESKTOP),
        ],
      ),
    );

  }
}
