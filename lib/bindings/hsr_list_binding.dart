import 'package:get/get.dart';
import 'package:latihan1_11pplg1/controllers/hsr_list_controller.dart';

class HsrListBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<CharacterController>(()=>CharacterController());
  }
} 