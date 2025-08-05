import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {

  final String text;
  final Color textcolor;
  final VoidCallback onPressed;

  const CustomButton({super.key,required this.text,required this.textcolor,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      
      child: Text(text,style: TextStyle(color: textcolor),),
    );
    
  }
}
