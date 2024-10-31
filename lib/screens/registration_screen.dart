import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../controllers/auth_controller.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final AuthController authController = Get.find<AuthController>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  LatLng? selectedLocation;
  late GoogleMapController _mapController;

  void _selectLocation(LatLng location) {
    setState(() {
      selectedLocation = location;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            const Text('Select Your Location:', style: TextStyle(fontSize: 16)),
            SizedBox(
              height: 200,
              child: GoogleMap(
                initialCameraPosition: const CameraPosition(
                  target: LatLng(-6.200000, 106.816666), // Default to Jakarta
                  zoom: 10,
                ),
                markers: selectedLocation != null
                    ? {
                        Marker(
                            markerId: const MarkerId('selectedLocation'),
                            position: selectedLocation!)
                      }
                    : {},
                onTap: _selectLocation,
                onMapCreated: (controller) {
                  _mapController = controller;
                },
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final name = nameController.text.trim();
                final email = emailController.text.trim();
                final password = passwordController.text.trim();

                if (name.isNotEmpty &&
                    email.isNotEmpty &&
                    password.isNotEmpty &&
                    selectedLocation != null) {
                  authController.register(email, password);
                  authController.updateProfile(name, selectedLocation!);
                  Get.back(); // Navigate back after registration
                } else {
                  Get.snackbar(
                      "Error", "Please fill all fields and select a location.");
                }
              },
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
