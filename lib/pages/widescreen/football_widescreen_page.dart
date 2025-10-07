import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:latihan1_11pplg1/controllers/football_controller.dart';
import 'package:latihan1_11pplg1/routes/routes.dart';

class FootballWidescreenPage extends StatelessWidget {
  FootballWidescreenPage({super.key});

  final controller = Get.find<FootballController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          'football team',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 2,
        backgroundColor: Colors.blue[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Obx(
          () => GridView.builder(
            itemCount: controller.players.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // number of columns
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 3 / 2, // width/height ratio
            ),
            itemBuilder: (context, index) {
              final player = controller.players[index];
              return GestureDetector(
                onTap: () {
                  Get.snackbar(
                    'Item clicked',
                    player.name,
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.black87,
                    colorText: Colors.white,
                    borderRadius: 12,
                    margin: const EdgeInsets.all(12),
                  );
                  Get.toNamed(
                    AppRoutes.footballeditplayers,
                    arguments: {'index': index, 'player': player},
                  );
                },
                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(player.profileImage),
                          radius: 30,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          player.name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          '${player.position}, #${player.number}',
                          style: TextStyle(color: Colors.grey[600]),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
