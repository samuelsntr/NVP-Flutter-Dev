import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  var isAuthenticated = false.obs;
  var userName = ''.obs;
  var userEmail = ''.obs;
  var userLocation = Rxn<LatLng>(); // Nullable location

  @override
  void onInit() {
    super.onInit();
    _auth.authStateChanges().listen((User? user) {
      if (user != null) {
        isAuthenticated.value = true;
        userName.value = user.displayName ?? '';
        userEmail.value = user.email ?? '';
        // Load additional data from a database if needed
      } else {
        isAuthenticated.value = false;
      }
    });
  }

  Future<void> updateProfile(String name, LatLng location) async {
    try {
      await _auth.currentUser?.updateDisplayName(name);
      userName.value = name;
      userLocation.value = location;
    } catch (e) {
      Get.snackbar("Update Error", e.toString());
    }
  }

  // Login
  Future<void> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      isAuthenticated.value = true;
    } catch (e) {
      Get.snackbar("Login Error", e.toString());
    }
  }

  // Logout
  Future<void> logout() async {
    await _auth.signOut();
    isAuthenticated.value = false;
  }

  void register(String email, String password) {}
}
