import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan1_11pplg1/controllers/contact_controller.dart';
import 'package:latihan1_11pplg1/widgets/button.dart';
import 'package:latihan1_11pplg1/widgets/widget_textField.dart';

class ContactPage extends StatelessWidget {
  ContactPage({super.key});
  final controller = Get.find<ContactController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("contact"), backgroundColor: Colors.indigo),
      body: Column(
        children: [
          Padding(padding: EdgeInsets.all(10)),
          Row(
            children: [
              Expanded(
                child: MyTextField(
                  textEditingController: controller.nameController,
                  label: "Masukan Nama",
                  isObscured: false,
                ),
              ),
              SizedBox(width: 8),
              CustomButton(
                text: "Save",
                textcolor: Colors.white,
                onPressed: () {
                  controller.addName();
                },
              ),
            ],
          ),
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: controller.names.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    margin: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text(controller.names[index]),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          controller.deleteName(index);
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
