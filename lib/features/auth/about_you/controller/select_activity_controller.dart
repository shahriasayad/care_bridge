import 'package:get/get.dart';
import 'package:care_bridge/routes/app_routes.dart';

class SelectActivityController extends GetxController {
  var selectedActivity = 'Light Active'.obs;

  void selectActivity(String activity) {
    selectedActivity.value = activity;
  }

  void continueToNext() {
    Get.toNamed(AppRoutes.selectDietScreen);
  }
}
