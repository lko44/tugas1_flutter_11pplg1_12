import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

// Top-level background handler
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print("📬 Background message: ${message.messageId}");
}

class NotificationController extends GetxController {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();

  var fcmToken = "".obs;

  @override
  void onInit() {
    super.onInit();
    _initFCM();
  }

  Future<void> _initFCM() async {
    await _messaging.requestPermission();

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    fcmToken.value = await _messaging.getToken() ?? "";
    print("🔑 FCM Token: ${fcmToken.value}");

    // Initialize local notifications
    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initSettings =
        InitializationSettings(android: androidSettings);

    await _localNotifications.initialize(initSettings);

    // Foreground messages
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      print("📨 Foreground message received!");
      print("Title: ${message.notification?.title}");
      print("Body: ${message.notification?.body}");

      // Show as real system notification
      await _localNotifications.show(
        message.notification.hashCode,
        message.notification?.title ?? "Notification",
        message.notification?.body ?? "No body",
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'default_channel', // channel id
            'General Notifications', // channel name
            importance: Importance.max,
            priority: Priority.high,
          ),
        ),
      );
    });
  }
}
