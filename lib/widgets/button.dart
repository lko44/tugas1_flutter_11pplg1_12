import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color textcolor;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.text,
    required this.textcolor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green[700],
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 3,
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: textcolor,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
