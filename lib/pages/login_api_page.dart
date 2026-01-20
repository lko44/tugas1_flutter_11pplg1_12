import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan1_11pplg1/controllers/login_api_controller.dart';
import 'package:latihan1_11pplg1/widgets/button.dart';
import 'package:latihan1_11pplg1/widgets/widget_textField.dart';

class LoginApiPage extends StatelessWidget {
  LoginApiPage({super.key});
  final controller = Get.find<LoginApiController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      resizeToAvoidBottomInset: true, // ⬅️ penting
      body: SafeArea(
        child: SingleChildScrollView(
          // ⬅️ biar gak overflow saat keyboard muncul
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Text(
                "Welcome Back 👋",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Login to continue using the app",
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 40),

              // Username
              MyTextField(
                textEditingController: controller.usernameController,
                label: "Username",
              ),
              const SizedBox(height: 16),

              // Password
              MyTextField(
                textEditingController: controller.passwordController,
                label: "Password",
                isObscured: true,
              ),
              const SizedBox(height: 30),

              // Login Button
              Obx(
                () => SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: CustomButton(
                    text: controller.isLoading.value ? "Loading..." : "Login",
                    textcolor: Colors.white,
                    isLoading: controller.isLoading.value,
                    onPressed: controller.loginapi,
                  ),
                ),
              ),

              const SizedBox(height: 24),
              // Footer text
              // Center(
              //   child: TextButton(
              //     onPressed: () {
              //       Get.snackbar(
              //         'Nihahahaha',
              //         'Kasihan deh loh lupa passwordnya :V',
              //         snackPosition: SnackPosition.BOTTOM,
              //       );
              //     },
              //     child: const Text(
              //       "Forgot Password?",
              //       style: TextStyle(
              //         color: Colors.blueAccent,
              //         fontSize: 15,
              //       ),
              //     ),
              //   ),
              // ),
              GestureDetector(
                onTap: () => controller.loginWithGoogle(),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ2sSeQqjaUTuZ3gRgkKjidpaipF_l6s72lBw&s",
                        height: 24,
                      ),
                      SizedBox(width: 12),
                      Text(
                        "Login with Google",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
