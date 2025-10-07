import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan1_11pplg1/widgets/button.dart';
import 'package:latihan1_11pplg1/widgets/widget_textField.dart';
// Change this import:
import '../controllers/login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Use LoginController with GetX
  final LoginController _loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login page")),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              "Siilahkan Masukan Username Dan Password",
              style: TextStyle(fontSize: 20, color: (Colors.blue)),
            ),
            Image.asset(
              'assets/images/SWIM.jpg',
              height: 120,
              width: 120,
              fit: BoxFit.cover,
            ),
            MyTextField(
              textEditingController: _loginController.usernameController,
              label: "Username", isObscured: false,
            ),
            MyTextField(
              textEditingController: _loginController.passwordController,
              label: "Password", isObscured: false,
            ),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 30),
                  // Tombol Login
                  CustomButton(
                    text: "Login",
                    textcolor: Colors.green,
                    onPressed: () {
                      _loginController.login();
                    },
                  ),
                  CustomButton(
                    text: "Register",
                    textcolor: Colors.blue,
                    onPressed: () {
                      // Get.toNamed(AppRoutes.register); // Uncomment and set route if needed
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}