import 'package:get/get.dart';
import 'package:care_bridge/routes/app_routes.dart';

class SelectMotivationController extends GetxController {
  var motivationLevel = 8.obs;

  void updateMotivation(int value) {
    motivationLevel.value = value;
  }

  String get motivationLabel {
    int value = motivationLevel.value;
    if (value <= 2) return "Not Motivated";
    if (value <= 4) return "Slightly Motivated";
    if (value <= 6) return "Moderately Motivated";
    if (value <= 8) return "Very Motivated";
    return "Extremely Motivated";
  }

  void continueToNext() {
    Get.toNamed(AppRoutes.selectConditionsScreen);
  }
}
