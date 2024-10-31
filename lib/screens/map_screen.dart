import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../controllers/map_controller.dart';

class MapScreen extends StatelessWidget {
  final MapController mapController = Get.find<MapController>();

  MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Map')),
      body: Obx(() => GoogleMap(
            initialCameraPosition: CameraPosition(
              target: mapController.currentLocation.value,
              zoom: 14.0,
            ),
            markers: Set<Marker>.of(mapController.markers),
            onMapCreated: (GoogleMapController controller) {
              // Additional setup if needed
            },
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          mapController.addMarker(
            Marker(
              markerId: const MarkerId('current_location'),
              position: mapController.currentLocation.value,
            ),
          );
        },
        child: const Icon(Icons.location_pin),
      ),
    );
  }
}
