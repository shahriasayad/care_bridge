import 'package:get/get.dart';
import 'package:care_bridge/routes/app_routes.dart';

class SelectHeightController extends GetxController {
  // Height in inches, default 5' 10" is 70 inches (5 * 12 + 10)
  var heightInInches = 70.obs;

  void incrementHeight() {
    heightInInches.value++;
  }

  void decrementHeight() {
    if (heightInInches.value > 12) { // Minimally 1 foot
      heightInInches.value--;
    }
  }

  String get formattedHeight {
    int feet = heightInInches.value ~/ 12;
    int inches = heightInInches.value % 12;
    return "$feet' $inches\"";
  }

  void continueToNext() {
    Get.toNamed(AppRoutes.selectActivityScreen);
  }
}
