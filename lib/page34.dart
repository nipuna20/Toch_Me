// At the top
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:newtouchme/SalonHome_Screen.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'SalonHomeScreen.dart';
import 'package:dropdown_search/dropdown_search.dart';

import 'Page8.dart';
import 'Page9.dart';
import 'Page10.dart';
import 'Page11.dart';
import 'Page17.dart';
import 'Page18.dart';
import 'Page19.dart';
import 'Page20.dart';
import 'Page21.dart';
import 'Page22.dart';

import 'Page23.dart';
import 'Page24.dart';
import 'Page25.dart';
import 'Page11.dart';

class Page34 extends StatefulWidget {
  const Page34({super.key});



  @override
  _Page34State createState() => _Page34State();
}

class _Page34State extends State<Page34> {


  String? _selectedService;
  String? _selectedSortone; // Stores selected sorting type
  double? _selectedPriceone; // Stores selected price
  String? _selectedTypeone; // Stores selected type

  String? _selectedSort; // Stores selected filter sorting
  double? _selectedPrice; // Stores selected filter price
  String? _selectedType; // Stores selected filter type

  int _selectedIndex = 0;


  bool isHeartFilled1 = false; // Initially set to false (heart is white)
  bool isHeartFilled2 = false; // Initially set to false (heart is white)
  bool isHeartFilled3 = false; // Initially set to false (heart is white)
  bool isHeartFilled4 = false;

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

  List<String> sortOptions = ['Recommended', 'Top-rated', 'Nearest'];
  List<String> typeOptions = ['Everyone', 'Male', 'Female'];
 // String _selectedSortone = "Sort";
  //String _selectedTypeone = "Type";
  //double _selectedPriceone = 0.0; // Initial value set to 0

  String _selectedDateTime = "When"; // Default text

  Future<void> _selectDateTime(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null) {
        String formattedDate = DateFormat('yyy/MM/dd').format(pickedDate);
        String formattedTime = pickedTime.format(context);

        setState(() {
          _selectedDateTime = "$formattedDate\n$formattedTime"; // Show in two lines
        });
      }
    }
  }



  void _showFilterModal() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (context) {
        // String? tempSortBy = _selectedSort;
        // double? tempPrice = _selectedPrice;
        // String? tempType = _selectedType;

        String? tempSortBy = _selectedSortone;
        double? tempPrice = _selectedPriceone;
        String? tempType = _selectedTypeone;

        return StatefulBuilder(
          builder: (context, setModalState) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.9,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  children: [
                    const Text("Filters", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 20),

                    // Sort By
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Sort by", style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    Column(
                      children: ["Recommended", "Top-rated", "Nearest"].map((option) {
                        return RadioListTile<String>(
                          title: Text(option),
                          value: option,
                          groupValue: tempSortBy,
                          onChanged: (value) {
                            setModalState(() => tempSortBy = value!);
                          },
                        );
                      }).toList(),
                    ),

                    const Divider(),

                    // Max Price
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Maximum Price", style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    Slider(
                      min: 0,
                      max: 80000,
                      divisions: 10,
                      value: tempPrice ?? 0.0,
                      // Ensure a non-null value
                      label: "Rs. ${NumberFormat('#,###').format((tempPrice ?? 0).round())}", // Handle null safely
                      onChanged: (value) {
                        setModalState(() => tempPrice = value);
                      },
                    ),

                    const Divider(),

                    // Venue Type
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Venue Type", style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: ["Everyone", "Female", "Male", "Kids"].map((type) {
                        final isSelected = tempType == type;
                        return ElevatedButton(
                          onPressed: () => setModalState(() => tempType = type),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: isSelected ? Colors.purple : Colors.grey.shade200,
                            foregroundColor: isSelected ? Colors.white : Colors.black,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          ),
                          child: Text(type),
                        );
                      }).toList(),
                    ),

                    const Divider(),

                    // Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        OutlinedButton(
                          onPressed: () {
                            setModalState(() {
                              tempSortBy = 'Recommended';
                              tempType = 'Everyone';
                              tempPrice = 50;
                            });
                          },
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Colors.purple),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          ),
                          child: const Text("Clear All"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _selectedSortone = tempSortBy;
                              _selectedPriceone = tempPrice ?? 0.0;

                              _selectedTypeone = tempType;
                            });
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purple,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          ),
                          child: const Text("Apply", style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }


  // Show popup for Price selection

  // Method to show the dialog
  void _showPriceDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, setState) {
            return AlertDialog(
              title: const Text("Select Price Range"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      " Price",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  // Price Slider
                  Slider(
                    value: _selectedPriceone ?? 0, // Handle null value
                    min: 0,
                    max: 80000,
                    divisions: 10, // 10 divisions on the slider
                    label: "Rs. ${NumberFormat('#,###').format((_selectedPriceone ?? 0).round())}",
                    activeColor: Colors.purple,
                    inactiveColor: Colors.grey[300],
                    onChanged: (value) {
                      setState(() {
                        _selectedPriceone = value; // Update price dynamically
                      });
                    },
                  ),
                  // Display Selected Price
                  Text(
                    "Rs. ${NumberFormat('#,###').format((_selectedPriceone ?? 0).round())}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    setState(() {}); // Ensure UI updates
                    Navigator.pop(context); // Close dialog
                  },
                  child: const Text("OK", style: TextStyle(color: Colors.purple)),
                ),
              ],
            );
          },
        );
      },
    );
  }


  //String? _selectedSort; // Stores selected sort option

