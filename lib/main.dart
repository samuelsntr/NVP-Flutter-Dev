import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/auth_controller.dart';
import 'package:flutter_application_1/controllers/notification_controller.dart';
import 'package:flutter_application_1/screens/registration_screen.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'controllers/theme_controller.dart';
import 'controllers/locale_controller.dart';
import 'screens/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  Get.put(ThemeController());
  Get.put(LocaleController());
  Get.put(NotificationController());
  Get.put(AuthController());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final themeController = Get.find<ThemeController>();
  final localeController = Get.find<LocaleController>();
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      print("Auth state changed: ${authController.isAuthenticated.value}");
      return GetMaterialApp(
        title: 'My Flutter App',
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: themeController.isDarkTheme.value
            ? ThemeMode.dark
            : ThemeMode.light,
        locale: localeController.currentLocale.value,
        home: authController.isAuthenticated.value
            ? HomeScreen()
            : RegistrationScreen(),
      );
    });
  }
}
