import 'package:get/get.dart';
import 'package:latihan1_11pplg1/models/uma_model.dart';
import 'package:latihan1_11pplg1/models/umanetwork.dart';

class UmaListController extends GetxController {
  var umas = <UmaList>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUmaList();
  }

  void fetchUmaList() async {
    try {
      isLoading(true);

      // Use correct method name (adjust based on your actual network file)
      final data = await Umanetwork.fetchUmas();

      // Debug check
      print('Fetched ${data.length} umas');
      if (data.isNotEmpty) {
        print('First Uma: ${data.first.nameEn}');
      }

      umas.assignAll(data);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading(false);
    }
  }
}
