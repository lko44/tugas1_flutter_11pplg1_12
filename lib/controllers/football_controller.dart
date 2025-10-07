import 'package:get/get.dart';
import 'package:latihan1_11pplg1/models/football_model.dart';

class FootballController extends GetxController {
  var players = <FootballPlayer>[
    FootballPlayer(profileImage: "assets/images/Messi.jpg", name: "Lionel Messi", position: "Forward (RW)", number: 10),
    FootballPlayer(profileImage: "assets/images/Ronaldo.png", name: "Cristiano Ronaldo", position: "Forward (ST)", number: 7),
    FootballPlayer(profileImage: "assets/images/Kevin.jpg", name: "Kevin De Bruyne", position: "Midfielder (CM)", number: 17),
    FootballPlayer(profileImage: "assets/images/Virgil.jpg", name: "Virgil van Dijk", position: "Defender (CB)", number: 4),
    FootballPlayer(profileImage: "assets/images/Manuel.jpg", name: "Manuel Neuer", position: "Goalkeeper", number: 1),

  ].obs;

  void updatePlayer(int index, FootballPlayer updatedPlayer) {
    players[index] = updatedPlayer;
  }
}
