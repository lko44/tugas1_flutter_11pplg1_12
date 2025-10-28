import 'package:get/get.dart';
import 'package:latihan1_11pplg1/controllers/uma_list_controller.dart';

class UmaBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<UmaListController>(() => UmaListController());
  }
}