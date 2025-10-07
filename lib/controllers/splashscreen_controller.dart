import 'package:get/get.dart';
import 'package:latihan1_11pplg1/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashscreenController extends GetxController{
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    //check if username is stored
    checkLogin();
  }


  checkLogin()async{
    final prefs = await SharedPreferences.getInstance();
    final savedUsername = prefs.getString("username");
    await Future.delayed(Duration(seconds: 5));
    if(savedUsername != null){
      Get.offAllNamed(AppRoutes.calculator);
    }else{
      Get.offAllNamed(AppRoutes.loginpage);
    }
  }
}