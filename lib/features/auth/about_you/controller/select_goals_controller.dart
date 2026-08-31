import 'package:get/get.dart';
import 'package:care_bridge/routes/app_routes.dart';

class SelectGoalsController extends GetxController {
  var selectedGoals = <String>[].obs;

  void toggleGoal(String goal) {
    if (selectedGoals.contains(goal)) {
      selectedGoals.remove(goal);
    } else {
      selectedGoals.add(goal);
    }
  }

  bool isSelected(String goal) {
    return selectedGoals.contains(goal);
  }

  void continueToNext() {
    Get.toNamed(AppRoutes.selectMotivationScreen);
  }
}
