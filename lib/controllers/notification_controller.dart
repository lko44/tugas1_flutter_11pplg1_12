import 'package:get/get.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:latihan1_11pplg1/models/local_notification.dart';

class NotificationController extends GetxController {
  RxString fcmToken = "".obs;
  RxList<LocalNotification> notifications = <LocalNotification>[].obs;

  final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();

  @override
  void onInit() {
    super.onInit();
    _initLocalNotif();
    _initFCM();
  }

  // ✅ 1. Setup Local Notification (Android Channel)
  Future<void> _initLocalNotif() async {
    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initSettings =
        InitializationSettings(android: androidSettings);

    await _localNotifications.initialize(initSettings);

    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'default_channel',
      'General Notifications',
      description: 'Used for foreground notifications',
      importance: Importance.high,
    );

    await _localNotifications
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }

  // ✅ 2. Setup FCM
  Future<void> _initFCM() async {
    // ✅ Token
    String? token = await FirebaseMessaging.instance.getToken();
    fcmToken.value = token ?? "";
    print("🔑 FCM TOKEN (controller): $token");

    // ✅ Foreground handler → real notification
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      final title = message.notification?.title ?? "No Title";
      final body = message.notification?.body ?? "No Body";

      // ✅ Simpan ke history
      notifications.add(
        LocalNotification(
          title: title,
          body: body,
          timestamp: DateTime.now(),
        ),
      );

      // ✅ Tampilkan sebagai NOTIFIKASI SISTEM
      await _localNotifications.show(
        message.hashCode,
        title,
        body,
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'default_channel',
            'General Notifications',
            importance: Importance.max,
            priority: Priority.high,
          ),
        ),
      );
    });
  }

  void clearNotifications() {
    notifications.clear();
  }
}
