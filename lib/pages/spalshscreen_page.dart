import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan1_11pplg1/controllers/splashscreen_controller.dart';

class SpalshscreenPage extends StatelessWidget {
  SpalshscreenPage({super.key});
  final controller = Get.find<SplashscreenController>();
  //di controller ketika ada on innit akan langsung di eksekusi 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text("ini splash screen"),
        ),
      ),
    );
  }
}