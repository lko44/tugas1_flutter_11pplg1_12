import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan1_11pplg1/pages/controllers/bottom_nav_controller.dart';
import 'calculator_page.dart';
import 'football_page.dart';
import 'profile_page.dart';

class BottomNavPage extends StatelessWidget {
  BottomNavPage({super.key});

  final BottomNavController controller = Get.put(BottomNavController());

  final List<Widget> pages = [
    CalculatorPage(),
    FootballPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          backgroundColor: Colors.grey[100],
          body: pages[controller.currentIndex.value],
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: const Border(
                top: BorderSide(color: Colors.black, width: 2),
              ),
            ),
            child: BottomNavigationBar(
              backgroundColor: Colors.white,
              currentIndex: controller.currentIndex.value,
              onTap: controller.changeTabIndex,
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.grey[600],
              type: BottomNavigationBarType.fixed,
              elevation: 0,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.calculate),
                  label: "CALC",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.sports_soccer),
                  label: "PLAYERS",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: "PROFILE",
                ),
              ],
            ),
          ),
        ));
  }
}