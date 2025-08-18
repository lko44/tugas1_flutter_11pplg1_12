import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:latihan1_11pplg1/pages/controllers/football_controller.dart';
import 'package:latihan1_11pplg1/routes/routes.dart';

//what is going on bro
class FootballPage extends StatelessWidget {
  FootballPage({super.key});
  final FootballController footballController = Get.put(FootballController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          'fooball team',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 2,
        backgroundColor: Colors.green[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        //obx since this updates and stuff
        child: Obx(
          //built in adapter
          () => ListView.builder(
            itemCount: footballController.players.length,
            itemBuilder: (context, index) {
              //grab individual player object from array
              final player = footballController.players[index];
              //awesome card
              return Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                margin: const EdgeInsets.symmetric(vertical: 8),
                //list tile as child of card
                child: ListTile(
                  //style stuff
                  contentPadding: const EdgeInsets.all(16),
                  //image
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(player.profileImage),
                  ),
                  //actual tile content
                  title: Text(
                    player.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: Text(
                    '${player.position}, #${player.number}',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  //tap functionality
                  onTap: () {
                    //i could go for a snack(bar)
                    Get.snackbar(
                      'Item clicked',
                      player.name,
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.black87,
                      colorText: Colors.white,
                      borderRadius: 12,
                      margin: const EdgeInsets.all(12),
                    );
                    //navigate to edit page, and also pass arguments n stuff
                    Get.toNamed(
                      AppRoutes.footballeditplayers,
                      arguments: {'index': index, 'player': player},
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
