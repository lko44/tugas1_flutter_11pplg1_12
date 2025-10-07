import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan1_11pplg1/controllers/football_edit_controller.dart';
import 'package:latihan1_11pplg1/widgets/button.dart';
import 'package:latihan1_11pplg1/widgets/widget_textField.dart';

class FootballEditPage extends StatelessWidget {
  const FootballEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final editController = Get.put(FootballEditController());
      final editController = Get.find<FootballEditController>();

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('edit yo football'),
        backgroundColor: Colors.green[700],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MyTextField(
              textEditingController: editController.nameController,
              label: 'Name',
              isObscured: false,
              onChanged: editController.updateName,
            ),
            const SizedBox(height: 16),

            MyTextField(
              textEditingController: editController.positionController,
              label: 'Position',
              isObscured: false,
              onChanged: editController.updatePosition,
            ),
            const SizedBox(height: 16),

            MyTextField(
              textEditingController: editController.numberController,
              label: 'Number',
              isObscured: false,
              onChanged: (value) {
                final number = int.tryParse(value);
                if (number != null) {
                  editController.updateNumber(number);
                }
              },
            ),
            const SizedBox(height: 24),

            CustomButton(
              text: 'Save Changes',
              textcolor: Colors.white,
              onPressed: () {
                editController.saveChanges();
                
              },
            ),
          ],
        ),
      ),
    );
  }
}