// Method to show the sort dialog
  // Method to show the sort dialog
  // Method to show the sort dialog
  // Method to show the sort dialog
  void _showSortDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: const Text("Sort By"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildSortButton("Recommended", setState),
                  _buildSortButton("Top-rated", setState),
                  _buildSortButton("Nearest", setState),
                ],
              ),
              actions: [
                // "OK" button - immediately updates the button text
                TextButton(
                  onPressed: () {
                    setState(() {
                      // Update the _selectedSortone with the selected value
                      // This ensures the value is saved when the "OK" button is pressed
                      // No need to manually assign _selectedSortone here, it's updated automatically
                    });
                    Navigator.pop(context); // Close the dialog
                  },
                  child: const Text("OK", style: TextStyle(color: Colors.purple)),
                ),
                // "Close" button - Close without saving
                TextButton(
                  onPressed: () => Navigator.pop(context), // Close without selecting
                  child: const Text("Close", style: TextStyle(color: Colors.purple)),
                ),
              ],
            );
          },
        );
      },
    );
  }

// Build the sort options as radio buttons
  Widget _buildSortButton(String sortOption, StateSetter setState) {
    return RadioListTile<String>(
      title: Text(sortOption),
      value: sortOption,
      groupValue: _selectedSortone,
      onChanged: (value) {
        setState(() {
          _selectedSortone = value; // Update the selected sort option
        });
      },
    );
  }





  // String? _selectedType; // Stores selected type option

  // Method to show the type selection dialog
  void _showTypeDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, setState) {
            return AlertDialog(
              title: const Text("Select Type"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildTypeButton("Everyone", setState),
                  _buildTypeButton("Female", setState),
                  _buildTypeButton("Male", setState),
                  _buildTypeButton("Kids", setState),
                ],
              ),
              actions: [
                // "OK" button to confirm the selection
                if (_selectedTypeone != null)
                  TextButton(
                    onPressed: () {
                      // Pass the selected type value to the main widget
                      setState(() {
                        Navigator.pop(context);
                      });
                    },
                    child: const Text("OK", style: TextStyle(color: Colors.purple)),
                  ),
                TextButton(
                  onPressed: () => Navigator.pop(context), // Close without action
                  child: const Text("Close", style: TextStyle(color: Colors.purple)),
                ),
              ],
            );
          },
        );
      },
    );
  }

  // Method to build each type selection button
  Widget _buildTypeButton(String option, StateSetter setState) {
    bool isSelected = _selectedTypeone == option;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? Colors.purple : Colors.white,
          foregroundColor: isSelected ? Colors.white : Colors.purple,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: const BorderSide(color: Colors.purple),
          ),
        ),
        onPressed: () {
          setState(() {
            _selectedTypeone = option; // Update the selected type
          });
        },
        child: Text(option),
      ),
    );
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
        Navigator.push(context, MaterialPageRoute(builder: (_) => SalonHomeScreen()));
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => Page8(
              appointmentDate: DateTime.now(),
              bookingDate: DateTime.now(),
              appointmentTitle: 'Your Title Here',
              appointmentDescription: '',
              appointmentTime: DateTime.now(),
              price: '',

              appointmentDetails: const [],
            ),
          ),
        );
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

  Widget _buildFooterImageIcon(int index, String label, String iconPath,
      String inactiveIconPath) {
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
          Text(
            label,
            style: TextStyle(
              color: _selectedIndex == index ? Colors.black : Colors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }


  @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: ResponsiveWrapper.builder(
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // Header with image, greeting, and dropdown

                        Stack(
                          children: [
                            // Background image clipped from top
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
                                    errorBuilder: (_, __, ___) =>
                                        const Text('Image not found'),
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
                                        MaterialPageRoute(builder: (context) => SalonHomeScreen()),
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
                                    '  Services',
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),


                            // Dropdown for selecting services
                            Positioned(
                              top: 60, // Adjust depending on image height
                              left: MediaQuery
                                  .of(context)
                                  .size
                                  .width * 0.03,
                              right: MediaQuery
                                  .of(context)
                                  .size
                                  .width * 0.03,
                              child: Container(
                                height: 50,
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25),
                                  border:
                                  Border.all(color: Colors.grey.shade300),
                                ),
                                child: DropdownSearch<String>(
                                  items: services,
                                  selectedItem: _selectedService,
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedService = value!;
                                    });
                                  },
                                  popupProps: PopupProps.menu(
                                    showSearchBox: true,
                                    searchFieldProps: TextFieldProps(
                                      decoration: InputDecoration(
                                        hintText: "Type to search...",
                                        prefixIcon: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Image.asset(
                                            'assets/search.png',
                                            width: 20,
                                            height: 20,
                                            errorBuilder: (_, __, ___) =>
                                                const Icon(Icons.search,
                                                    color: Colors.grey),
                                          ),
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                  ),
                                  dropdownDecoratorProps:
                                  DropDownDecoratorProps(
                                    dropdownSearchDecoration: InputDecoration(
                                      hintText: "Search your services",
                                      prefixIcon: Padding(
                                        padding: const EdgeInsets.all(12),
                                        child: Image.asset(
                                          'assets/search.png',
                                          width: 20,
                                          height: 20,
                                          errorBuilder: (_, __, ___) =>
                                              const Icon(
                                                  Icons.search,
                                                  color: Colors.grey),
                                        ),
                                      ),
                                      contentPadding: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 10),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.circular(25),
                                        borderSide: BorderSide.none,
                                      ),
                                      filled: true,
                                      fillColor: Colors.white,
                                    ),
                                  ),
                                  dropdownBuilder: (context, selectedItem) {
                                    return Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(selectedItem ??
                                            ' Select service '),
                                        Image.asset(
                                          'assets/dropdown.png',
                                          width: 10,
                                          height: 10,
                                          errorBuilder: (_, __, ___) =>
                                              const Icon(
                                                  Icons.arrow_drop_down,
                                                  color: Colors.grey),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ),

                            // Where & When Fields
                            Positioned(
                              top: 130,
                              // Adjust depending on the dropdown position
                              left: 12,
                              right: 12,
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 50,
                                      margin: const EdgeInsets.only(right: 10),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                        BorderRadius.circular(25),
                                        border: Border.all(
                                            color: Colors.grey.shade300),
                                      ),
                                      child: TextField(
                                        decoration: InputDecoration(
                                          hintText: "Where",
                                          prefixIcon: Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Image.asset(
                                              'assets/location_on.png',
                                              width: 20,
                                              height: 20,
                                              errorBuilder: (_, __, ___) =>
                                                  const Icon(Icons.location_on,
                                                      color: Colors.grey),
                                            ),
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(25),
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () async {
                                        await _selectDateTime(context); // Call the function when tapped
                                      },
                                      child: Container(
                                        height: 50,
                                        margin: const EdgeInsets.only(left: 10),
                                        padding: const EdgeInsets.symmetric(horizontal: 10),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(25),
                                          border: Border.all(color: Colors.grey.shade300),
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: Image.asset(
                                                'assets/calender.png',
                                                width: 30,
                                                height: 30,
                                                errorBuilder: (_, __, ___) =>
                                                    const Icon(Icons.calendar_today, color: Colors.grey),
                                              ),
                                            ),
                                            Expanded(
                                              child: Center( // Centers the date & time
                                                child: Text(
                                                  _selectedDateTime,  // Display selected date & time
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(fontSize: 16, color: Colors.black),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )

                                ],
                              ),
                            ),

//New one.................................................
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 200),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        foregroundColor: Colors.grey,
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                                        side: const BorderSide(color: Colors.grey),
                                      ),
                                      onPressed: _showFilterModal, // Open the modal bottom sheet
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Image.asset('assets/sort.png', width: 20, height: 20),
                                          const SizedBox(width: 6),
                                         // Text("Filters", style: TextStyle(color: Colors.grey, fontSize: 14)),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),

                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(25),
                                        border: Border.all(color: Colors.white),
                                      ),
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.white,
                                          foregroundColor: Colors.black,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(25),
                                          ),
                                          side: const BorderSide(color: Colors.grey),
                                        ),
                                        onPressed: _showSortDialog, // Show the sort dialog on press
                                        child: Text(
                                          _selectedSortone ?? "Sort", // Display selected sort or hint text
                                          style: const TextStyle(color: Colors.black, fontSize: 14),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),



