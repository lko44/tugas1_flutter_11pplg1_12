import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan1_11pplg1/models/clientnetwork.dart';
import 'package:latihan1_11pplg1/models/login_model.dart';
import 'package:latihan1_11pplg1/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginApiController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var isLoading = false.obs;

  // 🔹 LOGIN FUNCTION
  Future<void> loginapi() async {
    final username = usernameController.text.trim();
    final password = passwordController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      Get.snackbar(
        'Error',
        'Username and password required',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    try {
      isLoading.value = true; // start loading

      final response = await ClientNetwork.postData("login", {
        'username': username,
        'password': password,
      });

      debugPrint('login status: ${response.statusCode}');
      debugPrint('login body: ${response.body}');

      if (response.statusCode == 200 && response.body.isNotEmpty) {
        final data = welcomeFromJson(response.body);

        if (data.status == true && data.token.isNotEmpty) {
          // ✅ Login success → simpan token & username ke SharedPreferences
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString("username", username);
          await prefs.setString("token", data.token);

          Get.snackbar(
            'Success',
            data.message,
            snackPosition: SnackPosition.BOTTOM,
          );
          Get.offNamed(AppRoutes.calculator);
        } else {
          Get.snackbar(
            'Login failed',
            data.message,
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      } else {
        Get.snackbar(
          'Server error',
          'Status code: ${response.statusCode}',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      debugPrint('login error: $e');
      Get.snackbar(
        'Error',
        'Username or password wrong',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = true; // stop loading
    }
  }

  // 🔹 LOGOUT
Future<void> logout() async {
  Get.defaultDialog(
    title: "Konfirmasi",
    middleText: "Apakah kamu yakin ingin Log out? :(",
    textCancel: "NO",
    textConfirm: "Yes",
    confirmTextColor: Colors.white,
    onConfirm: () async {
      // --- Hapus token FCM ---

      // --- (Opsional) hapus data login user ---
      await SharedPreferences.getInstance().then((prefs) => prefs.clear());

      // --- Pindah ke halaman login ---
      Get.offAllNamed(AppRoutes.loginapi);

      Get.snackbar("Logout", "Bye Bye", snackPosition: SnackPosition.BOTTOM);
    },
  );
}

}