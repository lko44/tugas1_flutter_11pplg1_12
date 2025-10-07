import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/utils.dart';
import 'package:latihan1_11pplg1/fragments/history_fragment.dart';
import 'package:latihan1_11pplg1/fragments/home_fragment.dart';
import 'package:latihan1_11pplg1/fragments/profile_fragment.dart';
import 'package:latihan1_11pplg1/pages/calculator_page.dart';
import 'package:latihan1_11pplg1/controllers/main_menu_controller.dart';
import 'package:latihan1_11pplg1/pages/football_page.dart';
import 'package:latihan1_11pplg1/pages/profile_page.dart';

class MainMenuPage extends StatelessWidget {
  MainMenuPage({super.key});

  final MainMenuController mainMenuController = Get.put(MainMenuController());

  //var global list deklarasi isi menu2 nya
final List<Widget> pages = [
  HomeFragments(),
  FootballPage(),
  CalculatorPage(),
  ProfilePage(),
];


  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: pages[mainMenuController.selectedIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
              icon: Icon(Icons.sports_soccer),
              label: "Football",
            ),
           
            BottomNavigationBarItem(icon: Icon(Icons.calculate), label: "Calculator"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "profile"),
            
          ],
          currentIndex: mainMenuController.selectedIndex.value,
          onTap: mainMenuController.changePage,
        ),
      ),
    );
  }
}
