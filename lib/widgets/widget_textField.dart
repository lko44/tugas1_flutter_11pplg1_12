import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String label;
  final bool isObscured;
  final Color maincolor;
  final Color fillcolor;
  final ValueChanged<String>? onChanged;

  const MyTextField({
    super.key,
    required this.textEditingController,
    this.onChanged,
    this.label = "default",
    this.isObscured = false,
    this.maincolor = Colors.blue,
    this.fillcolor = Colors.white,
  });


  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isObscured,
      controller: textEditingController,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: maincolor),
        filled: true,
        fillColor: fillcolor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: maincolor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: maincolor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: maincolor, width: 2),
        ),
      ),
    );
  }
}