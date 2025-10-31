import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:latihan1_11pplg1/firebase_options.dart';
import 'package:latihan1_11pplg1/app.dart';
import 'package:latihan1_11pplg1/controllers/notification_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Get.put(NotificationController());

  runApp(const MyApp());
}
