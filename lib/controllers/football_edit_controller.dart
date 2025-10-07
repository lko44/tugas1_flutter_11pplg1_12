import 'package:flutter/material.dart';
import 'football_controller.dart';
import 'package:latihan1_11pplg1/models/football_model.dart';
import 'package:get/get.dart';

class FootballEditController extends GetxController {
  late int index;
  late Rx<FootballPlayer> player;
  final FootballController footballController = Get.find();

  // text editing controllers
  late TextEditingController nameController;
  late TextEditingController positionController;
  late TextEditingController numberController;

  @override
  void onInit() {
    super.onInit();

    final args = Get.arguments as Map<String, dynamic>;
    index = args['index'] as int;
    FootballPlayer initialPlayer = args['player'] as FootballPlayer;

    player = initialPlayer.obs;

    // assign to textcontrollers
    nameController = TextEditingController(text: initialPlayer.name);
    positionController = TextEditingController(text: initialPlayer.position);
    numberController = TextEditingController(text: initialPlayer.number.toString());
  }

  void updateName(String value) => player.update((p) {
        if (p != null) p.name = value;
      });

  void updatePosition(String value) => player.update((p) {
        if (p != null) p.position = value;
      });

  void updateNumber(int value) => player.update((p) {
        if (p != null) p.number = value;
      });

  void saveChanges() {
    footballController.updatePlayer(index, player.value);
    Get.back();
  }

  @override
  void onClose() {
    nameController.dispose();
    positionController.dispose();
    numberController.dispose();
    super.onClose();
  }
}
