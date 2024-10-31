import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/auth_controller.dart';
import 'package:flutter_application_1/l10n/locale_keys.dart';
import 'package:flutter_application_1/screens/login_screen.dart';
import 'package:flutter_application_1/screens/map_screen.dart';
import 'package:flutter_application_1/screens/profile_screen.dart';
import 'package:flutter_application_1/screens/registration_screen.dart';
import 'package:flutter_application_1/screens/settings_screen.dart';
import 'package:get/get.dart';
import '../controllers/locale_controller.dart';

class HomeScreen extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          Obx(() {
            if (authController.isAuthenticated.value) {
              return IconButton(
                icon: Icon(Icons.logout),
                onPressed: () => authController.logout(),
              );
            } else {
              return Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.login),
                    onPressed: () => Get.to(() => LoginScreen()),
                  ),
                  IconButton(
                    icon: Icon(Icons.person_add),
                    onPressed: () => Get.to(() => RegistrationScreen()),
                  ),
                ],
              );
            }
          }),
        ],
      ),
      body: Center(
        child: Obx(() => Text(
              authController.isAuthenticated.value
                  ? 'Welcome!'
                  : 'Please log in.',
              style: Theme.of(context).textTheme.headlineMedium,
            )),
      ),
      drawer: const AppDrawer(), // Added drawer to HomeScreen for easy access
    );
  }
}

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: const Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.map),
            title: const Text('Map'),
            onTap: () {
              Get.to(() => MapScreen());
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Get.to(() => SettingsScreen());
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () {
              Get.to(() => ProfileScreen());
            },
          ),
        ],
      ),
    );
  }
}
