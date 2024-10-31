import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/auth_controller.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ProfileScreen extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () => _showEditProfileDialog(context),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() {
              nameController.text = authController.userName.value;
              return Text(
                'Name: ${authController.userName.value}',
                style: TextStyle(fontSize: 18),
              );
            }),
            SizedBox(height: 10),
            Obx(() => Text(
                  'Email: ${authController.userEmail.value}',
                  style: TextStyle(fontSize: 18),
                )),
            SizedBox(height: 20),
            Text('Location:', style: TextStyle(fontSize: 16)),
            Obx(() {
              final location = authController.userLocation.value;
              return location != null
                  ? SizedBox(
                      height: 200,
                      child: GoogleMap(
                        initialCameraPosition: CameraPosition(
                          target: location,
                          zoom: 14,
                        ),
                        markers: {
                          Marker(
                            markerId: MarkerId('userLocation'),
                            position: location,
                          ),
                        },
                      ),
                    )
                  : Text('No location selected.');
            }),
          ],
        ),
      ),
    );
  }

  void _showEditProfileDialog(BuildContext context) {
    LatLng? newLocation;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Edit Profile'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            ElevatedButton(
              onPressed: () async {
                // Open a map picker to select a new location
                newLocation = await _openLocationPicker(context);
              },
              child: Text('Select New Location'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              final name = nameController.text.trim();
              if (name.isNotEmpty) {
                authController.updateProfile(
                    name, newLocation ?? authController.userLocation.value!);
                Navigator.of(context).pop();
              }
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }

  Future<LatLng?> _openLocationPicker(BuildContext context) async {
    LatLng? selectedLocation;
    await showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        height: 300,
        child: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(-6.200000, 106.816666), // Default to Jakarta
            zoom: 10,
          ),
          onTap: (LatLng location) {
            selectedLocation = location;
            Navigator.pop(context);
          },
        ),
      ),
    );
    return selectedLocation;
  }
}
