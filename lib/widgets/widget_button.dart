import 'package:flutter/material.dart';

class MyCalcButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final TextEditingController controller;
  const MyCalcButton({
    super.key,
    required this.onPressed,
    required this.label,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        final number1 = double.tryParse(controller.text);
        final number2 = double.tryParse(controller.text);
        if (number1 != null && number2 != null) {
          final hasil = number1 + number2;
          if (hasil % 1 == 0) {
            controller.text = hasil.toInt().toString();
          }
        } else {
          controller.text = "Masukkan dulu angkanya, pls.";
        }
      },
      child: Text(label),
    );
  }
}