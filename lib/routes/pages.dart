import 'package:flutter/widgets.dart';
import 'package:get/route_manager.dart';
import 'package:latihan1_11pplg1/pages/calculator_page.dart';
import 'package:latihan1_11pplg1/pages/football_edit_page.dart';
import 'package:latihan1_11pplg1/pages/football_page.dart';
import 'package:latihan1_11pplg1/routes/routes.dart';

class AppPages{
  //list / Array yang isinys kumpulan pages/ui kita
  static final pages = [
    GetPage(name: AppRoutes.calculator, page: () => CalculatorPage()),
    GetPage(name: AppRoutes.footballplayers, page: () => FootballPage()),
    GetPage(name: AppRoutes.footballeditplayers, page: () => FootballEditPage()),

  ];
}