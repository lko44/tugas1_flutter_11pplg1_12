import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/notification_controller.dart';

class NotificationsPage extends StatelessWidget {
  NotificationsPage({super.key});

  final controller = Get.find<NotificationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Notification History")),
      body: Obx(() {
        if (controller.notifications.isEmpty) {
          return const Center(child: Text("No notifications yet"));
        }

        return ListView.builder(
          itemCount: controller.notifications.length,
          itemBuilder: (context, index) {
            final notif = controller.notifications[index];
            return ListTile(
              title: Text(notif.title),
              subtitle: Text(notif.body),
              trailing: Text(
                "${notif.timestamp.hour}:${notif.timestamp.minute.toString().padLeft(2, '0')}",
              ),
            );
          },
        );
      }),
    );
  }
}
