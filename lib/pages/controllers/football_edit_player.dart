import 'football_controller.dart';
import 'package:latihan1_11pplg1/models/football_model.dart';
import 'package:get/get.dart';

class FootballEditController extends GetxController{
  //late since its not assigned yet
  late int index;
  late Rx<FootballPlayer> player;
  //find my controllers
  final FootballController footballController = Get.find();

  //on initiate
  @override
  void onInit() {
    super.onInit();

    //retrieve arguments that got passed from football page
    final args = Get.arguments as Map<String, dynamic>;
    index = args['index'] as int;
    FootballPlayer initialPlayer = args['player'] as FootballPlayer;

    player = initialPlayer.obs;
  }

  //update functions, yay
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
  }
}



