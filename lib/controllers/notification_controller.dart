import 'package:get/get.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationController extends GetxController {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  @override
  void onInit() {
    super.onInit();
    _initializeFCM();
  }

  void _initializeFCM() async {
    // Request permission for iOS
    await _firebaseMessaging.requestPermission();

    // Listen for foreground messages
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // Handle foreground message
      print('Received a foreground message: ${message.notification?.title}');
    });

    // Listen for background and terminated messages
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      // Handle background and terminated message
      print('Notification opened: ${message.notification?.title}');
    });
  }

  Future<void> subscribeToTopic(String topic) async {
    await _firebaseMessaging.subscribeToTopic(topic);
  }

  Future<void> unsubscribeFromTopic(String topic) async {
    await _firebaseMessaging.unsubscribeFromTopic(topic);
  }
}
