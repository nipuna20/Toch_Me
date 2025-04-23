import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';




class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  static const LatLng _googlePlex = LatLng(37.4223, -122.0848);
  static const LatLng _ = LatLng(37.4223, -122.0848);

  late GoogleMapController _mapController;

  @override
  Widget build(BuildContext context) {
    var pGooglePlex;
    return Scaffold(
      appBar: AppBar(title: const Text("Google Map")),
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
          target: _googlePlex,
          zoom: 15,
        ),

        markers:{
          Marker(
              markerId: const MarkerId("_currentlocation"),
              icon: BitmapDescriptor.defaultMarker,
              position: pGooglePlex),
          Marker(
              markerId: const MarkerId("_currentlocation"),
              icon: BitmapDescriptor.defaultMarker,
              position: pGooglePlex),
      },

      onMapCreated: (controller) {
          _mapController = controller;
        },
        mapType: MapType.normal,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
      ),
    );
  }
}
