import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LocaleController extends GetxController {
  var currentLocale = Locale('en').obs;

  void switchLocale(String languageCode) {
    currentLocale.value = Locale(languageCode);
  }
}
