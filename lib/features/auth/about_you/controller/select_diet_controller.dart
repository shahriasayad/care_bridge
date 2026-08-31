import 'package:get/get.dart';
import 'package:care_bridge/routes/app_routes.dart';

class SelectDietController extends GetxController {
  var selectedDiet = 'Balanced'.obs;

  void selectDiet(String diet) {
    selectedDiet.value = diet;
  }

  void continueToNext() {
    Get.toNamed(AppRoutes.selectGoalsScreen);
  }
}
