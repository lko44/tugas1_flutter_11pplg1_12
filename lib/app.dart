import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan1_11pplg1/bindings/football_binding.dart';
import 'package:latihan1_11pplg1/routes/pages.dart';
import 'package:latihan1_11pplg1/routes/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: AppRoutes.splashscreen,
      getPages: AppPages.pages,
      initialBinding: FootballBinding(),
    );
  }
}
