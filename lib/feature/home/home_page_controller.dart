import 'package:get/state_manager.dart';

class HomePageController extends GetxController {
  var currentIndex = 0.obs;
  void changePage(int index) {
    currentIndex.value = index;
  }
}