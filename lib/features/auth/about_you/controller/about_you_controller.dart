import 'package:get/get.dart';
import 'package:care_bridge/routes/app_routes.dart';

class AboutYouController extends GetxController {
  var age = 28.obs;

  void incrementAge() {
    age.value++;
  }

  void decrementAge() {
    if (age.value > 1) {
      age.value--;
    }
  }

  void continueToNext() {
    Get.toNamed(AppRoutes.selectGenderScreen);
  }
}
