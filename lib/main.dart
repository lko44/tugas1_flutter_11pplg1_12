import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan1_11pplg1/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:latihan1_11pplg1/controllers/notification_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ✅ Firebase init dengan FirebaseOptions
  await Firebase.initializeApp();

  // ✅ NotificationController dipasang sebelum runApp
  Get.put(NotificationController());

  runApp(const MyApp());
}
