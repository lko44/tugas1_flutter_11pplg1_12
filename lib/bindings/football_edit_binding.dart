import 'package:get/get.dart';
import 'package:latihan1_11pplg1/controllers/football_edit_controller.dart';

class FootballEditBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<FootballEditController>(()=>FootballEditController());
  }

}