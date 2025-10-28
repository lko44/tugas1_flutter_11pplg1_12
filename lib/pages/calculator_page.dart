import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan1_11pplg1/controllers/calculator_controller.dart';
import 'package:latihan1_11pplg1/controllers/login_api_controller.dart';
import 'package:latihan1_11pplg1/routes/routes.dart';
import 'package:latihan1_11pplg1/widgets/button.dart';
import 'package:latihan1_11pplg1/widgets/widget_textField.dart';

class CalculatorPage extends StatelessWidget {
  CalculatorPage({super.key});

  final calculatorController = Get.find<CalculatorController>();
  final controller = Get.find<LoginApiController>();

  void _clearFields() {
    calculatorController.txtAngka1.clear();
    calculatorController.txtAngka2.clear();
    calculatorController.Hasil.value = "";
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          "🧮 Simple Calculator",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 2,
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Card(
            elevation: 6,
            shadowColor: Colors.black26,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Enter Two Numbers",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 20),
                  MyTextField(
                    textEditingController: calculatorController.txtAngka1,
                    label: "Angka 1",
                    isObscured: false,
                  ),
                  const SizedBox(height: 10),
                  MyTextField(
                    textEditingController: calculatorController.txtAngka2,
                    label: "Angka 2",
                    isObscured: false,
                  ),
                  const SizedBox(height: 25),

                  // Operation Buttons
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 12,
                    runSpacing: 12,
                    children: [
                      _buildOpButton("+", calculatorController.tambah),
                      _buildOpButton("-", calculatorController.kurang),
                      _buildOpButton("×", calculatorController.kali),
                      _buildOpButton("÷", calculatorController.bagi),
                    ],
                  ),

                  const SizedBox(height: 25),
                  Obx(() => Text(
                        "Hasil: ${calculatorController.Hasil.value}",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        ),
                      )),
                  const SizedBox(height: 20),

                  // Clear Button
                  ElevatedButton.icon(
                    onPressed: _clearFields,
                    icon: const Icon(Icons.refresh),
                    label: const Text("Clear"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Navigation Buttons
                  const Divider(),
                  const SizedBox(height: 10),
                  const Text(
                    "Navigation",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  _buildNavButton("⚽ To Football", AppRoutes.footballmobile),
                  _buildNavButton("🌌 HSR Character List", AppRoutes.hsrClist),
                  _buildNavButton("🐴 Uma Character List", AppRoutes.umaClist),
                  const SizedBox(height: 10),
                  _buildLogoutButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOpButton(String label, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
      ),
      child: Text(label, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildNavButton(String text, String route) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: ElevatedButton(
        onPressed: () => Get.toNamed(route),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.tealAccent[700],
          foregroundColor: Colors.white,
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
        child: Text(text, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
      ),
    );
  }

  Widget _buildLogoutButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: ElevatedButton.icon(
        onPressed: () {
          Get.find<LoginApiController>().logout();
        },
        icon: const Icon(Icons.logout),
        label: const Text("Logout"),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
      ),
    );
  }
}
