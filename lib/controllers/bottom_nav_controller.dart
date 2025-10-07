import 'package:get/get.dart';

class BottomNavController extends GetxController {
  var currentIndex = 0.obs;

  void changeTabIndex(int index) {
  currentIndex.value = index;
}


  String get currentPageTitle {
    switch (currentIndex.value) {
      case 0:
        return 'Home';
      case 1:
        return 'CALCULATOR';
      case 2:
        return 'PLAYERS';
      case 3:
        return 'PROFILE';
      default:
        return '';
    }
  }
}