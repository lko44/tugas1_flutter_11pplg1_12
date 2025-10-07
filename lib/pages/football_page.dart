import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan1_11pplg1/controllers/football_responsive_controller.dart';
import 'package:latihan1_11pplg1/pages/mobile/football_mobile_page.dart';
import 'package:latihan1_11pplg1/pages/widescreen/football_widescreen_page.dart';

class FootballPage extends StatelessWidget {
  FootballPage({super.key});

  final controller = Get.find<FootballResponsiveController>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder:
       (context, constraints){
        //detection width screen ?
        controller.updateLayout(constraints);
        //transforming load page
        return Obx(()=>controller.isMobile.value 
        ? FootballMobilePage()
        : FootballWidescreenPage());
       }),
    );
  }
}