import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:latihan1_11pplg1/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController{

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  //save username ke sharedpreferenced
  login()async{
    if (usernameController.text.toString() == "admin" &&
        passwordController.text.toString() == "admin") {
          final prefs = await SharedPreferences.getInstance();
          prefs.setString("username", usernameController.text.toString());
          Get.offAllNamed(AppRoutes.calculator);
    }else{
      Get.snackbar("error", "incorrect username or password");
    }
  }
}