//2025.04.03
                              const SizedBox(width: 8,),
                                Expanded(
                                  child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(25),
                                      border: Border.all(color: Colors.white),
                                    ),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        foregroundColor: Colors.grey,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(25),
                                        ),
                                        side: const BorderSide(color: Colors.grey),
                                      ),
                                      onPressed: () {
                                        _showPriceDialog(); // Always open the price scale
                                      },
                                      child: Text(
                                        (_selectedPriceone == null || _selectedPriceone == 0)
                                            ? "Price"  // Show "Price" when no value is selected
                                            : "Rs. ${NumberFormat('#,###').format(_selectedPriceone!.round())}",
                                        style: const TextStyle(color: Colors.black, fontSize: 12),
                                      ),
                                    ),
                                  ),
                                ),


                                //
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        foregroundColor: Colors.grey,
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                                        side: const BorderSide(color: Colors.grey),
                                      ),
                                      onPressed: () {
                                        if ((_selectedTypeone == null || _selectedTypeone!.isEmpty) ||
                                            (_selectedType == null || _selectedType!.isEmpty)) {
                                          _showTypeDialog(); // Show sort dialog if nothing is selected
                                        } else {
                                          _showFilterModal(); // Show filter modal if something is selected
                                        }
                                      },
                                      child: Text(
                                        _selectedTypeone?.isNotEmpty == true ? _selectedTypeone! : (_selectedType?.isNotEmpty == true ? _selectedType! : "Type"),
                                        style: const TextStyle(color: Colors.black, fontSize: 12),
                                      ),
                                    ),
                                  ),
                                ),



                               // SizedBox(width: 4),
                               //        Expanded(
                               //          child: Container(
                               //            height: 50,
                               //            decoration: BoxDecoration(
                               //              color: Colors.white,
                               //              borderRadius: BorderRadius.circular(25),
                               //              border: Border.all(color: Colors.white),
                               //            ),
                               //            child: ElevatedButton(
                               //              style: ElevatedButton.styleFrom(
                               //                backgroundColor: Colors.white,
                               //                foregroundColor: Colors.grey,
                               //                shape: RoundedRectangleBorder(
                               //                  borderRadius: BorderRadius.circular(25),
                               //                ),
                               //                side: BorderSide(color: Colors.grey),
                               //              ),
                               //              onPressed: () => _showTypeDialog(),
                               //              child: Text(
                               //                _selectedTypeone ?? "Type",
                               //                style: TextStyle(color: Colors.grey, fontSize: 14),
                               //              ),
                               //            ),
                               //          ),
                               //        ),
                                //
                                //     ],
                                //   ),
                                // ),

                               // SizedBox(width: 4),
                                //       Expanded(
                                //         child: Container(
                                //           height: 50,
                                //           decoration: BoxDecoration(
                                //             color: Colors.white,
                                //             borderRadius: BorderRadius.circular(25),
                                //             border: Border.all(color: Colors.white),
                                //           ),
                                //           child: ElevatedButton(
                                //             style: ElevatedButton.styleFrom(
                                //               backgroundColor: Colors.white,
                                //               foregroundColor: Colors.grey,
                                //               shape: RoundedRectangleBorder(
                                //                 borderRadius: BorderRadius.circular(25),
                                //               ),
                                //               side: BorderSide(color: Colors.grey),
                                //             ),
                                //             onPressed: () => _showTypeDialog(),
                                //             child: Text(
                                //               _selectedType ?? "Type",
                                //               style: TextStyle(color: Colors.grey, fontSize: 14),
                                //             ),
                                //           ),
                                //         ),
                                //       ),
                                //
                                //     ],
                                //   ),
                                // ),

                                // SizedBox(width: 4),
                                //       Expanded(
                                //         child: Container(
                                //           height: 50,
                                //           decoration: BoxDecoration(
                                //             color: Colors.white,
                                //             borderRadius: BorderRadius.circular(25),
                                //             border: Border.all(color: Colors.white),
                                //           ),
                                //           child: ElevatedButton(
                                //             style: ElevatedButton.styleFrom(
                                //               backgroundColor: Colors.white,
                                //               foregroundColor: Colors.grey,
                                //               shape: RoundedRectangleBorder(
                                //                 borderRadius: BorderRadius.circular(25),
                                //               ),
                                //               side: BorderSide(color: Colors.grey),
                                //             ),
                                //             onPressed: () {
                                //               _selectedTypeone == null || _selectedTypeone!.isEmpty
                                //                   ? _showTypeDialog();
                                //                   //: _showFilterModal();
                                //             },
                                //             child: Text(
                                //               _selectedTypeone == null || _selectedTypeone!.isEmpty
                                //                   ? "Type"
                                //                   : _selectedTypeone!,
                                //               style: TextStyle(color: Colors.black, fontSize: 14),
                                //             ),
                                //           ),
                                //         ),
                                //       ),
                                //





                              ],
                            ),


                            const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12.0, vertical: 295.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                children: [
                                  Text(
                                    'Special Offeres',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                ],
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 340),
                              child: Row(
                                children: [
                                  // First box with image, text, and icons (save and heart toggle)
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () => Navigator.push(context,
                                          MaterialPageRoute(
                                              builder: (_) => Page11())),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white, // Box color
                                          borderRadius: BorderRadius.circular(
                                              10), // Rounded corners
                                          boxShadow: [
                                            BoxShadow(blurRadius: 5,
                                                color: Colors.black.withOpacity(
                                                    0.2),
                                                spreadRadius: 2)
                                          ], // Optional: shadow for a nice card effect
                                        ),
                                        padding: const EdgeInsets.all(12),
                                        // Padding inside the box
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,
                                          children: [
                                            Image.asset(
                                              'assets/p7i11.png',
                                              fit: BoxFit.cover,
                                              height: 100,
                                              errorBuilder: (_, __, ___) =>
                                                  Container(color: Colors.grey,
                                                      height: 100),
                                            ),
                                            const SizedBox(height: 8),

                                            // Salon Name
                                            const Text(
                                              'Salon Niro',
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                            ),
                                            const SizedBox(height: 4),

                                            // Location Text
                                            Text(
                                              'Location',
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.grey[600],
                                              ),
                                            ),
                                            const SizedBox(height: 8),

                                            // Row for Save and Heart Icon
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .spaceBetween,
                                              children: [
                                                // Save Icon
                                                Image.asset(
                                                  'assets/save.png',
                                                  width: 110, // Adjusted size
                                                  height: 24, // Adjusted size
                                                ),

                                                // Heart Icon (with toggle effect)
                                                GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      isHeartFilled1 =
                                                      !isHeartFilled1; // Toggle the heart status
                                                    });
                                                  },
                                                  child: Image.asset(
                                                    isHeartFilled1
                                                        ? 'assets/heartpurple.png'
                                                        : 'assets/heartwhite.png',
                                                    width: 44,
                                                    // Adjusted size for better visibility
                                                    height: 24, // Adjusted size for better visibility
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),

                                  const SizedBox(width: 10),

                                  // Second box with image (Page12 navigation)
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () => Navigator.push(context,
                                          MaterialPageRoute(
                                              builder: (_) => Page11())),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white, // Box color
                                          borderRadius: BorderRadius.circular(
                                              10), // Rounded corners
                                          boxShadow: [
                                            BoxShadow(blurRadius: 5,
                                                color: Colors.black.withOpacity(
                                                    0.2),
                                                spreadRadius: 2)
                                          ], // Optional: shadow for a nice card effect
                                        ),
                                        padding: const EdgeInsets.all(12),
                                        // Padding inside the box
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,
                                          children: [
                                            Image.asset(
                                              'assets/p7i12.png',
                                              fit: BoxFit.cover,
                                              height: 100,
                                              errorBuilder: (_, __, ___) =>
                                                  Container(color: Colors.grey,
                                                      height: 100),
                                            ),
                                            const SizedBox(height: 8),

                                            // Salon Name
                                            const Text(
                                              'Prasa With Duli',
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                            ),
                                            const SizedBox(height: 4),

                                            // Location Text
                                            Text(
                                              'Location',
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.grey[600],
                                              ),
                                            ),
                                            const SizedBox(height: 8),

                                            // Row for Save and Heart Icon
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .spaceBetween,
                                              children: [
                                                // Save Icon
                                                Image.asset(
                                                  'assets/save.png',
                                                  width: 110, // Adjusted size
                                                  height: 24, // Adjusted size
                                                ),

                                                // Heart Icon (with toggle effect)
                                                GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      isHeartFilled2 =
                                                      !isHeartFilled2; // Toggle the heart status
                                                    });
                                                  },
                                                  child: Image.asset(
                                                    isHeartFilled2
                                                        ? 'assets/heartpurple.png'
                                                        : 'assets/heartwhite.png',
                                                    width: 44,
                                                    // Adjusted size for better visibility
                                                    height: 24, // Adjusted size for better visibility
                                                  ),
                                                ),
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
                          ],

                        ),


                        // More content goes here
                        //   ],
                        // ),
                        // ),
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Nearest Salon',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),


                        const SizedBox(height: 0),
                      ],
                    ),
                  ),
                ),
                //
                Container(
                  height: 120,
                  decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(color: Colors.grey.shade300)),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildFooterImageIcon(
                          0, 'Home', 'assets/home.png', 'assets/home_ash.png'),
                      _buildFooterImageIcon(
                          1, 'Appointments', 'assets/calender.png',
                          'assets/calender_ash.png'),

                      // Center search icon
                      GestureDetector(
                        onTap: () {
                          // Add functionality for search if needed
                        },
                        child: Transform.translate(
                          offset: const Offset(0, -50),
                          child: Container(
                            width: 80,
                            height: 80,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 6,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Image.asset(
                              'assets/search_color.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),

                      _buildFooterImageIcon(2, 'Favorite', 'assets/heart.png',
                          'assets/heart_ash.png'),
                      _buildFooterImageIcon(3, 'Profile', 'assets/person.png',
                          'assets/person_ash.png'),
                    ],
                  ),
                )
              ],
            ),
          ),
          maxWidth: 1200,
          minWidth: 480,
          defaultScale: true,
          breakpoints: [
            const ResponsiveBreakpoint.resize(480, name: MOBILE),
            const ResponsiveBreakpoint.autoScale(800, name: TABLET),
            const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

