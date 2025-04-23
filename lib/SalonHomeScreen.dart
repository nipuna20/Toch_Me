// TODO Implement this library.
import 'package:flutter/material.dart';
import 'package:newtouchme/CustomBottomNavBar.dart' show CustomBottomNavBar;
import 'package:newtouchme/MapPage.dart';

class SalonHomeScreen extends StatelessWidget {
  const SalonHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Section with Gradient and Search
              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                  gradient: LinearGradient(
                    colors: [Color(0xFF5C0461), Color(0xFF9333EA)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Good Morning',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Arshan Sayed',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MapScreen(),
                                ),
                              );
                            },
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.location_on,
                                  size: 18,
                                  color: Colors.purple,
                                ),
                                SizedBox(width: 6),
                                Text(
                                  'Kesbewa',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.purple,
                                  ),
                                ),
                              ],
                            ),
                          ),

                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Container(
                      height: 50,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        children: const [
                          Icon(Icons.search, color: Colors.black45),
                          SizedBox(width: 10),
                          Text(
                            'Search Your Service',
                            style: TextStyle(
                              color: Colors.black45,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Services
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Services',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 80,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    _buildServiceItem('Hair Salon', 'assets/services/hair.png'),
                    _buildServiceItem(
                      'Barbershop',
                      'assets/services/piercingg.png',
                    ),
                    _buildServiceItem('Massage', 'assets/services/spa.png'),
                    _buildServiceItem('Skin Care', 'assets/services/nail.png'),
                    _buildServiceItem('Massage', 'assets/services/tattoo.png'),
                    _buildServiceItem(
                      'Skin Care',
                      'assets/services/makeup.png',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Special Offers
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Special Offers',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    SizedBox(
                      width: 250,
                      child: _buildOfferCard(
                        'Salon Niro',
                        '5.0',
                        '236 Reviews',
                        'assets/offers/offer2.png',
                      ),
                    ),
                    const SizedBox(width: 10),
                    SizedBox(
                      width: 250,
                      child: _buildOfferCard(
                        'Prasa With Duli',
                        '4.5',
                        '155 Reviews',
                        'assets/offers/offer1.png',
                      ),
                    ),
                    const SizedBox(width: 10),
                    SizedBox(
                      width: 250,
                      child: _buildOfferCard(
                        'Prasa With Duli',
                        '4.5',
                        '155 Reviews',
                        'assets/offers/offer1.png',
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Recommended
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Recommended',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    SizedBox(
                      width: 250,
                      child: _buildOfferCard(
                        'Salon Niro',
                        '5.0',
                        '236 Reviews',
                        'assets/offers/offer2.png',
                      ),
                    ),
                    const SizedBox(width: 10),
                    SizedBox(
                      width: 250,
                      child: _buildOfferCard(
                        'Prasa With Duli',
                        '4.5',
                        '155 Reviews',
                        'assets/offers/offer1.png',
                      ),
                    ),
                    const SizedBox(width: 10),
                    SizedBox(
                      width: 250,
                      child: _buildOfferCard(
                        'Prasa With Duli',
                        '4.5',
                        '155 Reviews',
                        'assets/offers/offer1.png',
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Nearest Saloon
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Nearest Saloon',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    _buildNearestSalon(
                      'Lotas Saloon',
                      'Colombo Havelock Road',
                      '4.5',
                      'assets/services/tattoo.png',
                    ),
                    _buildNearestSalon(
                      'Glamour Grove Studio',
                      'Colombo Havelock',
                      '4.6',
                      'assets/services/tattoo.png',
                    ),
                    _buildNearestSalon(
                      'Lotas Saloon',
                      'Colombo Havelock Road',
                      '4.5',
                      'assets/services/tattoo.png',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }

  static Widget _buildServiceItem(String label, String imagePath) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          CircleAvatar(radius: 28, backgroundImage: AssetImage(imagePath)),
          const SizedBox(height: 5),
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  static Widget _buildOfferCard(
    String title,
    String rating,
    String reviews,
    String imagePath,
  ) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey.shade100,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imagePath,
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder:
                  (_, __, ___) => Container(
                    height: 100,
                    color: Colors.grey,
                    alignment: Alignment.center,
                    child: const Icon(Icons.broken_image, color: Colors.white),
                  ),
            ),
          ),
          const SizedBox(height: 8),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Row(
            children: [
              Text(rating, style: const TextStyle(color: Colors.orange)),
              const SizedBox(width: 5),
              Text(
                reviews,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }

  static Widget _buildNearestSalon(
    String name,
    String address,
    String rating,
    String imagePath,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(radius: 25, backgroundImage: AssetImage(imagePath)),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    address,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text('Book Now'),
          ),
        ],
      ),
    );
  }
}
