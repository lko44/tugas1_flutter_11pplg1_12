import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan1_11pplg1/pages/controllers/football_edit_player.dart';
import 'package:latihan1_11pplg1/widgets/button.dart';
import 'package:latihan1_11pplg1/widgets/widget_textField.dart';

//argghhh
class FootballEditPage extends StatelessWidget {
  const FootballEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    //this thingy
    final editController = Get.put(FootballEditController());

    //controllers, which also has text auto assigned when opening (wow)
    final nameController = TextEditingController(
      text: editController.player.value.name,
    );
    final positionController = TextEditingController(
      text: editController.player.value.position,
    );
    final numberController = TextEditingController(
      text: editController.player.value.number.toString(),
    );

    //scaff old
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('edit yo fooball'),
        backgroundColor: Colors.green[700],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            
            //name input
            MyTextField(
              textEditingController: nameController,
              label: 'Name',
              isObscured: false,
              onChanged: editController.updateName,
            ),

            const SizedBox(height: 16),

            //position input
            MyTextField(
              textEditingController: positionController,
              label: 'Position',
              isObscured: false,
              onChanged: editController.updatePosition,
            ),

            const SizedBox(height: 16),

            //back number input
MyTextField(
  textEditingController: numberController,
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

            //save button
            CustomButton(
              text: 'Save Changes',
              textcolor: Colors.white,
              onPressed: () {
                editController.saveChanges();
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}
