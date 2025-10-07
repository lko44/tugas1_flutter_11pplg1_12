import 'package:get/get.dart';
import 'package:latihan1_11pplg1/controllers/football_responsive_controller.dart';

class FootballResponsicveBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<FootballResponsiveController>(()=>FootballResponsiveController());
  }
}