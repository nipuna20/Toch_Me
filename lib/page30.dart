import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'Page31.dart';
import 'Page32.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:responsive_framework/responsive_framework.dart';

class Page30 extends StatefulWidget {
  const Page30({super.key});

  @override
  _Page30State createState() => _Page30State();
}

class _Page30State extends State<Page30> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String? _selectedService;
  String? _selectedLocation;
  String? _selectedDate;
  String? _selectedTime;

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

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _selectDateTime() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null) {
        setState(() {
          _selectedDate = DateFormat('yyyy/MM/dd').format(pickedDate);
          _selectedTime = pickedTime.format(context);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double? containerHeight = ResponsiveValue<double>(
      context,
      defaultValue: 50.0,
      valueWhen: [
        const Condition.smallerThan(name: MOBILE, value: 40.0),
        const Condition.largerThan(name: TABLET, value: 60.0),
      ],
    ).value;

    double? fontSize = ResponsiveValue<double>(
      context,
      defaultValue: 16.0,
      valueWhen: [
        const Condition.smallerThan(name: MOBILE, value: 14.0),
        const Condition.largerThan(name: TABLET, value: 18.0),
      ],
    ).value;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
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
                        width: double.infinity,
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
                        'Appointments',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),

                Positioned(
                  top: 60,
                  left: 12,
                  right: 12,
                  child: Container(
                    height: 55,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: DropdownSearch<String>(
                      items: services,
                      selectedItem: _selectedService,
                      onChanged: (value) {
                        setState(() {
                          _selectedService = value!;
                        });
                      },
                      popupProps: const PopupProps.menu(
                        showSearchBox: true,
                      ),
                      dropdownDecoratorProps: DropDownDecoratorProps(
                        dropdownSearchDecoration: InputDecoration(
                          hintText: "Search your services",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),

                Positioned(
                  top: 130,
                  left: 12,
                  right: 12,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: containerHeight,
                          margin: const EdgeInsets.only(right: 10),
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          child: TextField(
                            onChanged: (value) {
                              setState(() {
                                _selectedLocation = value;
                              });
                            },
                            decoration: InputDecoration(
                              hintText: _selectedLocation ?? "Where",
                              prefixIcon: const Icon(Icons.location_on, color: Colors.black87),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: _selectDateTime,
                          child: Container(
                            height: containerHeight,
                            margin: const EdgeInsets.only(left: 4),
                            padding: const EdgeInsets.symmetric(horizontal: 25, vertical:1,),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(color: Colors.grey.shade300),
                            ),
                            child: Row(
                              children: [
                                const Icon(Icons.calendar_today, color: Colors.black87),
                                const SizedBox(width: 4),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(_selectedDate ?? "Select Date", style: const TextStyle(fontSize: 12)),
                                    Text(_selectedTime ?? "Select Time", style: const TextStyle(fontSize: 12)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Positioned(
                  top: 220,
                  left: 16,
                  right: 16,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xE0581365),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: TabBar(
                      controller: _tabController,
                      indicatorColor: Colors.purple,
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.grey,
                      indicator: const UnderlineTabIndicator(
                        borderSide: BorderSide(width: 4.0, color: Colors.white),
                      ),
                      tabs: const [
                        Tab(text: "Upcoming"),
                        Tab(text: "Completed"),
                        Tab(text: "Cancelled"),
                      ],
                    ),
                  ),

                ),

              ],
            ),

            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  Center(child: Text("Upcoming Appointments")),
                  Center(child: Text("Completed Appointments")),
                  Center(child: Text("Cancelled Appointments")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
