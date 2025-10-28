import 'package:get/get.dart';
import 'package:latihan1_11pplg1/controllers/login_api_controller.dart';
import 'package:latihan1_11pplg1/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashscreenController extends GetxController {
@override
void onInit() {
  super.onInit();
  Future.delayed(const Duration(seconds: 2), () {
    checkLoginStatus();
  });
}

  // 🔹 AUTO LOGIN CHECK
  Future<void> checkLoginStatus() async {
    await Future.delayed(
      const Duration(milliseconds: 800),
    ); // kasih waktu splashscreen tampil

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

    if (token != null && token.isNotEmpty) {
      print('Auto login with token: $token');
      Get.offAllNamed(AppRoutes.calculator);
    } else {
     Get.offAllNamed(AppRoutes.loginapi); 
    }
  }
}
