import 'package:get/get.dart';
import 'package:latihan1_11pplg1/models/characternetwork.dart';
import 'package:latihan1_11pplg1/models/hsr_character_model.dart';


class CharacterController extends GetxController {
  var characters = <CharacterList>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    fetchCharacterList();
    super.onInit();
  }

fetchCharacterList() async {
  try {
    isLoading(true);
    final data = await Characternetwork.fetchCharacters();

    // Debug check
    print('Fetched ${data.length} characters');
    print('First character: ${data.first.name}');

    characters.assignAll(data);
  } catch (e) {
    Get.snackbar('Error', e.toString());
  } finally {
    isLoading(false);
  }
}

}
