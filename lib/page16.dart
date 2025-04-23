import 'dart:io';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'Page10.dart';
import 'Page13.dart'; // Navigate to edit profile page

class Page16 extends StatelessWidget {
  final String name;
  final String email;
  final String phone;
  final String location;
  final String gender;
  final File? profileImage;

  const Page16({super.key, 
    this.name = 'John Doe',
    this.email = 'john.doe@example.com',
    this.phone = '+123456789',
    this.location = 'Colombo, Sri Lanka',
    this.gender = 'Male',
    this.profileImage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ResponsiveWrapper.builder(
        SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(25, 5, 25, 85),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  /// Top Row
                  Row(
                    children: [
                      IconButton(
                        icon: Image.asset('assets/left_arrow.png', width: 35, height: 35),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Page10()),
                          );
                        },
                      ),
                      const Expanded(
                        child: Center(
                          child: Text(
                            'Profile Details',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.purple,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 48), // Balancer
                    ],
                  ),

                  Center(
                    child: CircleAvatar(
                      radius: 80,
                      backgroundColor: Colors.grey[300],
                      backgroundImage: profileImage != null
                          ? FileImage(profileImage!)
                          : const AssetImage('assets/person.png') as ImageProvider,
                    ),
                  ),

                  const SizedBox(height: 20),

                  _buildLabelValue("Name", name),
                  _buildLabelValue("Email", email),
                  _buildLabelValue("Phone", phone),
                  _buildLabelValue("Location", location),
                  _buildLabelValue("Gender", gender),

                  const SizedBox(height: 40),

                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Page13()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple[700],
                        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Edit Profile',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        maxWidth: 1200,
        minWidth: 480,
        defaultScale: true,
        breakpoints: [
          const ResponsiveBreakpoint.autoScale(480, name: MOBILE),
          const ResponsiveBreakpoint.resize(800, name: TABLET),
          const ResponsiveBreakpoint.autoScale(1000, name: DESKTOP),
        ],
      ),
    );
  }

  Widget _buildLabelValue(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black54)),
          const SizedBox(height: 4),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              value,
              style: const TextStyle(fontSize: 18, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}
