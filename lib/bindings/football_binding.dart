import 'package:get/get.dart';
import 'package:latihan1_11pplg1/controllers/calculator_controller.dart';
import 'package:latihan1_11pplg1/controllers/football_controller.dart';
import 'package:latihan1_11pplg1/controllers/football_edit_controller.dart';

class FootballBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<FootballController>(()=>FootballController());
    Get.lazyPut<CalculatorController>(()=>CalculatorController());
    Get.lazyPut<FootballEditController>(()=>FootballEditController());
  }

}