import 'package:get/get.dart';
import 'package:latihan1_11pplg1/controllers/calculator_controller.dart';

class CalculatorBinding extends Bindings {


  @override
  void dependencies() {
    // TODO: implement dependencies
        Get.put(CalculatorController());
    // hanya dipanggil ketika dibutuhkan saja sedangkan Get.put bodo amat mau dibutuhkan atu tidak

  }

}