import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:latihan1_11pplg1/models/clientnetwork.dart';
import 'package:latihan1_11pplg1/models/login_model.dart';
import 'package:latihan1_11pplg1/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginApiController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var isLoading = false.obs;

  // ✅ DATA GOOGLE UNTUK PROFILE PAGE
  var googleName = "".obs;
  var googleEmail = "".obs;
  var googlePhoto = "".obs;

  @override
  void onInit() {
    super.onInit();
    loadGoogleData();
  }

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
        final prefs = await SharedPreferences.getInstance();

        // ✅ Cek apakah login via Google
        final isGoogleLogin = prefs.getBool("google_logged_in") ?? false;

        if (isGoogleLogin) {
          // ✅ Logout Google
          await GoogleSignIn().signOut();
          await FirebaseAuth.instance.signOut();
        }

        // ✅ Bersihkan semua data login
        await prefs.clear();

        // ✅ Kembali ke login
        Get.offAllNamed(AppRoutes.loginapi);

        Get.snackbar(
          "Logout",
          "Anda telah logout",
          snackPosition: SnackPosition.BOTTOM,
        );
      },
    );
  }

  // LOG IN WITH GOOGLE

  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> loginWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return;

      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);

      // ✅ Setelah login sukses
      final prefs = await SharedPreferences.getInstance();

      googleName.value = googleUser.displayName ?? "";
      googleEmail.value = googleUser.email;
      googlePhoto.value = googleUser.photoUrl ?? "";

      await prefs.setString("google_name", googleName.value);
      await prefs.setString("google_email", googleEmail.value);
      await prefs.setString("google_photo", googlePhoto.value);
      await prefs.setBool("google_logged_in", true);

      Get.snackbar("Success", "Login Google sukses!");
      Get.offAllNamed(AppRoutes.calculator);
    } catch (e) {
      print("Google Sign-In Error: $e");
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> loadGoogleData() async {
    final prefs = await SharedPreferences.getInstance();

    googleName.value = prefs.getString("google_name") ?? "";
    googleEmail.value = prefs.getString("google_email") ?? "";
    googlePhoto.value = prefs.getString("google_photo") ?? "";
  }
}
