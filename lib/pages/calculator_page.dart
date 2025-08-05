import 'package:flutter/material.dart';
import 'package:latihan1_11pplg1/pages/controllers/calculator_controller.dart';
import 'package:latihan1_11pplg1/widgets/button.dart';
import 'package:latihan1_11pplg1/widgets/widget_textField.dart';
import 'package:get/get.dart';


class CalculatorPage extends StatelessWidget {
  CalculatorPage({super.key});

  final CalculatorController calculatorController = Get.put(CalculatorController());

    void _clearFields() {
    calculatorController.txtAngka1.clear();
    calculatorController.txtAngka2.clear();
    calculatorController.Hasil.value = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Something"),),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MytextField(textEditingController: calculatorController.txtAngka1, hint: "Masukan angka 1", label: "Angka 1"
          ),
          MytextField(textEditingController: calculatorController.txtAngka2, hint: "Masukan Angka 2", label: "Angka 2"),
Container(
  margin: EdgeInsets.all(10),
  child: Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomButton(text: "+", textcolor: Colors.blue, onPressed: () {
            calculatorController.tambah();
          }),
          CustomButton(text: "-", textcolor: Colors.blue, onPressed: () {
            calculatorController.kurang();
          }),
        ],
      ),
      const SizedBox(height: 10), // Spasi antar Row
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomButton(text: "*", textcolor: Colors.blue, onPressed: () {
            calculatorController.kali();
          }),
          CustomButton(text: "/", textcolor: Colors.blue, onPressed: () {
            calculatorController.bagi();
          }),
        ],
      ),
    ],
  ),
),

        Obx((){
         return Text ("Hasil: "+calculatorController.Hasil.value); 
        }),
        CustomButton(text: "Clear", textcolor: Colors.black, onPressed: (){
          _clearFields();
        })
        ],
      ),

    );
  }
}