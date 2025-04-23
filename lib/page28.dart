import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'Page11.dart';
import 'Page25.dart';
import 'Page26.dart';
import 'Page27.dart';

class Page28 extends StatefulWidget {
  const Page28({super.key});

  @override
  _Page28State createState() => _Page28State();
}

class _Page28State extends State<Page28> {
  String _activeNavItem = 'Details';
  String _hoveredItem = '';

   LatLng _center = LatLng(6.9271, 79.8612); // Example: Colombo coordinates

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

  void _showFullMapPopup() {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        insetPadding: const EdgeInsets.all(10),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          width: MediaQuery.of(context).size.width * 0.95,
          child: GoogleMap(
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 15,
            ),
            zoomControlsEnabled: true,
            compassEnabled: true,
            mapType: MapType.normal,
            markers: {
              Marker(
                markerId: const MarkerId('salon'),
                position: _center,
                infoWindow: const InfoWindow(title: 'Salon Niro'),
              ),
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top Row with title and back button
            Padding(
              padding: const EdgeInsets.only(top: 40.0, bottom: 10.0, left: 16.0, right: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Page11()));
                    },
                    child: Image.asset(
                      'assets/left_black.png',
                      width: 24,
                      height: 24,
                    ),
                  ),
                  const SizedBox(width: 58),
                  const Text(
                    'Salon Niro',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            // Preview Map
            GestureDetector(
              onTap: _showFullMapPopup,
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 3,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: _center,
                      zoom: 14,
                    ),
                    markers: {
                      Marker(
                        markerId: const MarkerId('salon'),
                        position: _center,
                        infoWindow: const InfoWindow(title: 'Salon Niro'),
                      ),
                    },
                    zoomControlsEnabled: false,
                    compassEnabled: false,
                    liteModeEnabled: true,
                    gestureRecognizers: const {},
                  ),
                ),
              ),
            ),

            // NavBar
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              color: Colors.white60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildNavBarItem('Services', () {
                    setState(() => _activeNavItem = 'Services');
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Page11()));
                  }),
                  _buildNavBarItem('Reviews', () {
                    setState(() => _activeNavItem = 'Reviews');
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Page25()));
                  }),
                  _buildNavBarItem('Portfolio', () {
                    setState(() => _activeNavItem = 'Portfolio');
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Page26()));
                  }),
                  _buildNavBarItem('Gift Cards', () {
                    setState(() => _activeNavItem = 'Gift Cards');
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Page27()));
                  }),
                  _buildNavBarItem('Details', () {
                    setState(() => _activeNavItem = 'Details');
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Page28()));
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
