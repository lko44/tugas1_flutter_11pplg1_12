import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan1_11pplg1/controllers/login_api_controller.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final controller = Get.find<LoginApiController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: Center(
        child: Obx(() {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ✅ GOOGLE PHOTO
              CircleAvatar(
                radius: 50,
                backgroundImage: controller.googlePhoto.value.isEmpty
                    ? AssetImage("assets/default.png")
                    : NetworkImage(controller.googlePhoto.value)
                        as ImageProvider,
              ),

              SizedBox(height: 16),

              // ✅ GOOGLE NAME
              Text(
                controller.googleName.value,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 8),

              // ✅ GOOGLE EMAIL
              Text(
                controller.googleEmail.value,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ],
          );
        }),
      ),
    );
  }
}
