import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Page15 extends StatefulWidget {
  const Page15({super.key});

  @override
  _Page15State createState() => _Page15State();
}

class _Page15State extends State<Page15> {
  late GoogleMapController mapController;
  static const LatLng _center = LatLng(37.42796133580664, -122.085749655962); // Default location (you can replace with the actual salon's location)
  late CameraPosition _initialPosition;

  @override
  void initState() {
    super.initState();
    _initialPosition = const CameraPosition(
      target: _center,
      zoom: 14.0, // You can adjust the zoom level
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Salon & Spa Location")),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: _initialPosition,
        markers: {
          const Marker(
            markerId: MarkerId('salon'),
            position: _center,
            infoWindow: InfoWindow(title: 'Salon Location'),
          ),
        },
      ),
    );
  }
}
