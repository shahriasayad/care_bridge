import 'package:get/get.dart';
import 'package:care_bridge/routes/app_routes.dart';

class SelectGenderController extends GetxController {
  var selectedGender = 'Male'.obs;

  void selectGender(String gender) {
    selectedGender.value = gender;
  }

  void continueToNext() {
    Get.toNamed(AppRoutes.selectUnitsScreen);
  }
}
