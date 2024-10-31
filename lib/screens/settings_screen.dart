import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/theme_controller.dart';
import '../controllers/locale_controller.dart';

class SettingsScreen extends StatelessWidget {
  final ThemeController themeController = Get.find<ThemeController>();
  final LocaleController localeController = Get.find<LocaleController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Theme',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Obx(() => SwitchListTile(
                  title: Text(
                      themeController.isDarkTheme.value ? "Dark" : "Light"),
                  value: themeController.isDarkTheme.value,
                  onChanged: (bool value) {
                    themeController.toggleTheme();
                  },
                )),
            const Divider(),
            Text(
              'Language',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Obx(() => DropdownButton<String>(
                  value: localeController.currentLocale.value.languageCode,
                  onChanged: (String? newLanguageCode) {
                    if (newLanguageCode != null) {
                      localeController.switchLocale(newLanguageCode);
                    }
                  },
                  items: const [
                    DropdownMenuItem(
                      value: 'en',
                      child: Text('English'),
                    ),
                    DropdownMenuItem(
                      value: 'id',
                      child: Text('Indonesian'),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
