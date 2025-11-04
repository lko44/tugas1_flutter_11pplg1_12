 import 'package:get/get.dart';
import 'package:latihan1_11pplg1/controllers/premier_table_controller.dart';

class PremierBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(PremiereTableController());
  }
}