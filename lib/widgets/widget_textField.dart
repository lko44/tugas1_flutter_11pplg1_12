import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MytextField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController textEditingController;

  const MytextField({
    super.key,
    required this.textEditingController,
    required this.hint,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    bool isNumberField = label.toLowerCase().contains('angka');

    return TextField(
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: const OutlineInputBorder(),
      ),
      controller: textEditingController,
      keyboardType: isNumberField ? TextInputType.number : TextInputType.text,
      inputFormatters: isNumberField
          ? <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly]
          : null,
    );
  }
}
